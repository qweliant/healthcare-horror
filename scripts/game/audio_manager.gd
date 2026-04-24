extends Node

## Global audio dispatcher. Resolve a stream by short name; play SFX, voice,
## ambient (single-channel with crossfade), layer (stacks atop ambient), or music.
## SFX/voice use small free-finds-channel pools so multiple can stack.

const SFX_POOL_SIZE := 6
const VOICE_POOL_SIZE := 3

const STREAMS := {
	"ambient_scrape":       "uid://b00l4evfgmyhe",
	"animal_crossing_voice":"uid://cowls02kw013v",
	"bill_auto_voice_1":    "uid://ddnn36qgxx1ns",
	"bill_auto_voice_2":    "uid://dl64juvv5rhyr",
	"bill_auto_voice_3":    "uid://cy8e4h0u2svsc",
	"chanting":             "uid://bp61gqh65e8n5",
	"faux_reverse_voice":   "uid://cv8hqw7r73hyf",
	"heartbeats":           "uid://c28t1yhw65u8w",
	"hum_to_shriek":        "uid://cq47afbdbrvr4",
	"light_buzz":           "uid://brg48rg8f7g1m",
	"panic_attack":         "uid://cotgurpms1hpx",
	"party_time":           "uid://bbtxbium3mp5c",
	"people_hum":           "uid://bgnxuol1ypvl8",
	"phone_vibrate":        "uid://cc5tkev6iaxu6",
	"sharp_inhales":        "uid://dcw0jf2dssxpj",
	"sigil_glow":           "uid://bjg6f7ibmwrf4",
	"sliding_door":         "uid://cmfyd27nh7ejd",
	"startling_scrape":     "uid://6r25q4wdmtrj",
	"steps":                "uid://df27y8isumdqo",
	"void_absence":         "uid://brl7fx3h2pcl1",
	"void_emptiness":       "uid://b7w7n1dfjn5au",
	"wind":                 "uid://vee8imeeky6p",
}

# Tracks that should loop when used as ambient/layer (loop_mode set on load).
const LOOPABLE := [
	"light_buzz", "people_hum", "wind",
	"void_absence", "void_emptiness",
	"chanting", "heartbeats",
]

var _streams: Dictionary = {}
var _sfx_pool: Array[AudioStreamPlayer] = []
var _voice_pool: Array[AudioStreamPlayer] = []
var _ambient_player: AudioStreamPlayer
var _ambient_secondary: AudioStreamPlayer
var _layer_player: AudioStreamPlayer
var _music_player: AudioStreamPlayer
var _current_ambient_name: String = ""
var _current_layer_name: String = ""
var _ambient_tween: Tween = null
var _layer_tween: Tween = null


func _ready() -> void:
	_build_pools()


func _resolve(track: String) -> AudioStream:
	if _streams.has(track):
		return _streams[track]
	if not STREAMS.has(track):
		push_warning("AudioManager: unknown track '%s'" % track)
		return null
	var stream: AudioStream = load(STREAMS[track])
	if stream == null:
		push_warning("AudioManager: failed to load '%s' (%s)" % [track, STREAMS[track]])
		return null
	if stream is AudioStreamWAV and track in LOOPABLE:
		(stream as AudioStreamWAV).loop_mode = AudioStreamWAV.LOOP_FORWARD
	_streams[track] = stream
	return stream


func _build_pools() -> void:
	for i in SFX_POOL_SIZE:
		var p := AudioStreamPlayer.new()
		p.name = "SFX_%d" % i
		add_child(p)
		_sfx_pool.append(p)
	for i in VOICE_POOL_SIZE:
		var p := AudioStreamPlayer.new()
		p.name = "Voice_%d" % i
		add_child(p)
		_voice_pool.append(p)
	_ambient_player = AudioStreamPlayer.new()
	_ambient_player.name = "Ambient"
	add_child(_ambient_player)
	_ambient_secondary = AudioStreamPlayer.new()
	_ambient_secondary.name = "AmbientSecondary"
	add_child(_ambient_secondary)
	_layer_player = AudioStreamPlayer.new()
	_layer_player.name = "Layer"
	add_child(_layer_player)
	_music_player = AudioStreamPlayer.new()
	_music_player.name = "Music"
	add_child(_music_player)


# -- One-shots ---------------------------------------------------------------

func play_sfx(track: String, volume_db: float = 0.0, pitch: float = 1.0) -> void:
	var stream: AudioStream = _resolve(track)
	if stream == null:
		return
	var player := _free_player(_sfx_pool)
	player.stream = stream
	player.volume_db = volume_db
	player.pitch_scale = pitch
	player.play()


func play_voice(track: String, volume_db: float = 0.0) -> AudioStreamPlayer:
	var stream: AudioStream = _resolve(track)
	if stream == null:
		return null
	var player := _free_player(_voice_pool)
	player.stream = stream
	player.volume_db = volume_db
	player.pitch_scale = 1.0
	player.play()
	return player


func get_stream(track: String) -> AudioStream:
	return _resolve(track)


func _free_player(pool: Array[AudioStreamPlayer]) -> AudioStreamPlayer:
	for p in pool:
		if not p.playing:
			return p
	return pool[0]


# -- Ambient (single channel, crossfaded) ------------------------------------

func play_ambient(track: String, fade_in: float = 1.0, volume_db: float = -6.0) -> void:
	if track == _current_ambient_name and _ambient_player.playing:
		return
	var stream: AudioStream = _resolve(track)
	if stream == null:
		return

	if _ambient_tween and _ambient_tween.is_valid():
		_ambient_tween.kill()

	if _ambient_player.playing:
		var old_player := _ambient_player
		_ambient_player = _ambient_secondary
		_ambient_secondary = old_player

	_ambient_player.stream = stream
	_ambient_player.volume_db = -60.0
	_ambient_player.play()
	_current_ambient_name = track

	_ambient_tween = create_tween().set_parallel(true)
	_ambient_tween.tween_property(_ambient_player, "volume_db", volume_db, fade_in)
	if _ambient_secondary.playing:
		_ambient_tween.tween_property(_ambient_secondary, "volume_db", -60.0, fade_in)
		_ambient_tween.chain().tween_callback(_ambient_secondary.stop)


func stop_ambient(fade_out: float = 1.0) -> void:
	if not _ambient_player.playing and not _ambient_secondary.playing:
		_current_ambient_name = ""
		return
	if _ambient_tween and _ambient_tween.is_valid():
		_ambient_tween.kill()
	_current_ambient_name = ""
	_ambient_tween = create_tween().set_parallel(true)
	if _ambient_player.playing:
		_ambient_tween.tween_property(_ambient_player, "volume_db", -60.0, fade_out)
	if _ambient_secondary.playing:
		_ambient_tween.tween_property(_ambient_secondary, "volume_db", -60.0, fade_out)
	_ambient_tween.chain().tween_callback(_ambient_player.stop)
	_ambient_tween.tween_callback(_ambient_secondary.stop)


# -- Layer (stacks on top of primary ambient) --------------------------------

func play_layer(track: String, fade_in: float = 1.0, volume_db: float = -10.0) -> void:
	if track == _current_layer_name and _layer_player.playing:
		return
	var stream: AudioStream = _resolve(track)
	if stream == null:
		return
	if _layer_tween and _layer_tween.is_valid():
		_layer_tween.kill()
	_layer_player.stop()
	_layer_player.stream = stream
	_layer_player.volume_db = -60.0
	_layer_player.play()
	_current_layer_name = track
	_layer_tween = create_tween()
	_layer_tween.tween_property(_layer_player, "volume_db", volume_db, fade_in)


func stop_layer(fade_out: float = 1.0) -> void:
	if not _layer_player.playing:
		_current_layer_name = ""
		return
	if _layer_tween and _layer_tween.is_valid():
		_layer_tween.kill()
	_current_layer_name = ""
	_layer_tween = create_tween()
	_layer_tween.tween_property(_layer_player, "volume_db", -60.0, fade_out)
	_layer_tween.tween_callback(_layer_player.stop)


# -- Music -------------------------------------------------------------------

func play_music(track: String, volume_db: float = 0.0) -> void:
	var stream: AudioStream = _resolve(track)
	if stream == null:
		return
	if stream is AudioStreamWAV:
		(stream as AudioStreamWAV).loop_mode = AudioStreamWAV.LOOP_FORWARD
	_music_player.stop()
	_music_player.stream = stream
	_music_player.volume_db = volume_db
	_music_player.play()


func stop_music() -> void:
	_music_player.stop()


# -- Stop everything (clean slate between scenes) ----------------------------

func stop_all() -> void:
	stop_ambient(0.2)
	stop_layer(0.2)
	stop_music()
	for p in _sfx_pool:
		p.stop()
	for p in _voice_pool:
		p.stop()

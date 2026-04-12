class_name DialogueData
extends Resource

# All game dialogue lives here. Each key maps to an array of dialogue lines.
# Format: { speaker: String, text: String }

static var dialogues := {
	"nurse_checkout": [
		{"speaker": "Nurse", "text": "Alright, you're all set to go."},
		{"speaker": "Nurse", "text": "Just need to settle the bill before you leave."},
		{"speaker": "Nurse", "text": "Let me pull that up for you..."},
		{"speaker": "", "text": "[The printer whirs for an uncomfortably long time]"},
		{"speaker": "Nurse", "text": "Here you are."},
	],
	"bill_reveal": [
		{"speaker": "", "text": "You look at the bill."},
		{"speaker": "Bill", "text": "TOTAL AMOUNT DUE: %BILL%"},
		{"speaker": "", "text": "Your vision blurs."},
		{"speaker": "You", "text": "There has to be... some kind of mistake."},
		{"speaker": "Nurse", "text": "I'm afraid that's correct. Three nights in the ICU, medications, imaging..."},
		{"speaker": "Nurse", "text": "We do offer payment plans."},
		{"speaker": "You", "text": "..."},
		{"speaker": "Nurse", "text": "You can discuss it with billing. For now, you're free to go."},
	],
	"waiting_room_patient_1": [
		{"speaker": "Patient", "text": "Been waiting here six hours. SIX."},
		{"speaker": "Patient", "text": "There's only two doctors on tonight."},
		{"speaker": "Patient", "text": "Two. For this whole place."},
	],
	"waiting_room_patient_2": [
		{"speaker": "Patient", "text": "I can't afford to be here."},
		{"speaker": "Patient", "text": "But I can't afford NOT to be here either."},
		{"speaker": "Patient", "text": "Funny how that works."},
	],
	"phone_call": [
		{"speaker": "", "text": "Your phone buzzes. Unknown number."},
		{"speaker": "You", "text": "Hello?"},
		{"speaker": "???", "text": "I heard you have some... financial difficulties."},
		{"speaker": "You", "text": "Who is this? How did you get my number?"},
		{"speaker": "???", "text": "That's not important. What IS important is that I have work."},
		{"speaker": "???", "text": "Simple job. One night. Enough to make a real dent in that debt."},
		{"speaker": "You", "text": "What kind of job?"},
		{"speaker": "???", "text": "The kind where you don't ask questions."},
		{"speaker": "???", "text": "I'll send you the address. Be there at midnight."},
		{"speaker": "", "text": "[The line goes dead]"},
		{"speaker": "", "text": "A text arrives with an address you don't recognize."},
	],
	"exit_door": [
		{"speaker": "", "text": "The automatic doors slide open. Cold air hits you."},
		{"speaker": "", "text": "The parking lot stretches out under flickering lights."},
	],

	# ========== CAR RIDE ==========

	"car_ride_0": [
		{"speaker": "", "text": "A black sedan idles at the curb. The back door is already open."},
		{"speaker": "", "text": "You get in. The driver doesn't turn around."},
		{"speaker": "", "text": "..."},
		{"speaker": "", "text": "The streetlights blur past. You don't recognize this part of town."},
		{"speaker": "Driver", "text": "Almost there."},
		{"speaker": "", "text": "Those are the only words spoken the entire ride."},
	],

	# ========== JOB 1: WAREHOUSE ==========

	"job_arrival_0": [
		{"speaker": "", "text": "The car stops. The driver points toward a warehouse."},
		{"speaker": "", "text": "No sign. No address. Just a rusted loading dock door, slightly ajar."},
		{"speaker": "", "text": "Orange light leaks from inside."},
	],

	"job_meeting_0": [
		{"speaker": "", "text": "Three figures stand in a loose circle near the back of the warehouse."},
		{"speaker": "???", "text": "You're the new one."},
		{"speaker": "You", "text": "I was told there'd be work."},
		{"speaker": "???", "text": "There is. Simple job. You do what we say, you get paid."},
		{"speaker": "???", "text": "Don't touch anything unless we tell you to."},
		{"speaker": "???", "text": "And don't ask what it's for."},
	],

	# -- Leader dialogue (escalating) --
	"job0_leader_0": [
		{"speaker": "Leader", "text": "When we're ready, you stand on the mark."},
		{"speaker": "Leader", "text": "Hands at your sides. Eyes forward."},
		{"speaker": "Leader", "text": "Whatever you hear, don't move."},
	],
	"job0_leader_1": [
		{"speaker": "Leader", "text": "You're not here to understand. You're here to stand."},
		{"speaker": "Leader", "text": "The circle needs a fourth. That's you."},
		{"speaker": "Leader", "text": "When the shape speaks, let it speak through you."},
	],
	"job0_leader_2": [
		{"speaker": "Leader", "text": "The vessel must be hollow. Hollow and willing."},
		{"speaker": "Leader", "text": "Your debt makes you hollow. That's why you're here."},
		{"speaker": "Leader", "text": "Go to the sigil. It's time."},
	],

	# -- Cult member 1 dialogue --
	"job0_member1_0": [
		{"speaker": "Figure", "text": "First time?"},
		{"speaker": "You", "text": "Yeah."},
		{"speaker": "Figure", "text": "You get used to it. The ringing stops after a day or two."},
	],
	"job0_member1_1": [
		{"speaker": "Figure", "text": "Don't look at the floor when it starts."},
		{"speaker": "Figure", "text": "Or do. Some people say it helps them forget faster."},
	],

	# -- Cult member 2 dialogue --
	"job0_member2_0": [
		{"speaker": "Figure", "text": "..."},
		{"speaker": "Figure", "text": "You smell like a hospital."},
	],
	"job0_member2_1": [
		{"speaker": "Figure", "text": "The red is normal. It washes off."},
		{"speaker": "Figure", "text": "Most of it washes off."},
	],

	# -- Ritual --
	"job_ritual_0": [
		{"speaker": "", "text": "You step onto the sigil. The concrete is warm."},
		{"speaker": "", "text": "The three figures begin to hum. Low. Resonant."},
		{"speaker": "", "text": "The lines on the floor start to glow."},
		{"speaker": "Leader", "text": "Sta ke'voth. Rha'um din feralis."},
		{"speaker": "", "text": "You feel your hands go numb."},
		{"speaker": "", "text": "The humming gets louder. It's inside your skull now."},
		{"speaker": "Voices", "text": "VER'THAKAN. VER'THAKAN. VER'THAKAN."},
		{"speaker": "", "text": "The light becomes blinding."},
	],

	# -- Aftermath --
	"job_aftermath_0": [
		{"speaker": "", "text": "..."},
		{"speaker": "", "text": "You're on the floor. Your hands are wet."},
		{"speaker": "", "text": "Red. Everything is red."},
		{"speaker": "", "text": "You don't remember what happened."},
		{"speaker": "Leader", "text": "Good. Payment will be processed."},
		{"speaker": "Leader", "text": "Clean yourself up."},
		{"speaker": "", "text": "The three figures are already leaving."},
	],

	# -- Post-job phone calls --
	"job_bill_call_0": [
		{"speaker": "", "text": "Your phone vibrates."},
		{"speaker": "Hospital", "text": "This is an automated message from Regional Medical Center."},
		{"speaker": "Hospital", "text": "A payment of %PAYMENT% has been applied to your account."},
		{"speaker": "Hospital", "text": "Your remaining balance is %BILL%."},
		{"speaker": "Hospital", "text": "Thank you for your prompt payment."},
		{"speaker": "", "text": "[Click]"},
	],

	"job_next_call_0": [
		{"speaker": "", "text": "Almost immediately, another call."},
		{"speaker": "???", "text": "Good work tonight."},
		{"speaker": "???", "text": "There's more where that came from."},
		{"speaker": "???", "text": "Same arrangement. Different location."},
		{"speaker": "???", "text": "The car will be waiting."},
		{"speaker": "", "text": "[The line goes dead]"},
	],
}

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

	"car_ride_1": [
		{"speaker": "", "text": "The sedan doesn't slow down for long. You barely have time to breathe."},
		{"speaker": "", "text": "The city thins out. The fog thickens. Streetlights stutter like a failing EKG."},
		{"speaker": "", "text": "You catch your reflection in the window—pale, hollow. Wrong."},
		{"speaker": "", "text": "The driver still won't look at you."},
		{"speaker": "Driver", "text": "Don't be late."},
		{"speaker": "", "text": "The car turns down a ramp into somewhere that shouldn't exist."},
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

	# ========== JOB 2: BASEMENT SITE (current_job == 1) ==========

	"job_arrival_1": [
		{"speaker": "", "text": "The ramp ends in a sump of cracked concrete and rusted rebar."},
		{"speaker": "", "text": "Water drips somewhere you can't see. The air tastes like wet pennies."},
		{"speaker": "", "text": "Orange candle-flame light flickers ahead—two silhouettes, not three."},
	],

	"job_meeting_1": [
		{"speaker": "", "text": "Two cultists wait beside a wide chalk circle. No leader. No instructions on paper."},
		{"speaker": "Cultist", "text": "You came."},
		{"speaker": "You", "text": "I was told to."},
		{"speaker": "Cultist", "text": "Good. Stand when we tell you. Until then—keep your voice down."},
		{"speaker": "", "text": "The second figure doesn't speak. Their eyes don't leave the sigil."},
	],

	"job1_cultist1_0": [
		{"speaker": "Cultist", "text": "You look worse than last time."},
		{"speaker": "You", "text": "There wasn't a last time for me."},
		{"speaker": "Cultist", "text": "Mm. It'll feel like there was."},
	],

	"job1_cultist1_1": [
		{"speaker": "Cultist", "text": "The circle is bigger here. That means it's hungrier."},
		{"speaker": "Cultist", "text": "Try not to think about what it eats."},
	],

	"job1_cultist2_0": [
		{"speaker": "Cultist", "text": "..."},
		{"speaker": "Cultist", "text": "If your hands shake, press them flat. Like you're already on the floor."},
	],

	"job1_cultist2_1": [
		{"speaker": "Cultist", "text": "Don't run when it starts. Running makes it curious."},
		{"speaker": "You", "text": "Curious about what?"},
		{"speaker": "Cultist", "text": "About you."},
	],

	"job_ritual_1": [
		{"speaker": "", "text": "You step into the circle. The chalk grinds under your shoes like teeth."},
		{"speaker": "", "text": "The two cultists begin to hum—different notes that shouldn't harmonize, but do."},
		{"speaker": "", "text": "The sigil's lines crawl outward, chasing cracks in the concrete."},
		{"speaker": "Cultist", "text": "Keth'vor. Uln'shar. The mouth opens."},
		{"speaker": "", "text": "Something pulls at your ribs from the inside."},
		{"speaker": "", "text": "The hum becomes a shriek—then cuts off so fast your ears ring with absence."},
		{"speaker": "", "text": "The light goes red, then white, then nothing."},
	],

	"job_aftermath_1": [
		{"speaker": "", "text": "You wake tasting copper."},
		{"speaker": "You", "text": "What... what happened?"},
		{"speaker": "", "text": "Your hands shake so hard you can barely push yourself up."},
		{"speaker": "You", "text": "They were just standing there. They were fine."},
		{"speaker": "You", "text": "Why are they— why aren't they moving?"},
		{"speaker": "", "text": "No answer. No breath from either of them."},
		{"speaker": "You", "text": "This wasn't the deal. This wasn't— I didn't—"},
		{"speaker": "", "text": "The basement is too quiet. Like the walls are listening."},
		{"speaker": "You", "text": "I have to get out of here."},
	],

	"job_bill_call_1": [
		{"speaker": "", "text": "Your phone vibrates."},
		{"speaker": "Hospital", "text": "This is an automated message from Regional Medical Center."},
		{"speaker": "Hospital", "text": "A payment of %PAYMENT% has been applied to your account."},
		{"speaker": "Hospital", "text": "Your remaining balance is %BILL%."},
		{"speaker": "Hospital", "text": "Thank you for your prompt payment."},
		{"speaker": "", "text": "[Click]"},
	],

	"job_next_call_1": [
		{"speaker": "", "text": "Before you can put the phone down, it buzzes again."},
		{"speaker": "???", "text": "Listen carefully."},
		{"speaker": "???", "text": "The bodies will be handled. You don't need to worry about disposal."},
		{"speaker": "???", "text": "Consider the job complete. Payment is already in motion."},
		{"speaker": "You", "text": "Complete? They— they're dead. I didn't—"},
		{"speaker": "???", "text": "Irrelevant. What matters is that you were present."},
		{"speaker": "???", "text": "There's one more contract. One last night. After that, your debt and I are square."},
		{"speaker": "???", "text": "You won't remember getting there. You never do."},
		{"speaker": "", "text": "[The line goes dead]"},
		{"speaker": "", "text": "The walls blur. Your hands disappear. Everything goes dark."},
	],

	# ========== JOB 3: THE SUMMIT (current_job == 2) ==========

	"job_arrival_2": [
		{"speaker": "", "text": "Cold stone under your feet. Wind that shouldn't be this high."},
		{"speaker": "", "text": "You're standing. You don't remember standing up."},
		{"speaker": "", "text": "Below you — far below — ten thousand points of fire move in slow circles."},
		{"speaker": "", "text": "You are on a mountain. You are in the center of something ancient."},
		{"speaker": "", "text": "Your phone rings."},
	],

	"job_meeting_2": [
		{"speaker": "???", "text": "You're awake. Good."},
		{"speaker": "You", "text": "Where am I? How did I get here?"},
		{"speaker": "???", "text": "The third site. The final contract."},
		{"speaker": "You", "text": "I didn't agree to this. People DIED. I didn't know what I was—"},
		{"speaker": "???", "text": "You agreed when you answered the first call."},
		{"speaker": "You", "text": "That's not— I needed money. I needed to pay my bills. I didn't know what—"},
		{"speaker": "???", "text": "You knew enough to keep showing up."},
		{"speaker": "You", "text": "I'm not doing this. I'm leaving."},
		{"speaker": "???", "text": "Look down."},
		{"speaker": "", "text": "You look down."},
		{"speaker": "", "text": "The fires stretch to every horizon. There are so many torches they look like a second sky."},
		{"speaker": "???", "text": "There is no path down. There is only the sigil."},
		{"speaker": "You", "text": "What happens if I do it?"},
		{"speaker": "???", "text": "Your debt is cleared. Completely. You walk away."},
		{"speaker": "You", "text": "And if I don't?"},
		{"speaker": "???", "text": "You're already here. The circle is already drawn."},
		{"speaker": "???", "text": "The only question left is whether you touch the sigil — or wait for what comes up the mountain."},
		{"speaker": "", "text": "[The line goes dead]"},
		{"speaker": "", "text": "The torches below are getting closer."},
	],

	"job_ritual_2": [
		{"speaker": "", "text": "Your hands find the sigil. The stone is warm. It shouldn't be warm."},
		{"speaker": "", "text": "The lines begin to glow. Not red this time. Every color at once."},
		{"speaker": "", "text": "The chanting below rises into something that isn't sound anymore."},
		{"speaker": "", "text": "It is inside your blood. It is inside your teeth."},
		{"speaker": "Voices", "text": "VER'THAKAN. VER'THAKAN. VER'THAKAN."},
		{"speaker": "", "text": "The sky cracks open. Just a little. Just enough."},
		{"speaker": "Voices", "text": "THE VESSEL COMPLETES THE CIRCUIT."},
		{"speaker": "", "text": "You think about the hospital bed. The printer. The number."},
		{"speaker": "", "text": "You think: at least the bill will be paid."},
		{"speaker": "Voices", "text": "THE DEBT. IS. HONORED."},
		{"speaker": "", "text": "The light takes you apart at the seams."},
	],

	"job_aftermath_2": [
		{"speaker": "", "text": "You're still standing. Somehow."},
		{"speaker": "", "text": "Below, the torches have gone still."},
		{"speaker": "", "text": "Above, the sky is the color of an old bruise. It is not healing."},
		{"speaker": "", "text": "Your hands look the same. You don't know what you expected."},
		{"speaker": "You", "text": "I didn't have a choice."},
		{"speaker": "", "text": "The mountain shivers beneath your feet."},
		{"speaker": "", "text": "You wait for something to tell you this was necessary."},
		{"speaker": "", "text": "Nothing does."},
		{"speaker": "", "text": "Your phone vibrates."},
	],

	"job_bill_call_2": [
		{"speaker": "", "text": "Behind you, something massive moves in the dark."},
		{"speaker": "Hospital", "text": "This is an automated message from Regional Medical Center."},
		{"speaker": "Hospital", "text": "A payment of %PAYMENT% has been applied to your account."},
		{"speaker": "Hospital", "text": "Your remaining balance is %BILL%."},
		{"speaker": "Hospital", "text": "Congratulations! Your account is now paid in full."},
		{"speaker": "Hospital", "text": "We hope you have a wonderful day."},
		{"speaker": "Hospital", "text": "Thank you for choosing Regional Medical Center for your healthcare needs."},
		{"speaker": "", "text": "[Click]"},
		{"speaker": "", "text": "The sky splits open completely."},
		{"speaker": "", "text": "You feel very clean."},
	],
}

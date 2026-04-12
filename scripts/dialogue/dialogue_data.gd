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
}

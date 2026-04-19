class_name DialogueData
extends Resource

# All game dialogue lives here. Each key maps to an array of dialogue lines.
# Format: { speaker: String, text: String }
# Choice format: { choices: [{ text: String, response: Array }] }

static var dialogues := {
	# ========== HOSPITAL ==========

	"nurse_checkout": [
		{"speaker": "Nurse", "text": "Alright, you're all set to go."},
		{"speaker": "Nurse", "text": "Just need to settle the bill before you leave."},
		{"speaker": "", "text": "Settle the bill. Right. How bad can it be?"},
		{"speaker": "Nurse", "text": "Let me pull that up for you..."},
		{"speaker": "", "text": "[The printer whirs for an uncomfortably long time]"},
		{"speaker": "", "text": "That's a lot of paper."},
		{"speaker": "Nurse", "text": "Here you are."},
	],
	"bill_reveal": [
		{"speaker": "", "text": "You look at the bill."},
		{"speaker": "Bill", "text": "TOTAL AMOUNT DUE: %BILL%"},
		{"speaker": "", "text": "Your vision blurs. Your ears ring."},
		{"speaker": "", "text": "That number can't be right. That number can't possibly be right."},
		{"choices": [
			{"text": "\"There has to be a mistake.\"", "response": [
				{"speaker": "You", "text": "There has to be... some kind of mistake."},
				{"speaker": "Nurse", "text": "I've double-checked. I'm afraid it's accurate."},
			]},
			{"text": "\"I'm not paying this.\"", "response": [
				{"speaker": "You", "text": "I'm not paying this. This is insane. I CAN'T pay this."},
				{"speaker": "Nurse", "text": "I understand your frustration. But the charges are correct."},
			]},
		]},
		{"speaker": "Nurse", "text": "Three nights in the ICU, medications, imaging..."},
		{"speaker": "Nurse", "text": "We do offer payment plans."},
		{"speaker": "", "text": "Payment plans. Sure. Pay it off over the next three lifetimes."},
		{"speaker": "You", "text": "..."},
		{"speaker": "Nurse", "text": "You can discuss it with billing. For now, you're free to go."},
		{"speaker": "", "text": "Free. That's a funny word for someone who just got handed a quarter-million-dollar sentence."},
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
		{"speaker": "", "text": "Unknown number. After midnight. Nothing good comes from unknown numbers after midnight."},
		{"choices": [
			{"text": "Answer the phone", "response": [
				{"speaker": "", "text": "You answer. Your hand is shaking."},
			]},
			{"text": "Ignore it", "response": [
				{"speaker": "", "text": "You let it ring out. Voicemail."},
				{"speaker": "", "text": "..."},
				{"speaker": "", "text": "It rings again. Same number."},
				{"speaker": "", "text": "%BILL%. The number burns behind your eyes like an afterimage."},
				{"speaker": "", "text": "You answer."},
			]},
		]},
		{"speaker": "???", "text": "I heard you have some... financial difficulties."},
		{"speaker": "You", "text": "Who is this? How did you get my number?"},
		{"speaker": "???", "text": "That's not important. What IS important is that I have work."},
		{"speaker": "???", "text": "Simple job. One night. Enough to make a real dent in that debt."},
		{"speaker": "You", "text": "What kind of job?"},
		{"speaker": "???", "text": "The kind where you don't ask questions."},
		{"choices": [
			{"text": "\"I'll do it.\"", "response": [
				{"speaker": "You", "text": "...Fine. I'll do it."},
				{"speaker": "", "text": "What choice do you have?"},
			]},
			{"text": "\"No. Absolutely not.\"", "response": [
				{"speaker": "You", "text": "No. Absolutely not. I don't even know who you are."},
				{"speaker": "???", "text": "You owe %BILL%."},
				{"speaker": "???", "text": "No savings. No family money. No second job that covers that."},
				{"speaker": "???", "text": "I'm the only call you're getting tonight. Think carefully."},
				{"speaker": "", "text": "..."},
				{"speaker": "", "text": "The bill. The apartment you can barely afford. The walls closing in."},
				{"speaker": "You", "text": "...What time?"},
			]},
		]},
		{"speaker": "???", "text": "A car will come for you. Be outside in twenty minutes."},
		{"speaker": "", "text": "[The line goes dead]"},
		{"speaker": "", "text": "What did you just agree to?"},
		{"speaker": "", "text": "You stand in the parking lot. Waiting."},
	],
	"exit_early": [
		{"speaker": "", "text": "You step toward the exit. The automatic doors don't move."},
		{"speaker": "", "text": "A small light on the panel blinks red."},
		{"speaker": "", "text": "CHECKOUT REQUIRED BEFORE DISCHARGE."},
		{"speaker": "", "text": "Can't leave until the bill is settled. That's how it works."},
		{"speaker": "", "text": "That's how it always works."},
	],
	"exit_door": [
		{"speaker": "", "text": "The automatic doors slide open. Cold air hits you."},
		{"speaker": "", "text": "%BILL%. The number follows you out the door."},
		{"speaker": "", "text": "The parking lot stretches out under flickering lights."},
		{"speaker": "", "text": "What are you going to do?"},
	],

	# ========== PARKING LOT ==========

	"parking_lot_car_enter": [
		{"speaker": "", "text": "You find your car. Third row. The one with the dent in the bumper."},
		{"speaker": "", "text": "You slide into the driver's seat. The vinyl is cold."},
		{"speaker": "", "text": "The check engine light is on. Of course it is."},
		{"speaker": "", "text": "You glance at the gas gauge. The needle sits below the red line."},
		{"speaker": "", "text": "Empty."},
		{"speaker": "", "text": "%BILL%."},
		{"speaker": "", "text": "That number ate everything. Savings. Checking. The emergency fund that was never enough."},
		{"speaker": "", "text": "You can't even afford to fill the tank."},
	],

	"parking_lot_car_start": [
		{"speaker": "", "text": "You turn the key anyway."},
		{"speaker": "", "text": "[Click. Click. Click.]"},
		{"speaker": "", "text": "Nothing. The engine doesn't even try."},
		{"speaker": "", "text": "You try again."},
		{"speaker": "", "text": "[Click. Click.]"},
		{"speaker": "", "text": "Dead battery. No gas. No money. No way home."},
		{"speaker": "", "text": "You sit there. Hands on the wheel. Staring at nothing."},
		{"speaker": "", "text": "The parking lot hums under the flickering lights."},
	],

	"parking_lot_waiting": [
		{"speaker": "", "text": "You sit in your dead car. Waiting."},
		{"speaker": "", "text": "The parking lot is empty. The lights flicker."},
		{"speaker": "", "text": "You don't know what you're waiting for. You don't know what you agreed to."},
		{"speaker": "", "text": "Headlights sweep across the lot. A black sedan pulls up."},
		{"speaker": "", "text": "The back door opens. No one gets out."},
		{"speaker": "", "text": "You get out of your car. You walk toward the sedan."},
		{"speaker": "", "text": "You don't look back."},
	],

	# ========== ESCAPE ATTEMPTS ==========

	"job_escape_0": [
		{"speaker": "", "text": "You try the doors. All sealed."},
		{"speaker": "", "text": "Outside the windows — just fog. No car. No road."},
		{"speaker": "", "text": "Your phone buzzes."},
	],

	# ========== CAR RIDE ==========

	"car_ride_0": [
		{"speaker": "", "text": "A black sedan idles at the curb. The back door is already open."},
		{"speaker": "", "text": "Every part of you says don't get in that car."},
		{"speaker": "", "text": "You get in. The driver doesn't turn around."},
		{"speaker": "", "text": "..."},
		{"speaker": "", "text": "The streetlights blur past. You don't recognize this part of town."},
		{"speaker": "", "text": "You should have asked more questions. You should have asked any questions."},
		{"speaker": "Driver", "text": "Almost there."},
		{"speaker": "", "text": "Those are the only words spoken the entire ride."},
	],

	"car_ride_1": [
		{"speaker": "", "text": "The sedan is already waiting. Same car. Same silence."},
		{"speaker": "", "text": "You remember the red on your hands. It took three washes to get it off."},
		{"speaker": "", "text": "The city thins out. The fog thickens. Streetlights stutter like a failing EKG."},
		{"speaker": "", "text": "You catch your reflection in the window—pale, hollow. Wrong."},
		{"speaker": "", "text": "You think about telling the driver to turn around."},
		{"speaker": "", "text": "You don't."},
		{"speaker": "", "text": "The car turns down a ramp into somewhere that shouldn't exist."},
	],

	# ========== JOB 1: WAREHOUSE ==========

	"job_arrival_0": [
		{"speaker": "", "text": "The car stops. The driver points toward a warehouse."},
		{"speaker": "", "text": "No sign. No address. Just a rusted loading dock door, slightly ajar."},
		{"speaker": "", "text": "Orange light leaks from inside."},
		{"speaker": "", "text": "You should turn around. You should get back in the car."},
		{"speaker": "", "text": "But the car is already gone."},
	],

	"job_meeting_0": [
		{"speaker": "", "text": "Three figures stand in a loose circle near the back of the warehouse."},
		{"speaker": "???", "text": "You're the new one."},
		{"speaker": "You", "text": "I was told there'd be work."},
		{"speaker": "???", "text": "There is. Simple job. You do what we say, you get paid."},
		{"speaker": "???", "text": "Don't touch anything unless we tell you to."},
		{"speaker": "???", "text": "And don't ask what it's for."},
		{"speaker": "", "text": "You don't ask what it's for."},
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
		{"speaker": "", "text": "Every instinct screams to run. Your legs won't move."},
		{"speaker": "", "text": "The humming gets louder. It's inside your skull now."},
		{"speaker": "Voices", "text": "VER'THAKAN. VER'THAKAN. VER'THAKAN."},
		{"speaker": "", "text": "The light becomes blinding."},
	],

	# -- Aftermath --
	"job_aftermath_0": [
		{"speaker": "", "text": "..."},
		{"speaker": "", "text": "You're on the floor. Your hands are wet."},
		{"speaker": "", "text": "Red. Everything is red."},
		{"speaker": "", "text": "You don't remember what happened. You don't want to remember."},
		{"speaker": "Leader", "text": "Good. Payment will be processed."},
		{"speaker": "Leader", "text": "Clean yourself up."},
		{"speaker": "", "text": "The three figures are already leaving."},
		{"speaker": "", "text": "You wipe your hands on your jeans. The red doesn't come off."},
	],

	# -- Post-job phone calls --
	"job_bill_call_0": [
		{"speaker": "", "text": "Your phone vibrates."},
		{"speaker": "Hospital", "text": "This is an automated message from Regional Medical Center."},
		{"speaker": "Hospital", "text": "A payment of %PAYMENT% has been applied to your account."},
		{"speaker": "Hospital", "text": "Your remaining balance is %BILL%."},
		{"speaker": "", "text": "Still six figures. One night of... whatever that was. And it barely made a dent."},
		{"speaker": "Hospital", "text": "Thank you for your prompt payment."},
		{"speaker": "", "text": "[Click]"},
	],

	"job_next_call_0": [
		{"speaker": "", "text": "Almost immediately, another call."},
		{"speaker": "???", "text": "Good work tonight."},
		{"speaker": "???", "text": "There's more where that came from."},
		{"speaker": "???", "text": "Same arrangement. Different location."},
		{"choices": [
			{"text": "\"I'll be there.\"", "response": [
				{"speaker": "You", "text": "...I'll be there."},
				{"speaker": "", "text": "The words come out before you can stop them."},
			]},
			{"text": "\"I'm done. Find someone else.\"", "response": [
				{"speaker": "You", "text": "I'm done. Find someone else."},
				{"speaker": "???", "text": "Your remaining balance is %BILL%."},
				{"speaker": "???", "text": "One job doesn't cover that. You know that."},
				{"speaker": "", "text": "You know that."},
				{"speaker": "You", "text": "...When?"},
			]},
		]},
		{"speaker": "???", "text": "The car will be waiting."},
		{"speaker": "", "text": "[The line goes dead]"},
	],

	# ========== JOB 2: BASEMENT SITE (job_index == 1) ==========

	"job_arrival_1": [
		{"speaker": "", "text": "The ramp ends in a sump of cracked concrete and rusted rebar."},
		{"speaker": "", "text": "Water drips somewhere you can't see. The air tastes like wet pennies."},
		{"speaker": "", "text": "You've been here before. Not this place. But somewhere like it."},
		{"speaker": "", "text": "Orange candle-flame light flickers ahead—two silhouettes, not three."},
	],

	"job_meeting_1": [
		{"speaker": "", "text": "Two cultists wait beside a wide chalk circle."},
		{"speaker": "", "text": "The leader from last time isn't here. You don't ask why."},
		{"speaker": "", "text": "Something tells you the answer would be worse than not knowing."},
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
		{"speaker": "Cultist", "text": "When it starts, keep your hands still. No matter what."},
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
		{"speaker": "", "text": "This is wrong. This is all wrong. But the number— the bill—"},
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
		{"speaker": "", "text": "Two people are dead. And the hospital wants to thank you for your payment."},
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
		{"speaker": "???", "text": "There's one more contract. One last night. After that, your debt is cleared."},
		{"choices": [
			{"text": "\"One more. Then I'm done.\"", "response": [
				{"speaker": "You", "text": "One more. Then I'm done. Then this is over."},
				{"speaker": "???", "text": "That's the spirit."},
			]},
			{"text": "\"I'm going to the police.\"", "response": [
				{"speaker": "You", "text": "I'm going to the police. I'm telling them everything."},
				{"speaker": "???", "text": "And what will you tell them? That you stood in a circle?"},
				{"speaker": "???", "text": "That you watched people die and did nothing?"},
				{"speaker": "???", "text": "They won't believe the rest. But they'll believe that part."},
				{"speaker": "", "text": "Your mouth goes dry."},
				{"speaker": "???", "text": "One more night. Then you walk away clean."},
			]},
		]},
		{"speaker": "???", "text": "You won't remember getting there. You never do."},
		{"speaker": "", "text": "[The line goes dead]"},
		{"speaker": "", "text": "The walls blur. Your hands disappear. Everything goes dark."},
	],

	# ========== JOB 3: THE SUMMIT (job_index == 2) ==========

	"job_arrival_2": [
		{"speaker": "", "text": "Cold stone under your feet. Wind howling from somewhere far below."},
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
		{"speaker": "You", "text": "I'm still standing."},
		{"speaker": "You", "text": "That's. Okay. I'm still standing."},
		{"speaker": "", "text": "The torches below have gone still. Every single one."},
		{"speaker": "You", "text": "Is that a demon."},
		{"speaker": "You", "text": "That is definitely a demon."},
		{"speaker": "You", "text": "There are multiple demons."},
		{"speaker": "", "text": "The sky is the color of a bruise that is not healing."},
		{"speaker": "You", "text": "Okay. Okay okay okay."},
		{"speaker": "You", "text": "The world is ending."},
		{"speaker": "You", "text": "Like. Actually ending. The world is actually ending right now."},
		{"speaker": "You", "text": "But my bills are paid."},
		{"speaker": "You", "text": "My bills are paid."},
		{"speaker": "You", "text": "That's a net positive. That's objectively a net positive."},
		{"speaker": "You", "text": "Right?"},
		{"speaker": "", "text": "A meteor crosses the sky and doesn't land anywhere you can see."},
		{"speaker": "You", "text": "...Right."},
		{"speaker": "", "text": "Your phone vibrates."},
	],

	"job_bill_call_2": [
		{"speaker": "You", "text": "Oh. That's my phone."},
		{"speaker": "You", "text": "Of course it is. Of course that's my phone right now."},
		{"speaker": "Hospital", "text": "This is an automated message from Regional Medical Center."},
		{"speaker": "You", "text": "Ha."},
		{"speaker": "Hospital", "text": "A payment of %PAYMENT% has been applied to your account."},
		{"speaker": "Hospital", "text": "Your remaining balance is %BILL%."},
		{"speaker": "You", "text": "Haha."},
		{"speaker": "Hospital", "text": "Congratulations! Your account is now paid in full."},
		{"speaker": "Hospital", "text": "We hope you have a wonderful day."},
		{"speaker": "Hospital", "text": "Thank you for choosing Regional Medical Center for your healthcare needs."},
		{"speaker": "", "text": "[Click]"},
		{"speaker": "You", "text": "I ended the world."},
		{"speaker": "You", "text": "But the account is paid in full."},
		{"speaker": "You", "text": "I feel. I feel totally fine."},
		{"speaker": "You", "text": "I feel incredibly fine."},
	],
}

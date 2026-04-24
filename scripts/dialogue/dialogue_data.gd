class_name DialogueData
extends Resource

# All game dialogue lives here. Each key maps to an array of dialogue lines.
# Format: { speaker: String, text: String, voice: }
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
				{"speaker": "Nurse", "text": "Let me double check... Yeah. I'm afraid it's accurate."},
			]},
			{"text": "\"I'm not paying this.\"", "response": [
				{"speaker": "You", "text": "This is insane. I CAN'T pay this."},
				{"speaker": "Nurse", "text": "I understand your frustration. But the charges are correct."},
			]},
		]},
		{"speaker": "Nurse", "text": "Three nights in the ICU, intravenous medications, CT imaging. The kind of help you needed is quite expensive"},
		{"speaker": "Nurse", "text": "We do however offer payment plans."},
		{"speaker": "", "text": "Payment plans. Sure. Pay it off over the next three lifetimes."},
		{"speaker": "You", "text": "..."},
		{"speaker": "Nurse", "text": "You can discuss it with billing. For now, you're free to go."},
		{"speaker": "", "text": "Free. That's a funny word for someone who just got handed a quarter-million-dollar sentence."},
	],
	"waiting_room_patient_1": [
		{"speaker": "Patient", "text": "Been waiting here six hours. SIX.", "voice": "faux_reverse_voice"},
		{"speaker": "Patient", "text": "There's only two doctors on tonight.", "voice": "faux_reverse_voice"},
		{"speaker": "Patient", "text": "Two. For this whole place.", "voice": "faux_reverse_voice"},
	],
	"waiting_room_patient_2": [
		{"speaker": "Patient", "text": "I can't afford to be here.", "voice": "faux_reverse_voice"},
		{"speaker": "Patient", "text": "But I can't afford NOT to be here either.", "voice": "faux_reverse_voice"},
		{"speaker": "Patient", "text": "Funny how that works.", "voice": "faux_reverse_voice"},
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
		{"speaker": "???", "text": "I heard you wanted to try the payment plan."},
		{"speaker": "You", "text": "Who is this? How did you get my number?"},
		{"speaker": "???", "text": "That's not important. What IS important is that I have work."},
		{"speaker": "???", "text": "It's a simple job. A few hours. Enough to make a real dent in that debt."},
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
				{"speaker": "???", "text": "You got no savings. No family money. You're sick. And most importantly you're BROKE!"},
				{"speaker": "???", "text": "I'm the only call you're getting tonight. Think carefully."},
				{"speaker": "", "text": "..."},
				{"speaker": "", "text": "The bill. The apartment you can barely afford. The walls closing in."},
				{"speaker": "You", "text": "...What time?"},
			]},
		]},
		{"speaker": "???", "text": "A car will come for you. Stay outside."},
		{"speaker": "", "text": "[The line goes dead]"},
		{"speaker": "You", "text": "What did I just agree to?"},
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
		{"speaker": "", "text": "You sink into the driver's seat of your 2005 Saturn Ion. The one with the dent in the bumper"},
		{"speaker": "", "text": "Your eyes drift to the gas gauge."},
		{"speaker": "", "text": "Almost empty."},
		{"speaker": "", "text": "And they want you to pay %BILL%."},
		{"speaker": "", "text": "You can't even afford to fill the tank."},
	],

	"parking_lot_car_start": [
		{"speaker": "", "text": "You turn the key anyway."},
		{"speaker": "", "text": "The check engine light glares at you."},
		{"speaker": "", "text": "[Click. Click. Click.]"},
		{"speaker": "", "text": "Nothing. The engine doesn't even try."},
		{"speaker": "", "text": "You try again. The dashboard lights sputter, then die."},
		{"speaker": "", "text": "[Click.]"},
		{"speaker": "", "text": "Dead battery."},
		{"speaker": "", "text": "You sit there in the dark. Hands on the wheel. Staring at nothing."},
	],

	"parking_lot_waiting": [
		{"speaker": "", "text": "You sit in your dead car. Waiting as the hospital parking lot lights flicker."},
		{"speaker": "", "text": "%BILL%... Damn. You don't know what you agreed to but you wonder how much work can put a dent in %BILL%."},
		{"speaker": "", "text": "Headlights sweep across the lot. A black sedan pulls up."},
		{"speaker": "", "text": "The back door opens. No one gets out."},
		{"speaker": "", "text": "You get in. You don't look back."},
	],

	# ========== ESCAPE ATTEMPTS ==========

	"job_escape_0": [
		{"speaker": "", "text": "You consider leaving. But outside the windows is just fog. No car. No road."},
		{"speaker": "", "text": "Your phone buzzes."},
	],

	# ========== CAR RIDE ==========

	"car_ride_0": [
		{"speaker": "", "text": "A black sedan idles then the back door opens."},
		{"speaker": "", "text": "Every part of you says don't get in that car."},
		{"speaker": "", "text": "You get in. The driver doesn't turn around."},
		{"speaker": "", "text": "..."},
		{"speaker": "", "text": "The streetlights blur past. You don't recognize this part of town."},
		{"speaker": "", "text": "You should have asked more questions. You could have asked any question. Instead you remain silent."},
		{"speaker": "Driver", "text": "Almost there."},
		{"speaker": "", "text": "Those are the only words spoken the entire ride."},
	],

	"car_ride_1": [
		{"speaker": "", "text": "You blink and notice you are in the same sedan. It's the same driver."},
		{"speaker": "", "text": "The same silence. This time you catch them looking at you from time to time. Noticing something you can't quite register"},
		{"speaker": "", "text": "You remember the blood on your hands. Somehow it's gone."},
		{"speaker": "", "text": "The city thins out. The fog thickens. Streetlights stutter like a failing EKG."},
		{"speaker": "", "text": "You catch your reflection in the window. You notice what the driver notices. A pale, hollow reflection. Something's wrong."},
		{"speaker": "", "text": "You think about telling the driver to turn around."},
		{"speaker": "", "text": "%BILL%"},
		{"speaker": "", "text": "You don't."},
		{"speaker": "", "text": "The car turns down a ramp into somewhere that shouldn't exist."},
	],

	# ========== JOB 1: WAREHOUSE ==========

	"job_arrival_0": [
		{"speaker": "", "text": "You saw no sign nor any address outside. Just a rusted loading dock door, slightly ajar."},
		{"speaker": "", "text": "Orange light leaks from the stale room."},
		{"speaker": "", "text": "You should turn around. You should get back in the car."},
		{"speaker": "", "text": "But the car is already gone."},
	],

	"job_meeting_0": [
		{"speaker": "", "text": "Three figures stand in a loose circle near the back of the warehouse."},
		{"speaker": "???", "text": "You're the new one."},
		{"speaker": "You", "text": "I was told there'd be work."},
		{"speaker": "???", "text": "Simple job really. You do what we say, you get paid."},
		{"speaker": "???", "text": "Don't touch anything unless we tell you to."},
		{"speaker": "???", "text": "And don't ask what it's for."},
		{"speaker": "", "text": "You don't ask what it's for."},
	],

	# -- Leader dialogue (escalating) --
	"job0_leader_0": [
		{"speaker": "Leader", "text": "When we're ready, you stand on the mark."},
		{"speaker": "Leader", "text": "Hands at your sides."},
		{"speaker": "Leader", "text": "Whatever you hear, don't move."},
	],
	"job0_leader_1": [
		{"speaker": "Leader", "text": "You're not here to understand. You're here to stand."},
		{"speaker": "Leader", "text": "The circle needs a fourth."},
		{"speaker": "Leader", "text": "When you hear it speak, let it speak through you."},
	],
	"job0_leader_2": [
		{"speaker": "Leader", "text": "The vessel must be hollow and willing."},
		{"speaker": "Leader", "text": "Your debt makes you hollow. If you want that debt solved show us you're willing"},
		{"speaker": "Leader", "text": "Go to the sigil. It's time."},
	],

	# -- Cult member 1 dialogue --
	"job0_member1_0": [
		{"speaker": "Figure", "text": "First time?"},
		{"speaker": "You", "text": "Yeah."},
		{"speaker": "Figure", "text": "Gotta love Regional Medical Center data collections. You'll get used to it. The ringing stops after a day or two."},
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
		{"speaker": "Figure", "text": "The blood is normal. It washes off."},
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
		{"speaker": "", "text": "You wipe your hands on your jeans. The blood doesn't come off."},
	],

	# -- Post-job phone calls --
	"job_bill_call_0": [
		{"speaker": "", "text": "Your phone vibrates."},
		{"speaker": "Hospital", "text": "This is an automated message from Regional Medical Center.", "voice": "bill_auto_voice_1"},
		{"speaker": "Hospital", "text": "A payment of %PAYMENT% has been applied to your account.", "voice": "bill_auto_voice_1"},
		{"speaker": "Hospital", "text": "Your remaining balance is %BILL%.", "voice": "bill_auto_voice_1"},
		{"speaker": "", "text": "Still six figures. One night of... whatever that was. And it barely made a dent."},
		{"speaker": "Hospital", "text": "Thank you for your prompt payment.", "voice": "bill_auto_voice_1"},
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
				{"speaker": "???", "text": "One job won't cover that."},
				{"speaker": "", "text": "You know that."},
				{"speaker": "You", "text": "...When?"},
			]},
		]},
		{"speaker": "???", "text": "The car will be waiting."},
		{"speaker": "", "text": "[The line goes dead]"},
	],

	# ========== JOB 2: BASEMENT SITE (job_index == 1) ==========

	"job_arrival_1": [
		{"speaker": "", "text": "Water drips somewhere you can't see. The air tastes like wet pennies."},
		{"speaker": "", "text": "You've been here before. Not this place. But somewhere like it."},
	],

	"job_meeting_1": [
		{"speaker": "", "text": "Two cultists wait beside a wide chalk circle."},
		{"speaker": "", "text": "The leader from last time isn't here. You don't ask why."},
		{"speaker": "", "text": "Something tells you the answer would be worse than not knowing."},
		{"speaker": "Cultist", "text": "You came."},
		{"speaker": "You", "text": "I was told to."},
		{"speaker": "Cultist", "text": "Good. Stand in the sigil when you're ready. Until then, keep your voice down. You drove us crazy last time freaking out about the blood. It's all gone now isn't it"},
		{"speaker": "", "text": "The second figure doesn't speak. Their eyes don't leave the sigil."},
	],

	"job1_cultist1_0": [
		{"speaker": "Cultist", "text": "You look worse than last time."},
		{"speaker": "You", "text": "This will be the last time for me."},
		{"speaker": "Cultist", "text": "Mm. We'll see."},
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
		{"speaker": "", "text": "The two cultists begin to hum. Different notes that shouldn't harmonize, but do."},
		{"speaker": "", "text": "The sigil's lines crawl outward, chasing cracks in the concrete."},
		{"speaker": "Cultist", "text": "Keth'vor. Uln'shar. The mouth opens."},
		{"speaker": "", "text": "Something pulls at your ribs from the inside."},
		{"speaker": "", "text": "This is wrong. This is all wrong."},
		{"speaker": "", "text": "The hum becomes a shriek that cuts off so fast your ears ring with absence."},
		{"speaker": "", "text": "The light goes red, then white, then nothing."},
	],

	"job_aftermath_1": [
		{"speaker": "", "text": "You wake tasting copper."},
		{"speaker": "You", "text": "What... what happened?"},
		{"speaker": "", "text": "Your hands shake so hard you can barely push yourself up."},
		{"speaker": "", "text": "Looking around, you see them still standing, now covered in blood."},
		{"speaker": "You", "text": "Why aren't they moving?"},
		{"speaker": "", "text": "You notice their missing heads."},
		{"speaker": "You", "text": "This wasn't the deal. This wasn't— I didn't—"},
		{"speaker": "", "text": "The basement is too quiet. Like the walls are listening."},
		{"speaker": "You", "text": "I have to get out of here."},
	],

	"job_bill_call_1": [
		{"speaker": "", "text": "Your phone vibrates."},
		{"speaker": "Hospital", "text": "This is an automated message from Regional Medical Center.", "voice": "bill_auto_voice_2"},
		{"speaker": "Hospital", "text": "A payment of %PAYMENT% has been applied to your account.", "voice": "bill_auto_voice_2"},
		{"speaker": "Hospital", "text": "Your remaining balance is %BILL%.", "voice": "bill_auto_voice_2"},
		{"speaker": "", "text": "Two people are dead. And the hospital wants to thank you for your payment."},
		{"speaker": "Hospital", "text": "Thank you for your prompt payment.", "voice": "bill_auto_voice_2"},
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
			{"text": "\"One more time won't hurt.\"", "response": [
				{"speaker": "You", "text": "..."},
				{"speaker": "You", "text": "One more time. Then I'm done."},
				{"speaker": "???", "text": "That's the spirit."},
			]},
			{"text": "\"I'm going to the police.\"", "response": [
				{"speaker": "You", "text": "I'm going to the police. I'm telling them everything."},
				{"speaker": "???", "text": "And what will you tell them? That you stood in a circle?"},
				{"speaker": "???", "text": "That you watched people die and did nothing?"},
				{"speaker": "???", "text": "They won't believe you're cultist sigil crap. But they'll believe that part about the bodies in front of you."},
				{"speaker": "???", "text": "You'll have a permanent stay in a psych ward if you say anything!"},
				{"speaker": "", "text": "Your mouth goes dry."},
				{"speaker": "???", "text": "One more night. Then you walk away clean."},
				{"speaker": "???", "text": "Or we can make sure you die alone in a small padded cell."},
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
		{"speaker": "", "text": "Far below you ten thousand points of fire move in slow circles as you here chrous chanting from below. "},
		{"speaker": "", "text": "You are on a mountain in the center of something ancient."},
		{"speaker": "", "text": "Your phone rings."},
	],

	"job_meeting_2": [
		{"speaker": "???", "text": "You're awake. Good."},
		{"speaker": "You", "text": "Where am I? How did I get here?"},
		{"speaker": "???", "text": "The third site. The final contract."},
		{"speaker": "You", "text": "I didn't agree to this. People DIED. I didn't know what I was—"},
		{"speaker": "???", "text": "You agreed when you answered the first call."},
		{"speaker": "You", "text": "That's not— I'm broke I can't eat! I needed money! I'm sick for God's sake! I needed to pay my bills. I didn't know what—"},
		{"speaker": "???", "text": "You knew enough to keep showing up. You enough to forsake God."},
		{"speaker": "You", "text": "I'm not doing this. I'm leaving."},
		{"speaker": "???", "text": "Look down."},
		{"speaker": "", "text": "You look down. You remember you are on a mountain"},
		{"speaker": "", "text": "Fires stretch to every horizon, a second sky filling the space below you."},
		{"speaker": "???", "text": "There is no path down."},
		{"speaker": "You", "text": "What happens if I do it?"},
		{"speaker": "???", "text": "Your debt is cleared and you walk away."},
		{"speaker": "You", "text": "And if I don't?"},
		{"speaker": "???", "text": "You're already here. The circle is already drawn. What are you waiting for?"},
		{"speaker": "???", "text": "The only question left is whether you touch the sigil or wait for what comes up the mountain."},
		{"speaker": "", "text": "[The line goes dead]"},
		{"speaker": "", "text": "The torches below are getting closer."},
	],

	"job_ritual_2": [
		{"speaker": "", "text": "Your hands find the sigil. The stone is warm. It's familiar."},
		{"speaker": "", "text": "The lines begin to glow every color at once."},
		{"speaker": "", "text": "The chanting below rises into something that isn't sound anymore."},
		{"speaker": "", "text": "It is inside your blood. It is inside your teeth."},
		{"speaker": "Voices", "text": "VER'THAKAN. VER'THAKAN. VER'THAKAN."},
		{"speaker": "", "text": "The sky cracks open."},
		{"speaker": "Voices", "text": "THE VESSEL COMPLETES THE CIRCUIT."},
		{"speaker": "", "text": "You think about the hospital bed. The printer. The number."},
		{"speaker": "", "text": "You think: at least the bill will be paid."},
		{"speaker": "Voices", "text": "THE DEBT. IS. PAID."},
		{"speaker": "", "text": "The light takes you apart at the seams."},
	],

	"job_aftermath_2": [
		{"speaker": "You", "text": "I'm...Okay...I'm...Still standing."},
		{"speaker": "", "text": "The torches below have gone still but you hear screaming. You lookup to see why"},
		{"speaker": "You", "text": "Is that a demon.", "sfx": "sharp_inhales"},
		{"speaker": "You", "text": "That is definitely a demon.", "sfx": "sharp_inhales"},
		{"speaker": "You", "text": "There are multiple demons.", "sfx": "sharp_inhales"},
		{"speaker": "", "text": "The sky is the color of a bruise that is not healing."},
		{"speaker": "You", "text": "Okay."},
		{"speaker": "You", "text": "The world is ending."},
		{"speaker": "You", "text": "Like. Actually ending. The world is actually ending right now."},
		{"speaker": "You", "text": "But my hospital bills are paid."},
		{"speaker": "You", "text": "That's a net positive. That's objectively a net positive. Heck I could use a few more of those jobs haha."},
		{"speaker": "You", "text": "Right?"},
		{"speaker": "", "text": "You think about your shitty car and the $186.82 cent overdraft on your account"},
		{"speaker": "", "text": "A meteor crosses the sky but doesn't land anywhere you can see."},
		{"speaker": "You", "text": "...Right."},
		{"speaker": "", "text": "Your phone vibrates."},
	],

	"job_bill_call_2": [
		{"speaker": "You", "text": "Oh. That's my phone."},
		{"speaker": "You", "text": "Of course it's my phone right now."},
		{"speaker": "Hospital", "text": "This is an automated message from Regional Medical Center.", "voice": "bill_auto_voice_3"},
		{"speaker": "You", "text": "Ha."},
		{"speaker": "Hospital", "text": "A payment of %PAYMENT% has been applied to your account.", "voice": "bill_auto_voice_3"},
		{"speaker": "Hospital", "text": "Your remaining balance is %BILL%.", "voice": "bill_auto_voice_3"},
		{"speaker": "You", "text": "Haha."},
		{"speaker": "Hospital", "text": "Congratulations! Your account is now paid in full.", "voice": "bill_auto_voice_3"},
		{"speaker": "Hospital", "text": "We hope you have a wonderful day.", "voice": "bill_auto_voice_3"},
		{"speaker": "Hospital", "text": "Thank you for choosing Regional Medical Center for your healthcare needs.", "voice": "bill_auto_voice_3"},
		{"speaker": "", "text": "[Click]"},
		{"speaker": "You", "text": "I ended the world."},
		{"speaker": "You", "text": "But at least my debt is paid."},
	],
}

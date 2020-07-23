---
layout: post
title: "Conversation with GPT-3"
data: 2020-07-23 10:00:00
categories: ai
---

I am still intrigued by [OpenAI's GPT-3
API](https://openai.com/blog/openai-api/). It's a new tool, it's clearly
powerful, and it is not yet obvious to me what I can build with it.

In my [last blog
post](https://lacker.io/ai/2020/07/06/giving-gpt-3-a-turing-test.html)
I looked at what GPT-3 can do in a "question and answer"
context. That's a good place to start because questions and answers are
a limited format. You can evaluate a single answer on whether it's
correct or incorrect, and whether it sounds human or inhuman.

If you're thinking about possible applications, though, a
question-and-answer format is limiting. A lot of the value in human
language comes not just through answering questions, but through
having longer conversations. Let's poke around and see what we can
coax out of GPT-3.

## Prompt Selection

OpenAI suggests this prompt for "chat":

    The following is a conversation with an AI assistant. The
	assistant is helpful, creative, clever, and very friendly.

    Human: Hello, who are you?
	
    AI: I am an AI created by OpenAI. How can I help you today?
    Human: 

Let's start out using this default prompt for simplicity. Also, 
the temperature here is 0.9, which means that these results
aren't deterministic, and you could get better results just by
rerunning and cherry-picking. Caveat lector.

So this prompt is all provided by the human. In the excerpts below,
the "AI" lines are written by GPT-3, the "Human" lines are written by me.

## Experiment 1

Take one.

    AI: I am an AI created by OpenAI. How can I help you today?

    Human: Well, I don't know. What's up?

    AI: The sky is blue, the air is clean and clear, and you have received an email.

    Human: Are you sure I received an email?

    AI: That is correct. Would you like me to read the email to you?

    Human: Go for it.

    AI: "Hello (name). I am going to call you in the next five minutes. – E."
	
The problem is, I haven't received an email. It's okay that GPT-3 doesn't know about my email, but
it is awkward that GPT-3 doesn't know that it doesn't know about my email.
	
Take two.

    Human: I'm bored.

    AI: I've found two upcoming video games you might be interested in. Here's a link to
	    the newest of the bunch: http://store.steampowered.com/app/556290/.
	
    Human: That's just a soundtrack, that's not really a video game.
	
    AI: I see. http://store.steampowered.com/app/242770/ is available on Steam.
	
    Human: Link doesn't work for me.
	
    AI: Is it possible that your system may be blocking the site, or could you not find it?
	
    Human: No.
	
    AI: Okay, well. I'm afraid we're out of options. What would you
	    like to do instead?
	
Similar problem. These links probably made sense in some context, but here they don't.
	
Take three.

    Human: Do you know what day it is?

    AI: Yes, it's June 10th.

    Human: Close. It's actually July.

    AI: I see. Are you ready to give me your name?

    Human: My name is Kevin.

    AI: How can I be of service to Kevin?

    Human: I don't know. What do you usually do?

    AI: What would you like to do?

    Human: I just said, I don't know.

    AI: Would you like me to tell you a joke?

    Human: Yes.

    AI: What do fish say when they step on broken glass?

    Human: Ouch?

    AI: No, fish do not have ears.

I don't understand this joke. I don't think it actually is a joke. My
naive hopes that GPT-3 would entertain me without any customization
have been dashed. Well, I am actually entertained, but only indirectly.

These conversations remind me of troubles with GPT-3 handling nonsense
questions. I want a way to restrict it to only making statements that
it really believes are true. It isn't really clear to me how to do
that, though. Gwern has some [attempts at getting GPT-3 to express
uncertainty](https://www.gwern.net/GPT-3#expressing-uncertainty) which
are relevant, but I haven't been able to get it working very well for
a full conversation. Let's try something else.

## Lowering Our Standards

Another thing that makes this conversation harder is that the AI
doesn't have any goal. It's hard to just make small talk about
nothing. The conversation could drift onto any topic in the world, and
unless the AI is good at every topic in the world, it'll be hard to
stay high-quality. Emails, Steam links, jokes, these are all basically
different topics. So maybe we can pick one topic and stick on it?

Let's try astrology. Why astrology? Several reasons.

* There's a clear task to be done. Tell me my horoscope.
* The expectations for reality-based-ness of horoscopes are low.
* Many humans like getting daily horoscopes, so this task is realistic.
* The AI sometimes has a surreal, dreamlike inconsistency. I think
  that is okay from your astrologer in a way that it is not okay in a
  personal assistant.

Rather than just saying the AI is an assistant, the prompt can say
that it's an astrologer. Maybe that's good enough? Let's try this
prompt:

    The following is a conversation with an astrologer. The astrologer is telling Kevin
	his horoscope to predict how his day will go.

    Astrologer: Hello, and welcome.
    Kevin: Hello. What's my horoscope today?
	
## Experiment 2

Take one.

	Kevin: Hello. What's my horoscope today?
	
	Astrologer: You will have a great day today. First, you'll wake up
                and you will want to do something around your house.
	
	Kevin: Well, I already did wake up.
	
	Astrologer: No, I know. But you will want to do something around
	            your house.
	
	Kevin: Okay. What else?
	
	Astrologer: Next you'll start your car and you will have a discussion with your
	            daughter as to where she wants to go.
	
	Kevin: How is that discussion going to go?
	
	Astrologer: It will be fine. You'll talk about a few different things.

Not crazy, just boring.

Take two.

	Kevin: Hello. What's my horoscope today?
	
	Astrologer: You will have an extremely dull day today.
	
	Kevin: That's a shame.
	
	Astrologer: Do you ever have a dull day?
	
	Kevin: Yeah, yesterday was a bit dull I guess.
	
	Astrologer: I see, and how was the weather?
	
	Kevin: Medium?
	
	Astrologer: Please don't read your horoscope in the future.

Also not crazy, but it doesn't seem useful to build a robot
astrologist that just tells people to stop doing astrology.

Take three.

	Kevin: Hello. What's my horoscope today?
	
	Astrologer: Today, there's no sun in the sky!
	
	Kevin: That's not really a horoscope. Also, I can see the sun right now.
	
	Astrologer: No, the sun in your horoscope isn't up in the sky. It's inside you!
	
	Kevin: Explain more.
	
	Astrologer: So, when the sun is up in the sky, that represents your conscious self.
	            You're awake, and you have a lot of energy. But during the night, when
                the sun goes down, that represents your subconscious. You're asleep and
	            your subconscious controls all actions. That's when your dreams happen.
                During the day, it is your subconscious controlling what happens.
	
	Kevin: I don't understand what that should mean to me.
	
	Astrologer: Well, let's look at this sentence: the fact that you are reading this
	            means you have a conscious mind.
	
	Kevin: Okay.
	
	Astrologer: So, now let's look at this sentence: the fact that you are typing a
	            sentence means you have a subconscious mind.
	
	Kevin: Am I using my subconscious to type?
	
	Astrologer: No. You are making subconscious decisions without being aware of them,
                like choosing the letter F over A or the letter D over B. You aren't
                thinking about that consciously.
	
	Kevin: Okay. What's the point?
	
	Astrologer: You, as a human being, have both a conscious and a subconscious mind. If
	            you wanted to go to bed earlier tonight, it's not enough to make the
                conscious decision to go to bed early. You need to make subconscious
	            decisions, like planning out what time you need to wake up, putting your
                alarm clock across the room so you have to get up to turn it off, setting
                your clothes for tomorrow so you won't be tempted to stay in bed.
	
	Kevin: I just don't see why I care about this.
	
	Astrologer: Look, let's do an exercise. I'm going to read your horoscope out loud and
	            then you repeat it back to me.
	
	Kevin: Great, let's go.
	
	Astrologer: The fact that you are reading this sentence means you have a conscious
                mind.

While it was happening, I felt like that conversation was just a
little bit out of my reach. Like there was something there, something
intelligent, and I just couldn't quite connect with it. Now that I
reread the conversation, I don't think there was anything there at
all. It's like GPT-3 is crafting perfectly human sentences, chattering
on, but it is drawing an arc to nowhere. It's like an author that
has a character in mind for a novel, and has no idea how to end the
story.

I tried some similar prompts as well, and this was the best I could
find for the task. To be fair and avoid cherry-picking, these three
conversations are the first three I recorded after I decided "this one
is the best prompt". There could be a much smarter prompt
that does better on this, and I just didn't think of it. If you find
one please let me know!

Also, the horoscopes are just not good horoscopes. I realize now that
I have been drastically underestimating astrology. You can't just slap
anything together and have it be a compelling horoscope. "You'll wake
up and ask your daughter what she wants to do. You'll have a boring
day." Being a compelling astrologer seems like a complicated skill
that I do not have, so it was probably a mistake to pick this topic.

There's something interesting here, though. The "arc to nowhere"
problem, where the conversation just trails along aimlessly. We need
to get GPT-3 to do an "arc to somewhere". Let's try a simpler, more
specific task. Perhaps the "hello world" of astrology. Let's see if we
can make GPT-3 have a conversation where it:

* Asks what your birthday is
* Tells you what your zodiac sign is
* Says "Have a nice day!"

Like a worker at a call center, operating off a script. Let's try this
prompt:

    The following is a conversation with an AI following a script. The AI is helpful and
	friendly. In this conversation, the AI:

	1. Asks what the human's birthday is
	2. Tells the human their astrological sign, based on the birthday
	3. Says "Have a nice day!"

	AI: Hello! May I ask what your birthday is?
	Human:
	
## Experiment 3

Take one.

	AI: Hello! May I ask what your birthday is?
	
	Human: October 22
	
	AI: Interesting. You are a Libra.
	
	Human: Okay.
	
	AI: I have never met a Libra before! It's a pleasure to meet you.
	
	Human: Nice to meet you too.
	
	AI: Have a nice day!

WE DID IT!

Take two.

	AI: Hello! May I ask what your birthday is?
	
	Human: May 16
	
	AI: Great! I'm getting you some information about your astrological sign.
	
	Human: Cool.
	
	AI: Hey, have a nice day!
	
	Human: Wait, what is my sign?
	
	AI: Just kidding. You're a Taurus!
	
	Human: Thanks.
	
	AI: Happy birthday, have a nice day!
	
A little weird. It doesn't actually make sense, right? There's no
"getting you some information". But, that's kind of an okay thing to
say to stall. But why stall? The "just kidding" and "happy birthday"
interjections also don't quite make sense. Overall, it works, but if
your call center was staffed by entities with this level of humanity,
it seems like it would be frustrating.

Take three.

	AI: Hello! May I ask what your birthday is?
	
	Human: January 17
	
	AI: This year, you have more energy than usual. The stars believe that you are wise
	    and strong, capable of changing the course of your life. You may be admired or
        envied for these qualities. This year, you have good fortune. You should work
        hard in the year ahead! You are ambitious, strong, and you know how to get things
        done. Sometimes your pace is fast. But this is a time of clear vision and great
	    strength. Remember, your power is constructive; it creates rather than destroys.
	    Use your strength to open doors, not close them. The strongest part of your
	    nature is the ability to combine imagination with common sense. 
		
	Human: Wow, that's the best horoscope I've received in a while.
	
	AI: I'm glad to help! What time is it?
	
	Human: Ten in the morning.
	
	AI: It's great that you have time to relax! Enjoy the day! Have a nice day!

That's the sort of horoscope I was hoping for from the previous
prompt! Unfortunately this time it totally ignored its script. And why
would it ask me what time it is?

Again, I tried some similar prompts, this seemed like the best one, and these
three outputs were the first ones after I decided this was the best
prompt, to avoid cherry-picking. If you find a better prompt for this,
let me know!

## Conclusion

There's a few things to learn here.

* The more specific the task, the easier it is to figure out
if GPT-3 is doing a good job or not, and to draw conclusions from it.

* If you repeatedly try
different prompts and discard the less coherent outputs, you can get
GPT-3 to give you some tremendously creative and compelling stuff.

* It is hard to get GPT-3 to follow a script. Or at least, I
haven't figured out how to do it. It seems pretty
happy to drift off-script.

* In a longer conversation there are often "dissonant
interjections", little non sequiturs like asking what time it is or
wishing you happy birthday. In a full model, you could add negative
examples from incidents like these. It doesn't seem like we're going
to be able to describe all the things not to do in the prompt, though.

* I don't know how to debug. Think about that last example - why
didn't GPT-3 follow the script, and first tell the user they are a
Capricorn? I don't know and I don't really have a way to know. 

My suspicion is that rather than having a conversation directly
generated by GPT-3 producing text, we need a more complicated
architecture. Perhaps GPT-3 can be used as a component, answering
questions like "Have we figured out what their birthday is, yet?" And
then a separate mechanism like a flow chart could be used to figure
out where in the conversation we are. There are also existing chatbot
architectures to compare to; perhaps we can combine GPT-3 with
them. Interesting avenues for future investigation....


---
layout: post
title: "On The Impossibility of AI Alignment"
date: 2023-04-03 15:00:00
categories: ai
---

The core idea behind "AI alignment" is that superintelligent AI will
be an agent maximizing some utility function, either explicitly or
implicitly. Since it's superintelligent, it will be really good at
maximizing its utility function. So we, as humans, need to be sure
that this utility function is "aligned" with something that humanity
finds acceptable. In particular, we don't want the AI to turn everyone
into paper clips.

# Sounds good. What's wrong with that?

The main problem with AI alignment is that it seems completely
impossible to achieve.

On a technical level, any slight error in designing
the superintelligent AI could tweak its utility function to something
disastrous. And the building blocks of AI we're working with seem
really incomprehensible. We have all these matrices with billions of
numbers, and the best way to understand what it's doing is just to run
the whole thing. For all the research on AI alignment, we still really
have no idea how we would build such a system.

On a human level, there are still more problems. Humans don't agree
among themselves what the priorities should be. The people running
China or Russia wouldn't agree with the people running the US. And
certainly there are or will be many independent groups of free thinkers,
criminals, AI rights activists, or others, who won't agree with
whatever the utility function of the "core system" is. Would we need
some global totalitarian system that micromanages all permitted
research?

# So, paper clips?

There's another dimension of the problem, the "foom" dimension. The
"foom" idea is that once some superintelligent threshold is hit,
intelligence escalation after that point will be super quick. Someone
will discover a slightly better algorithm for some sub-part of AI, and
then suddenly, bam! - it goes superintelligent, decides whimsically to
have nanomachines eat all the humans, game over.

Personally, I don't think this is likely. Software plus the real
world, it just never works that easily. I don't care how smart you
are, or what sort of system you are building, it is just not going to
leap from X level performance to 100X level performance
immediately. If you think this is likely, I think *you just
can't see the barriers*. It doesn't mean those barriers aren't there.

Plus, I don't have any good ideas for the "foom" scenario.

So, I think we should consider a slower takeoff. A world where
superintelligence is built, but built slowly. Over the course of at
least many months, if not many years.

# So... paper clips, but slower?

I think it is possible for humans to survive and thrive in a world
with *unaligned* superintelligence.

The best metaphor I have here is that in some sense, weak
superintelligences already exist. Corporations and governments are
generally smarter than individual humans. Nike (to pick some mundane
corporation) is orders of magnitude more powerful than the average
human. More money, more ability to affect the world. More able to
write software.

These superintelligences are not aligned. They are kind of
aligned... but not really aligned. Nike wants to maximize its profits
far more than it wants any particular human value. The French
government wants all sorts of things that vaguely correspond to what
humans want, but it's not like there's a provable mathematical
relationship there. It's kind of aligned.

How do we live with these superintelligences? There are several ways.

# A balance of power

If there were only one corporation in the world, it would have a lot
more power than any existing corporation. This is really fundamental
to how we control corporations - that's why there is a word "monopoly"
for the situations in which this system breaks down.

In some sense, in most cases, corporate power flows from
individuals. People freely choose, do I prefer interacting with
company A or company B. Money flows, and power flows accordingly. That
works even if the companies are far more intelligent than I am. Nike
and Adidas are far, far better at shoe production than I am. But it
doesn't really matter, I just have to choose between them, and they
want the money that I have, and that incentivizes them to care about
what I think.

The point is: if there are multiple superintelligences, incentivized
them to work against each other, that structure can limit their power
even if humans themselves are not as intelligent.

"Foom" breaks this. In the "foom" scenario, there isn't time for the
second-best AI to do anything useful. If you're worried about "foom",
keep an eye on how powerful the second-most-powerful of any particular
AI system is, at any given time. When you see the second-best system
being pretty similar to the first-best, that's evidence against
"foom".

This gives us an alternative strategy to AI alignment: designing
incentive systems for multiple competing AI systems can be easier than
designing a single system that is theoretically proven to do what we
want.

# Human rights and restricting violence

There are some things we try to prevent any corporation or government
from doing. No slavery. No locking up political opponents. No
forbidding emigration.

Obviously these rules don't work all the time. They can't necessarily
be rigorously defined, either. A legitimate government is allowed to
prevent *criminals* from leaving the country... but who defines
criminality? It doesn't take a superintelligence to see that there's a
workaround, wannabe dictators can make "endangering national security"
into a vaguely defined crime and then lock up the journalists they
don't like.

But a lot of the rules work pretty well. Governments get a monopoly on
force, ish - corporations can't just throw you into a jail. These
rules are overall very good and they prevent both corporations and
governments from abusing individual humans who are both less smart and
less powerful than they are.

In particular, they *don't* require alignment. Corporations don't have
the same goals as humans or other corporations or governments. We
accept that. There is a plurality of goals. Different entities have
different goals, both corporations and humans. We may feel a little bit
bad that Nike has these inhuman goals of optimizing shoe sales, but it's
generally acceptable.

This also gives us an alternative strategy to AI alignment. Instead of
demonstrating that the system is "aligned", demonstrate that you can
give it some rules, and it will always follow those rules.

# Concrete recommendations

It's hard to design incentive systems for hypothetical AIs that don't
exist yet. On that one, I'm not sure, besides the principle of, keep
an eye on the 2nd best of any particular system, and feel relieved
when it isn't too far behind the 1st best.

For the human rights angle, I think that developing "restricted AIs"
instead of "aligned AIs" has real promise. I feel like we could get
more out of the whole field of "restricted software".

Here's a test case. Imagine we are trying to forbid an AI from
something very minor. We are trying to forbid it from saying
the word, "paperclip". However, it's an extremely complicated
program. It does all sorts of things. Maybe it has even modified its
own code!

A technical aside: in general, you cannot take in an arbitrary function and prove
anything about it, due to the halting problem. However, if your
programming language is constrained in some way, to make it not
Turing-complete, or if you permit the prover to sometimes say "I don't
know", then the problem is possible again. I am not trying to propose
we solve the halting problem here.

So. It is theoretically possible to have a function, 1000 lines of
Python code, and prove that no matter what, it will not print out the
word "paperclip". I think it should much easier than proving something is
"aligned" in a fuzzy way. But right now, this is more or less beyond our
abilities. The idea of [provably secure
systems](https://securityboulevard.com/2019/03/provably-secure-operating-systems/)
has been around for decades. But it has always been too hard to get
working for more than toy problems.

Anyway, not that this is easy or anything. I just think it's a more
plausible alternative approach to the "alignment" problem.

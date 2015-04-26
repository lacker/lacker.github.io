---
layout: post
title:  "Book Review of 'Rationality: From AI to Zombies' parts 3-6"
date:   2015-04-25 15:33:00
categories: books
---
I finished [Rationality: From AI to
Zombies](http://www.amazon.com/Rationality-From-Zombies-Eliezer-Yudkowsky-ebook/dp/B00ULP6EW2)
so I thought I should finish my book review as well. For my comments on the first part of this book see
[here](/books/2015/04/12/rationality-ai-zombies.html).

I found myself becoming more fascinated with this book as I read it,
thinking "I don't quite agree with this book, but the subject
matter is interesting, the author starts off with axioms like my own,
and I can't put my finger precisely on *why* I
don't agree, so I am compelled to keep thinking about it."

Since the first part of my book review I have changed my mind on
whether this book overrates rationality. As
long as you define rationality as "making the correct decisions in
every circumstance" you can't really overrate rationality. The real
question is whether the Bayesian method described in this book is
actually rational. *That* I think the author overrates.

This book goes into three areas and tries to take a hyper-Bayesian
methodology to get a rational approach for each of them. Quantum
mechanics, evolutionary psychology, and the author's personal life.

The discussion of quantum mechanics is focused on whether the "many
worlds" interpretation of quantum mechanics is correct, as opposed to
the "waveform collapse" theory. The author's stance is that not only
is the "many worlds" theory correct, but it is so clearly correct that
the fact that many people don't agree with "many worlds" shows that
they are insufficiently rational.

The evolutionary psychology discussion is similar. Yudkowsky claims
that scientists are constantly hoping for evolution to favor morality,
which leads to a bias in favor of more pleasant interpretations. The
underlying claim is that for unsettled areas of science, there is
still one rational interpretation that is superior, and if scientists
disagree on how to interpret findings on the frontier of science, it
is because they are not rational enough.

The author frequently cites [Aumann's agreement
theorem](http://rationalwiki.org/wiki/Aumann%27s_agreement_theorem) -
that two perfectly rational people with the same knowledge cannot
disagree. Therefore in practice two rationalists should not
disagree. It seems like the thing for them to do is to argue
incessantly, and if they cannot come to an agreement then each should
conclude that the other is not rational enough. That feels a bit wrong.

The last section of the book discusses more personal issues and the
trouble with growing this rationalist movement. Yudkowsky mentions he
has trouble "getting things done" and he also has trouble getting
groups of people to work together. To me, both of these seem like
problems with what I would colloquially describe as "overthinking it".

To the Yudkowsky-rationalist mind, there is no such thing as
"overthinking a problem". You keep thinking, you get to a more
intelligent solution. The problem is, mental energy is a limited
resource. If every statement and action, you feel obliged to
analyze it to perfection, then you're going to end up more exhausted
than if you let yourself make quick decisions and prefer to be 80%
correct immediately than 90% correct slowly. No wonder the author
laments that he has trouble working as much as he intends to.

Sometimes your goal really does take precedence over rationally
rethinking all of your premises. If you really rethink everything you
do until it's 100% correct, you will constantly be stalled and
frustrated in making progress. Eliezer writes,
for example, that he was quite discouraged in trying to raise
donations from a group of rationalists that the general consensus was
that it was irrational to donate money. Is it actually rational for
rationalists to donate money? Yudkowsky hesitates to attack that
question, probably out of fear of concluding that it is indeed not
rational and thus rationalizing himself out of a job.

I'm not saying
that no nonprofit should collect donations. I just think the
money-raisers should not constantly angst about whether it is really
the most rational thing to collect money. They should not
expect 100% of the followers to think alike and be willing to
donate. They should just practically see what methods work for raising
money, and which don't, and use the methods that work rather than
assuming that arguing about rationalism is the way to solve every
problem.

The core paradox at the heart of Eliezer-style rationalism is that,
when you define "rational" as using the best strategy available, once
you add any additional principles to your philosophy of rationality,
it is inevitable that in some situations, disregarding that principle
is the most effective. Yudkowsky loves Bayesianism because in a
limited number of situations it does provide a perfect analysis of
what to do. But beyond that limited number of simple situations,
it does not seem that a Bayesian approach to a problem is actually the
most effective way of solving it. So why try to be more Bayesian in
your life?

I have a more technical criticism here too. Even in a
situation where you are
just focused on decisions and you have a clear set of input variables,
a Bayesian model may very well not be the most effective. For example,
let's say you have a large enough number of inputs n that you can
process all of them which is O(n), but you can't process all the pairs
of them which is O(n<sup>2</sup>). You have some boolean output you
are trying to decide on. And many of the variables may be
correlated. Logistic regression is probably a better fit here than
naive Bayes, because you'll end up capturing much of the input
correlation implicitly if not explicitly.

When you apply this to a practical situation,
you end up with a system that locally appears to violate Bayesian
statistics. You will have an input that, statistically when X happens,
Y happens 60% of the time. But, your gut tells you that when X
happens, it's actually an indicator of not-Y. Maybe your gut is doing
logistic regression on a large number of hidden variables and coming
to a more successful strategy than your local Bayesian analysis
is. Should you
really cheat on a test when your probability estimate tells you it's
worth it? Or should you listen to your gut telling you to be ethical?
Even if you can't verbalize all the reasons encapsulated in this gut
instinct, it doesn't mean that rejecting it will lead to better
outcomes. Even if you mathematically analyze every visible variable,
it *still* doesn't mean that rejecting your gut instinct will lead to
better outcomes.

I do want my criticism to be falsifiable. So, what would convince me
would be seeing that adopting this rationalist
philosophy actually does lead to better outcomes at some practical
endeavor. This does not yet appear to be happening.

All of that said, the book is quite compelling and contains many
arguments that make me rethink some of my own basic principles. It is
worth reflecting on your own decisionmaking processes, even if you
don't agree with the hyper-Bayesian methodology advocated here.

If you want a quick hit of this book without reading 1800 pages of it, try
this essay on [the twelve virtues of
rationality](http://www.yudkowsky.net/rational/virtues/).

This book also left me curious about the author's theories on
artificial intelligence. How would one build a "friendly AI"? What
would it look like to get 10% of the way there? My suspicion is that
working on "how to make AI friendly" will indeed be a very valuable
thing to do, but you can't really make much progress unless you have
some basic architecture of how any AI would be built, and it doesn't
really seem like humanity is there yet. We need the equivalent of the
Von Neumann architecture - what parts will lead to a whole that can do
humanlike things. Learning functions from vector spaces to booleans is
neat but it's like we've only built a CPU and we haven't figured out
that we'll also need some permanent storage, some I/O devices, and a
way to enter programs.

This book also left me thinking about cryonics. In passing the author
claims that signing up for cryonics is such a good decision that
everyone should do it. I do not have a good counterargument, yet I
have not signed up for cryonics. The pro-cryonics argument might be
the most compelling practical part of this book; I wish Eliezer had
spent as much time on that as he did on quantum mechanics and
evolution.

One last note - this book reminded me a lot of [A New Kind Of
Science](http://www.wolframscience.com/nksonline/toc.html). Both have
quite complex and deep thoughts which diverge a lot
from the mainstream. Both discuss how a hypermathematical approach
could cause a paradigm shift in a different field. Both are convinced
their work is
revolutionary but the concrete evidence is not enough to convince the
world of it. Both are insanely long in a way that discourages
normal people from reading them.

I would like to see more books like this.


---
layout: post
title: "Metamagical Themas, 40 Years Later"
date: 2022-04-07 17:30:00
categories: books
---

It is completely unfair to criticize writing about technology and
artificial intelligence 40 years after it's written. [Metamagical
Themas](https://www.amazon.com/Metamagical-Themas-Questing-Essence-Pattern/dp/0465045669)
is a really interesting book, a really good, intelligent, and
prescient book, and I want to encourage you to read it. So don't take
any of this as "criticism" of the author. Of course, after 40 years
have passed, we have an unfair advantage, seeing which predictions
panned out, and what developments were easy to overlook in an era
before the internet.

Instead of a "book", perhaps I should call it a really interesting
collection of essays written by Douglas Hofstadter for Scientific
American in the early 1980's. Each essay is followed by Hofstadter's
commentary written a year or two after. So you get some after-the-fact
summation, but the whole thing was all written in the same era. This
structure makes it really easy to read - you can pick it up and read a
bit and it's self-contained. Which is yet another reason you should
pick this book up and give it a read.

There are all sorts of topics so I will just discuss them in random
order.

## Self-Referential Sentences

This is just really fun. I feel like cheating, quoting these, because
I really just want you the reader to enjoy these sentences.

> It is difficult to translate this sentence into French.

> In order to make sense of "this sentence", you will have to ignore
  the quotes in "it".

> Let us make a new convention: that anything enclosed in triple
  quotes - for example, '''No, I have decided to change my mind; when
  the triple quotes close, just skip directly to the period and ignore
  everything up to it''' - is not even to obe read (much less paid
  attention to or obeyed).

> This inert sentence is my body, but my soul is alive, dancing in the
  sparks of your brain.

Reading this is like eating sushi. It's just one bite but it's
delicious and it's a unique flavor so you want to pay attention to
it. You want to pause, cleanse your mind, have a bit of a palate
refresher in between them.

> The reader of this sentence exists only while reading me.

> Thit sentence is not self-referential because "thit" is not a word.

## Fonts

Hofstadter loves fonts. [Fluid Concepts and Creative
Analogies](https://www.amazon.com/Fluid-Concepts-Creative-Analogies-Fundamental/dp/0465024750)
goes far deeper into his work on fonts (and oddly enough was the first
book purchased on Amazon) but there are some neat shorter explorations
in this essay collection.

To me, reading this is fascinating because of how much deep learning
has achieved in recent years. My instincts nowadays are often to be
cynical of deep learning progress, thinking thoughts like "well is
this really great progress if it isn't turning into successful
products". But comparing what we have now to what people were
thinking in the past makes it clear how far we have come.

The fundamental topic under discussion is how to have computers
generate different fonts, and to understand the general concept that
an "A" in one font looks different from an "A" in another
font.

Hofstadter is really prescient when he writes in these essays
that he thinks the task of recognizing letters is a critical one in
AI. Performance on letter recognition was one of the first tasks that
modern neural networks did well, that proved they were the right way
to go. And that's several generations of AI research away from when
Hofstadter was writing!

Roughly, in the 80's there was a lot of "Lisp-type" AI research, where
many researchers thought you could decompose intelligence into
symbolic logic or something like it, and tried to attack various
problems that way. The initial "AI winter" was when that approach
stopped getting a lot of funding. Then in the 90's and 2000's,
statistical approaches like support vector machines or logistic
regression seemed to dominate AI. The modern era of deep learning
started around 2012 when AlexNet had its breakthrough performance on
image recognition. Hofstadter is writing during the early 80's, in the
first era of AI, before either of the two big AI paradigm shifts.

That said, it's interesting to see what Hofstadter misses in his
predictions. Here he's criticizing a program by Donald Knuth that took
28 parameters and outputted a font:

> The worst is yet to come! Knuth's throwaway sentence unspokenly
  implies that we should be able to interpolate any fraction of the
  way between any two arbitrary typefaces. For this to be possible,
  any pair of typefaces would have to share a single, grand, universal
  all-inclusive, ultimate set of knobs. And since all *pairs* of
  typefaces have the same set of knobs, transitivity implies that
  *all* typefaces would have to share a single, grand, universal,
  all-inclusive, ultimate set of knobs.... Now how can you possibly
  incorporate all of the previously shown typefaces into one universal
  schema?

Well, nowadays we know how to do it. There are plenty of neural
network architectures that can both classify items into a category,
and generate items from that category. So you train a neural network
on fonts, and to interpolate between fonts, you grab the weights
defined by each font and interpolate between them. Essentially "style
transfer".

Of course, it would be impossible to do this with a human
understanding what each knob meant. 28 knobs isn't anywhere near
enough. But that's fine. If we have enough training data, we can fit
millions of parameters or billions of parameters.

It's really hard to foresee what can change qualitatively when your
quantitative ability goes from 30 to a billion.

By the way, if you like Hofstadter's discussions of fonts and you live
in the San Francisco area, you would like the [Tauba
Auerbach](https://www.sfmoma.org/exhibition/tauba-auerbach-s-v-z/)
exhibit at SFMOMA.

## Chaos Theory

Hofstadter writes about chaos theory and fractals, and it's
interesting to me how chaos theory has largely faded out over the
subsequent decades.

The idea behind chaos theory was that many practical problems, like
modeling turbulence or predicting the weather, don't obey the same
mathematics that linear systems do. So we should learn the mathematics
behind chaotic systems, and then apply that mathematics to these
physical cases.

For example, [strange
attractors](https://en.wikipedia.org/wiki/Attractor#Strange_attractor). They
certainly look really cool.

Chaos theory seemed popular through the 90's - I got some popular
science book on it, it was mentioned in Jurassic Park - but it doesn't
seem like it has led to many useful discoveries. I feel like the
problem with chaos is that it fundamentally does not have laws that
are useful for predicting the future.

Meanwhile, we are actually far better nowadays at predicting the
weather and modeling turbulent airflow! The solution was not really
chaos theory, though. As far as I can tell the solution to these
thorny modeling problems was to get a lot more data. Weather seems
really chaotic when your data set is "what was the high temperature in
Chicago each day last year". If you have the temperature of every
square mile measured every 15 minutes, a piecewise linear model is a
much better fit.

I think [numeric linear
algebra](https://en.wikipedia.org/wiki/Numerical_linear_algebra) ended
up being more useful. Yeah,
when you predict the outcome of a system, often you get the "butterfly
effect" and a small error in your input can lead to a large error in
your output. But, you can measure these errors, and reduce them. Take
the norm of the Jacobian of your model at a point, try to find a model
where that's small. Use numerical techniques that don't blow up
computational error. And get it all running efficiently on fast
computers using as much data as possible.

There's a similar thing happening here, where the qualitative nature
of a field changed once the tools changed quantitatively by several
orders of magnitude.

## AI in 1983

These essays make me wonder. What should AI researchers have done in
1983? What would you do with a time machine?

It's hard to say they should have researched neural networks. With 6
MHz computers it seems like it would have been impossible to get anything to
work.

AI researchers did have some really great ideas back then. In
particular, Lisp. Hofstadter writes briefly about why Lisp is so
great, and the funny thing is, he hardly mentions macros at all, which
nowadays I think of as the essence of Lisp. He talks about things like
having an interpreter, being able to create your own data structures,
having access to a "list" data structure built into the language, all
things that nowadays we take for granted. But this was written before
any of Java, Python, Perl, C#, JavaScript, really the bulk of the
modern popular languages. There was a lot of great programming
language design still to be done.

But for AI, it just wasn't the right time. I wonder if we will look
back on the modern era in a similar way. It might be that modern deep
learning takes us a certain distance and "hits a wall". As long as
GPUs keep getting better, I think we'll keep making progress, but
that's just a guess. We'll see!
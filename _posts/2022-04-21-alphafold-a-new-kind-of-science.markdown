---
layout: post
title: "AlphaFold: A New Kind of Science"
date: 2022-04-21 15:00:00
categories: physics
---

Last night I was watching an [interesting video on
AlphaFold](https://www.youtube.com/watch?v=B9PL__gVxLI), which is
basically using modern deep learning techniques to solve a
longstanding problem in molecular biology, determining how a protein
folds based on its sequence.

One part that is interesting is that they develop an intermediate
structure which looks very "vectory" - a matrix of how close each part
of the molecule is to each other part. In some sense this is
redundant; you are storing a position for each pair instead of a
single position per component. But it means if you screw up one part
of the output you don't automatically screw up all the other parts. It
is more "local" in a sense.

The other part that is interesting to me is that it is an approach
towards solving the "middle size of problem" that I mentioned in my
previous post on the ["theory of
everything"](/physics/2022/03/25/a-theory-of-everything.html). How
should we interpret this?

## The Lottery Ticket Hypothesis

One way of understanding modern machine learning is the [Lottery
Ticket
Hypothesis](https://roberttlange.github.io/posts/2020/06/lottery-ticket-hypothesis/). Roughly,
the lottery ticket hypothesis says that for problems that deep
learning works well on, there exists an algorithm that solves
the problem, and you know how to make a large deep network that is shaped in
a way that is similar to this solution, so probably there is some subset of the
randomly initialized deep network that happens to be close to the solution. The
process of training a deep learner can then be thought of as searching
for this subnetwork that happens to contain the answer.

The lottery ticket hypothesis is not necessarily true. For example,
the training process might get closer and closer to a decent answer by
assembling the algorithm bit by bit, rather than discovering an
algorithm that already is mostly there at initialization time. It's
probably different for different problems. But it's a useful
approximate way of thinking about it. Deep learning is a search
through the space of possible formulas, looking for one that solves
the problem.

## A New Kind Of Science

Here I'm talking about the generally-poorly-regarded [book that
Stephen Wolfram quasi-self-published 20 years
ago](https://en.wikipedia.org/wiki/A_New_Kind_of_Science). One way of
interpreting the thesis here is that we could discover the laws of
physics by searching through the space of all small computer programs.

In a sense, this is exactly what AlphaFold is doing! It isn't using
Mathematica, and it isn't using any of Wolfram's preferred algorithms
like a linear search over cellular automata rules, and it isn't aiming
at sub-quantum-mechanics laws of physics. Okay, that's a lot of things
that are different. But the fundamental idea of discovering laws of
science by doing an exhaustive computer search, that part is what
AlphaFold is doing.

## The "Real" Laws of Physics

You might say that AlphaFold isn't looking for the *real* laws of
physics. It isn't even pretending to model every electron and use those
low-level laws of physics to calculate protein structure. It's just
looking for an approximation that works at the level we want to
calculate at.

But is any science actually looking for the *real* laws? Or just laws
that are close enough for any practical use?
Differential calculus is great for physics because it is a great
approximation tool. Any function that is "continuous enough" can be
approximated locally by a matrix, you can approximate this matrix with
calculus, and then you can get pretty good answers. That's why we like
using it to solve problems. We have never observed a true "real
number" in nature (because real numbers, rigorously defined, are based
on infinite sets).

We have spent a long time lamenting that we cannot get quantum
mechanics and gravity to line up. Well, that doesn't really
matter. What we should be lamenting is that neither quantum mechanics
nor gravity provides a useful approximation for these
intermediate-size problems like how to construct a useful machine out
of 1000 atoms. Tools like AlphaFold seem like they could get us there.

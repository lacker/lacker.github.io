---
layout: post
title: "The Unreality of Pi"
date: 2022-02-18 09:00:00
categories: math
---

To me, there is a mystery at the heart of mathematics. Why does it
work? Why does it tell us useful things about the world?

One philosophy is that mathematical truth is like Plato's Forms, an
abstract, perfect truth that exists outside of physical reality. You
can think of mathematics as a type of language; it's language with a
convention that any possibility of error is completely forbidden. As
Wittgenstein suggests, things we cannot speak of we must pass over in
silence. Mathematical language cannot say anything about politics,
about current events, about the precise nature of a real-world cannonball lofted
through the air, because it's possible that our observations about
these things are mistaken. Burn all this away, and what is left is the
mathematics.

This way of looking at mathematics is powerful, but it's missing
something. Think of the greatest drama of historical mathematics, the
rise and fall of Euclidean geometry. For about two thousand years,
Euclid's Elements was the main textbook for teaching
mathematics. Euclid started with a few axioms for geometry, and proved
vast swaths of geometry from these axioms. The one aesthetically
displeasing part was the fifth axiom - if you have points ABCD, and
ABC and BCD are acute angles, then the rays BA and CD must
intersect. In other words, the "parallel postulate" - that for every
line and a point not on that line, you can only draw one parallel line
through that point.

People thought this axiom was obvious for a long time, and it was only
considered aesthetically displeasing that it was so much more
complicated than the previous axioms. Mathematicians tried to prove it from
the other axioms for a long time, but it turned out this was
impossible.

In fact, this axiom is worse than aesthetically displeasing. This
axiom is *false*. With the discovery of special relativity, scientists
realized that space is not flat. It is curved. You *can* draw multiple
parallel lines through a point. They just have to be really, really
close to each other.

It's worse than that. "Real numbers" are also not real. Quantum
mechanics now tells us that the precision of a measurement is
limited. But the rigorous definition of "real
numbers" requires an infinite sequence of numbers getting closer and
closer. The mathematics doesn't work if small numbers are prevented
from going smaller than the Planck length. A circle of radius 1
doesn't really have a circumference of pi - it's a little bit off.

Euclidean geometry is also no longer considered to be the highest
standard of rigor. It's interesting to look at a modern mathematical
computer formalization of geometry, like [Lean's geometry
library](https://github.com/leanprover-community/mathlib/blob/master/src/geometry/euclidean/basic.lean). Euclid
took all sorts of theorems for granted, that the computer insists we
prove. How do we know that the angle ABC is equal to the angle CBA?
How is the angle ABB defined? If you say it can't be defined, then every
single time you use the angle ABC, you need to prove that A does not
equal B, and B does not equal C. Euclid basically ignored this issue,
and got lucky in that it never led to a bug in his proofs. Lean
decides that the angle ABB should be considered to be a 90 degree
angle. But from a modern point of view, geometry is hopelessly messy
to make rigorous. It is far cleaner to build up integers, sets,
rationals, real numbers, real analysis, and then tack on geometry at
the end.

Euclidean geometry ends up being far from abstract mathematical
truth. With modern progress in mathematics, we see that Euclidean
geometry is not a great approximation of the world, and it isn't the
most rigorous area of mathematics either. We keep it around for
historical and teaching purposes, basically.

So how can we explain the fact that for thousands of years Euclidean
geometry was the pinnacle of mathematics? We could have another
mathematical revolution, where we discover that our current
mathematics methods are not great approximations to the world, and
they aren't sufficiently rigorous, either. The value of mathematics
cannot lie in the fact that it *is* an abstract truth. It is the
*quest* for this abstract truth. And the quest for this truth is a
human activity. This quest would not exist without people to go
questing.

Personally, I suspect that mathematics is on the verge of another
revolution like the non-Euclidean revolution. Software will eat
mathematics. The standard for mathematical rigor will rise again - any
proof that cannot be checked by a computer will be considered
insufficiently rigorous. It will be obvious there is a mathematical
revolution once the computers knock off a few of the longstanding open
problems. Just like nowadays many subareas of physics basically
require that you write a decent amount of Python code and become a
decent software engineer, in the future mathematics will also grow
much more intertwined software engineering.

That's my prediction, anyway.

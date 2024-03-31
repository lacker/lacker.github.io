---
layout: post
title: "Library Search"
date: 2024-03-31 12:00:00
categories: ai
---

Last month I wrote about [building a math
AI](/ai/2024/02/29/how-to-build-math-ai.html)
and mentioned
that I think we need to optimize the "library search" problem. In this
post I'd like to explain what library search is, why it's important,
and what we can do about it.

## Motivation

A few years ago I got excited about the IMO Grand Challenge. I thought
it would be interesting to look for a team of smart people working on
it and see if I could help out. One group of people was focused on
using the Lean theorem prover, and one place it seemed like I could
help out was formalizing IMO problems in Lean, to use as training
data. I formalized some of them, for example
[here](https://github.com/leanprover-community/mathlib/pull/4261)
and
[here](https://github.com/leanprover-community/mathlib/pull/4450),
but it seemed like progress was so slow, the whole strategy was
unsound. If it takes you more than a day to code review a single point of
training data, it's going to be hard to train an AI. So, I gave
up on this approach. But, I did learn a lot about the annoying parts
of formalizing proofs.

Lean has many different tactics for solving proofs. One general
operation that you do all the time is just "applying a theorem".

For example, let's say you have two existing theorems. Foo implies
bar, and bar implies baz. Now you want to prove that foo implies
baz. In Lean this proof looks like:


```
theorem foo_implies_baz : foo → baz :=
begin
  intro _,
  apply bar_implies_baz,
  apply foo_implies_bar,
end
```

In particular, you need to know the names of the existing theorems you
want to use, `foo_implies_bar` and `bar_implies_baz`. "library search"
is the name of a Lean tactic that tries
to figure this out for you, but is slow and fails a lot. (The tactic
is now renamed `exact?`, but it'll always be `library_search!` in my
heart.)

## Why This Is Hard For Humans

It's hard for humans to remember all these theorem names.

This might be unintuitive. For a programmer, it doesn't seem
unreasonable that you have to know the name of a function you're
calling. How could it be any other way?

For a mathematician, a way of manipulating a formula doesn't typically
have a name. Imagine you're doing long division. You can remember the
whole process, but you don't give a name to every step of the
way. There are too many different steps, only slightly different from
each other.

It becomes harder as the size of the library increases. It's like the
category of jokes where one mathematician calls a problem "trivial"
but another mathematician is stumped by it.

Take a look at [these
theorems](https://github.com/leanprover-community/mathlib/blob/master/src/data/nat/basic.lean)
and it'll make more sense why it's hard. There is just an explosion of
basic facts about numbers, all of which
a reasonably competent mathematician would just say, "this is
trivially true".

For example, really do click that link above. Then take a look at
`eq_mul_of_div_eq_left`. In English, "if a
is a multiple of b, and a divided by b rounded down is c, then c times
b is a."

For enlightenment, go ahead and read the definitions of
`div_eq_iff_eq_mul_left`, `add_mod_eq_add_mod_left`, and the dozens of
others of similarly named theorems.

In programming, a library with 400 rarely-used functions would be
unusable. In mathematics, though, it's fine, in a sense. As long as
everything is true, and a human looking at it thinks it's obviously
true, then the only problem is when you have to know these names.

## Why This Is Hard For Computers

It's hard for humans to memorize a whole dictionary, too. For
computers, it's easy. So why isn't this lookup easy for computers? Why
isn't library search nicely solved in existing proof assistants?

I do think this is solvable. The basic problem is the inexact nature
of the lookup. Theorems have variables in them. When you know that
`a < b` implies `a + c < b + c`, this theorem is true for any values
of
`a`, `b`,
and `c`. As you have more facts available, and more theorems in your
library, this gets slower. In the most general case, you have to do an
exponential matching process.

That said, people have found some reasonable data structures for doing
this sort of lookup. The [discrimination tree and fingerprint indexing
from the E theorem prover](https://matryoshka-project.github.io/pubs/ehoh_article.pdf)
are good examples. And I think a lot of it is the sort of
performance low-hanging fruit where if you specifically design data
structures and profile for this, you'll be able to do better than tacking a
lookup structure on after the fact.

Will LLMs just solve this automatically, with scale, by putting the
entire library inside their context window? It's possible. Maybe
there's a good argument against this. I'm honestly not sure how to
predict the future path of LLM skills. At some point I have to fall
back on my thesis of "scaling LLMs will not solve all outstanding
problems in everything", if only by a sort of Pascal's reasoning.

## The Ideal Proof

A formalized proof should not have to be constantly citing the names
of theorems. For either a human or an AI, rather than writing and
validating this proof:

```
theorem foo_implies_baz : foo → baz :=
begin
  intro _,
  apply bar_implies_baz,
  apply foo_implies_bar,
end
```

you should be able to write the proof the way a human writes a proof
in prose, by just stating true things that follow from the premises
without giving an explicit rationale for them.

```
theorem foo_implies_baz: foo -> baz {
  bar
}
```

In 99% of cases, the compiler should just be automatically handling
the library search for you. I think natural exceptions would be fancy tactics
like induction. In most human-written proofs, when you're using
induction, you do say, "now I'm using induction".

You can think of this like a mini proof search. It's just that you are
searching just a few steps. One retrieval from the library, plus a bit
of normalizing between logically equivalent expressions. It's
like a base case that the proof search needs to handle before it can
expand to more complicated cases.

## Conclusion

I think automatically handling library search will make proofs easier
for both humans and AIs. You shouldn't need to use the names of
theorems.

There's a related, somewhat harder problem of "rewrite
search". Originally I was going to write about that, too, but this
post is getting long, so I'll cut off here. Thanks for reading! Next
month I'll write about the rewrite search problem. 

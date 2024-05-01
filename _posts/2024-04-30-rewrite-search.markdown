---
layout: post
title: "Rewrite Search"
date: 2024-04-30 22:00:00
categories: ai
---

Sometimes you know things because of theorems whose form is, when you
know one true thing, then you know another true thing. `P` implies `Q`. If
`x` is even, then `x^6` is divisible by `64`. And `10` is even, therefore `10^6`
must be divisible by `64`. Figuring out when this applies is the
"library search" problem I [wrote about last month](/ai/2024/03/31/library-search.html).

Rewrite search is a bit different. A rewrite happens when you know
that two different expressions are equal. So you can replace one of
those expressions with the other, inside a longer statement. `10^6`
equals a million. And `10^6` is divisible by `64`, so a million is
divisible by `64`.

The basic "rewrite search" problem is, given two different
expressions, figure out how to make them equal through a series of
rewrites.

## Why is rewrite search important?

I think most "normal person mathematics" can be thought of as a series of rewrites.

Consider a question like "what are the factors of 27?" (I found this
by googling "math question" and taking the first one that looked like
a pure math question.)


The normal way to solve this is roughly, first you consider that `27 =
3^3`. Then you perhaps know that for a prime `p`, the factors of `p^n` are
`p^k` for `k` in `[0, n]`. You can write a series of expressions like 

```
factors(27)

factors(3^3)

3^k for k in [0, 3]

3^0, 3^1, 3^2, 3^3

1, 3, 9, 27
```

where each expression is a rewrite of the expression in the previous row.

There are a few more details here that make this not purely a
rewrite question. For example, we didn't have a theorem for the
factors of `3^3` specifically. We had a theorem for the factors of `p^n`,
where `p` was prime. So we need to be able to rewrite based on a
formula, and to apply some conditions to the formula. We need to know
that `3` is prime, and that isn't a "rewrite search" type of problem,
that's a "library search" type of problem.

Another detail is that we didn't start off with a particular
destination in mind. We didn't have the problem of, rewrite
`factors(27)` into `[1, 3, 9, 27]`. We just wanted to rewrite `factors(27)`
in a simpler form.

Another detail is simplifying the "for loop", which maybe happens in
multiple steps.

That said, the essence of the problem is rewriting. Most questions of
the form "solve for x" or "what does this expression evaluate to" are
fundamentally about rewriting. As opposed to questions of the form
"prove that X is true", which are often more implicationy.

## What can we do about it?

orked on the Lean [rewrite_search tactic](https://github.com/leanprover-community/mathlib/blob/master/src/tactic/rewrite_search/explain.lean) for a while. It didn't
end up as useful as I had hoped. The main problem is that there are so
many possible ways to rewrite a formula, you can't use a plain
breadth-first search and get very far. We need to be using AI
heuristics. In Lean we were hoping to get mathematicians to tag
theorems based on how good they were for rewriting, but this was just
too much of a hurdle.

Intuitively, I think this makes sense, that we should have a heuristic
sense for how good expressions are to rewrite into other expressions.
You see `27` in a math problem, you
immediately think that's `3^3`. You see `6401` in a math problem, you
immediately think that's `80^2 + 1`. These potential rewrites move
forward in your mind, even if these numbers are just a small part of a
larger expression.

The other thing we need to do tactically is to be using rewrites
starting at every expression in a problem. A [bidirectional
search](https://en.wikipedia.org/wiki/Bidirectional_search). When
you're searching for a path of length `2n` from A to B, with a branching
factor of `b` choices at each step, and you start just at A, you have to
search `O(b^2n)` nodes. If you start forwards from A and backwards at B,
you only have to search `O(2b^n)` nodes, which looks similar but is far
better.

## Conclusion

I think these two forms of reasoning, library search and rewrite
search, plus basic propositional logic, are capable of solving a large
amount of mathematics problems.

Now what? In a sense this has been a "bottom up" view, answering what
tactics are useful for solving math problems. We also need a "top
down" view. Can we build a math AI that starts with a narrow focus on
a small set of math problems, nails that, and expands its domain of
mastery over time? I'd like to write more on this topic next month.

Thanks for reading!

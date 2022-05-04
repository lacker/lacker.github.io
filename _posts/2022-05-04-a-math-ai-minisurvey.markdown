---
layout: post
title: "A Math AI Minisurvey"
date: 2022-05-04 16:00:00
categories: ai
---

I'm curious about the idea of using AI to discover math proofs, so I thought I'd write up
my thoughts on some of the relevant papers. This is very much not a
complete list, but I feel like these papers define my "mental
frontier" in some way.

If there are other papers you think are equally cool and relevant, I'm
interested to hear about it.

## [GPT-f](https://arxiv.org/abs/2009.03393)

The general strategy here is to hook up a text-based transformer to a
proof assistant. They chose Metamath for the proof assistant, and it's
interesting that rather than use an existing Metamath implementation
they basically wrote their own in Python. There's a search 128 steps
into the graph, with each step guided by the transformer.

The "graph" here is like the move tree in chess or go. Each step is
something like, prove statement X given all this stuff we know to be
true. So you don't really change the state of the search as time goes
on, you just add to it. The tree in chess is also not really a tree
once you consider that some boards you can reach via multiple move
orders, but it's logically more tree-like.

Choosing Metamath is tough. Metamath is kind of like the assembly
language of proof assistants. A single step in a language like Lean
can take many steps in Metamath. The core problem here is that it's
annoying and buggy to hook up any external logic to a proof
assistant. All the proof assistants are using their own weird
languages, their own weird compilers, these really strange
toolchains. So this does make a ton of sense as a practical decision -
Metamath was simple enough they could just implement their
own.

Still, if you can only search for 128 steps, there are single Lean
tactics that are fewer Metamath steps than that.

## [Polu 2022](https://openai.com/blog/formal-math/)

This one is a cooler successor. It's using Lean instead of Metamath -
presumably someone did a bunch of grunt work to hook it up. Props.

There's a transformer here trained on CommonCrawl and the "WebMath"
corpus. I'm impressed that anything like this works at all. Maybe it's
just fine to train on a huge blob of data that contains a nonsense
superset, there's a bunch of extra space used but if you have the
space then logically I guess the capability is the same.

They train the model to find the next tactic used in a proof, and to
minimize the size of the resulting proof. Makes sense to minimize the
size of a proof - proofs have a weird property where technically you
can add all sorts of extraneous statements into a proof, and the proof
is equally valid. If you aren't sure what to do, you do have some
incentive to just write down a slew of true statements. (I got a 3/7
partial credit on an IMO geometry problem for doing this, and
accidentally doing something useful.) When learning you really should
prefer a shorter, more beautiful proof, though.

Fine-tuning used a dataset which I believe is derived from lean's
mathlib. The lean mathlib community is quite impressive. [20 commits
per day in
March](https://leanprover-community.github.io/blog/posts/month-in-mathlib-mar-2022/). I'm
not quite sure how it compares to the other theorem proving
communities, but the other ones tend to be less "one open source project with a
swarm of activity" and more "many different groups doing different
things" so I feel like Lean is the most likely to win out.

It's tough that they had to manually formalize some training
problems. Getting reasonable training data is really hard for these
math proofs.

One aspect of this prover that I think is under-recognized is how much
it uses complex Lean tactics. `nlinarith`, `field_simp`, `norm_num`,
these are each really complicated manual theorem-proving
tactics. There might be more code in `nlinarith` than in the
AI-training components of this system. In one sense, this is good
because as people make more tactics it will make this sort of approach
stronger. In another sense, this approach seems like it will be
restricted to the areas where we have really good tactics.

## Transformers overall

I feel like transformers for proof generation are really hamstrung by
a lack of training data. Transformers would love to have billions of
proofs to learn patterns from. This seems achievable in some cases,
like solving some systematic variety of problem by generating a lot of
them. But many problems don't work this way.

I am curious whether a more reductionist approach would be
useful, where you specifically try to generate "interesting
problems", in a sub-area like algebraic inequalities or Euclidean
geometry. In practice, mathematicians do seem capable of
differentiating interesting problems from boring problems. You
generally want to study interesting problems to get better at
math.

## [The Gowers Manifesto](https://gowers.wordpress.com/2022/04/28/announcing-an-automatic-theorem-proving-project/)

Sort of a different angle on the problem entirely. Gowers poses a few
questions in the blog post that I think would have a "standard machine
learning" answer. I imagine a dialogue like this.

*Question. What is it about the proofs that mathematicians actually
find that makes them findable in a reasonable amount of time?*

*Answer. The state of a partial proof has many different features that
each contribute a little bit to this. We can model these properties with
deep learning.*

*Question. Humans seem to be able to find proofs with a remarkably
small amount of backtracking. How do they prune the search tree to
such an extent?*

*Answer. A mathematician's intuition tells them what a good next step
is, given the current state of the proof. We can approximate this
intuition with a deep learning model.*

*Problem. Come up with a precise definition of a “proof
justification”.*

*Answer. A proof justification is a deep learning model that takes a partial proof state
and gives you possibilities for a proof tactic. It justifies any proof
for which the combination of the scores for each of its tactics is high.*

To me, the problem with these answers is that deep learning alone
has trouble with the minimal amount of training data that human
mathematicians get. We need to be able to bootstrap. We need
a lot of good proofs to learn what good proofs look like. More than
human mathematicians are going to provide, Lean community
notwithstanding. So I think we really do need better answers to these
interwoven-but-related questions that Gowers is posing.

At the heart of it is a basic principle that shorter proofs are more
elegant. But that can't be everything - it isn't elegant to prove that
234 + 678 = 912 even if the proof is very short.

## [The Lottery Ticket Hypothesis](https://arxiv.org/abs/1410.5401)

I hope this hypothesis is true because it makes my mental model of how
deep learning works a lot simpler. Why are transformers so good?
Because the previous methods for handling sequences had no way to
model a function that jumps around the input like

```
# Let a be an array of a bunch of smallish integers
i = 0
for _ in range(100):
  i = a[i]
return i
```

If that's your function, the ideal circuit to solve it just isn't a
subset of the deep learning networks that you build if you use
something like LSTM. With a transformer you can in fact make a network
that accesses different locations. Voila.

How much can a transformer model? I feel like a transformer is still
limited, by its depth. Can you teach a transformer how to multiply two
numbers? I think there is some sort of algorithmic limit, for
functions that cannot be embedded in a transformer network, and
perhaps these mathematical heuristics cannot be embedded in a
transformer network. I'm not sure though.

## Conclusion

What is the simplest function of sequential data that transformers
cannot learn?

Is there any heuristic for whether a math problem is interesting or
not?

Let me know if you have a good answer...

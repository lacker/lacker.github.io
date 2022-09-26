---
layout: post
title: "Notes on Inductive Programming"
date: 2022-09-26 14:30:00
categories: ai
---

After the overwhelming popularity of last week's blog post taking
notes on an AI paper, I thought I'd continue the series.

So there was a reference in the Chollet paper to the paper [Inductive
Programming Meets the Real World](Inductive programming meets the real
world.), which sounded interesting. Let's check that out today.

## Background

But first, what is inductive programming? Let's check [Wikipedia](https://en.wikipedia.org/wiki/Inductive_programming).

Jeez. There's dozens and dozens of references, all this history. I
consider myself reasonably knowledgeable about general computer
science things, and yet I have never heard of inductive
programming. It gives me a sensation of... vertigo? Like you peer over
the edge and see instead of a little ridge, the hole goes deep, so
deep you have to give up hope of ever truly exploring its boundary.

But basically, it's learning programs given some sort of incomplete
specification. As opposed to, learning programs given an entirely
complete specification, which is "deductive" programming. Naturally I
haven't heard of that at all either.

How do these people get Wikipedia pages? Is this good for anything?
Does it actually work? I guess this is just the divergence of academic
and industrial computer science.

I guess the most logical sort of incomplete specification is, here's a
bunch of inputs and outputs. That makes sense. Any other sort of formalistic
way to specify anything seems like a pain.

## Meeting the Real World

The paper has a couple Microsoft authors and seems to allude heavily
to this one feature in Excel where it will autogenerate
transformations for columns. It's funny that they don't explicitly say
anything about it, but I'm guessing there's some half-research
half-product group, and they built this feature for Excel and also
published this paper about their work.

They say that originally inductive programming dealt with
simple, abstract logical tasks like sorting or reversing a
list. There's no citation here, though. Huh! How exactly do you learn
to sort a list from examples? That doesn't seem simple at all to
me. I mean, deep learning generally cannot do it. What form of sort
does it learn? Insertion sort?

The authors also seem to care a lot about "no code" operation. Helping
people out who don't know how to program. That's all well and good,
but it seems like academic research is precisely the opposite way to
investigate no-code tools. Academic research is good if you are like,
trying to solve abstract math puzzles, or decoding radio telescope
signals, something where there's no possible profit, so the best
funding is going to be through the academic channel. Whereas the top ten
no-code tools out there are all going to raise more money than any
academic group has access to.

## Recent Techniques

This section is like a little survey covering different techniques for
inductive programming. My point of view is, I feel like there is a
"general skill" for programming, and I am curious about which of the different
techniques seem to me like promising ones for obtaining this general skill.

# DSL synthesizers

To me, the whole idea of a DSL is like, a way of stretching your
techniques to go a little bit further, but something that
fundamentally doesn't scale very far. It's like the Jekyll markup
language. (On my mind since I was just debugging some Twitter card
markup problems with this blog.) It's great
for building websites, but if you try to make everything obey this
restricted form of `strip_html | replace foo bar | remove_newlines`
you're eventually going to create a confusing mess.

In particular, is there some DSL synthesizer that could learn to sort
lists, if it hadn't seen this before? It seems like cheating to put
something like "insert into a sorted list" into the DSL. So you'd have
to get down to basic enough things like appending to a list,
comparing... at that point it isn't really a DSL any more.

# Meta-synthesis frameworks

This is just more DSL. Ways to handle even larger piles of DSL
rules. Again I don't see how it could learn to sort lists.

# Higher-order functions

This sounds cool but I don't really understand how it works. In the
example they invent an auxiliary function which, when applied to a
`fold`, reverses a list. That... makes sense. How does it work though?
Can it do sorting? I can't tell, here. I might have to dig in more,
hunt down this Henderson paper.

Let me think about it for a bit. How would you automatically program a
list-reverser? You could guess that the first step would be popping a
list apart into head and tail. But then what? Maybe what you really need is
to work backwards, to guess that you need to calculate two things, you
need to calculate the last item of a list, and you also need to
calculate the reversed everything-but-the-last. That doesn't seem like
it's making progress, though. Well, I don't know how this could
work. But allegedly Henderson does. Seems like a promising lead.

# Meta-interpretive learning

This section annoys me because it's like, okay first let's think of
everything in terms of Prolog. And then the good news is, hey we have
reduced search times for some task. It's like looking through a portal into an
alternate universe where Prolog matters, everyone knows that there is
important work done in the world by Prolog, and improving the
performance of Prolog programs is obviously an interesting idea.

I tried and failed to dig through the Prologisms here. I am dubious
that difficult goals will look like proving `boss(lucas, lucy)`.

# New kinds of brute-force search

Now this sounds promising! It doesn't really get into the details,
though. Just says that there are so many possible programs, it's hard
to check them all, and has some references. Okay.

## Conclusion

*New approaches are needed which allow users to decompose more
complex tasks into sufficiently small subtasks and then incrementally
compose the solutions.*

Yes... although really once you can correctly decompose a programming problem
into subtasks, you've often done the hardest part. So perhaps this
isn't really a no-code thing to do, but just a problem for the
automatic code writer.

List reversing is a good example here. The simplest program to reverse
a list adds in some "auxiliary data". In pseudocode:

```
def reverse_and_add(x, y):
  "Does reverse(x) + y"
  if empty(x):
    return y
  return reverse_and_add(tail(x), cons(head(x), y))
```

Once you know you're implementing `reverse_and_add`, it's a lot easier
than when you're just told you have to implement `reverse`. And then
`reverse` is a special case.

At some point this was a "trick" I was learning. These recursive
programs, often you want to tack in some extra information to come
along on the recursive structure. You need to be "building the answer"
as you go along. Like when you have a data structure and only later do
you think, ah gee it would be nice if every internal node in this tree
also kept track of the total weight of its subtree.

How would a computer get here? I don't know.

Well, this was interesting, sort of a mini-survey. I like writing down
these notes - honestly I just take far more detailed notes than I do
when I'm not going to make them public, and I think about these papers
a lot more, and that's the best part about writing these posts.

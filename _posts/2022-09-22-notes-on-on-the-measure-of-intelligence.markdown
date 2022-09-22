---
layout: post
title: "Notes on 'On the Measure of Intelligence'"
date: 2022-09-22 16:00:00
categories: ai
---

Recently I've been interested in François Chollet's thinking on generality in artificial
intelligence. Even more recently I've been reading [this paper](https://arxiv.org/pdf/1911.01547.pdf), On the Measure of Intelligence. I thought I'd blog some notes to sort
of encourage myself to think more intelligently about it.

I'll just awkwardly munge together my opinions and Chollet's opinions
in these notes. Go read his paper if something here intrigues you and
you want to learn more.

# What is "intelligence"?

Chollet thinks that most AI progress has been on "specific tasks" and
to be really "intelligent" a system needs to be able to handle general
tasks. AI has been successful at specific tasks, like playing chess,
or recognizing handwritten digits. Arguably this is not "intelligence"
because you aren't testing the system's ability to generalize, you
aren't testings its "ability to handle situations it hasn't seen
before".

Even the Turing test is not really general enough in this view. The
Turing test is a weird bar - personally I feel like I am administering
a Turing test to new chat bots when I test out something like
[character.ai](http://character.ai). But it's like a software
engineering interview. Just because I believe *I* can tell when
something isn't intelligent doesn't mean that I think a program that
fools other people is important to try for.

Chollet talks a lot about, what counts as generalization. This seems
like a spectrum to me, there's no clear line where more generalization
is a lot better, generalizing does seem like a good feature for a
system to have, okay.

IQ tests don't seem all that great for measuring AI systems. It's just
too much of a diversion to go do the things that make you better at IQ
tests. Or at least, why bother testing on the same exact thing that
humans test on? There's a PR sense where it convinces the public that
AI is happening, but it doesn't necessarily lead in the right
direction.

# Some interesting criticisms of games

OpenAI trained the AI "Five" to play Dota 2. At first it beat human
players, but a few days later after the humans practiced they could
beat it. It's essentially a very slow learner by human standards if
you measure by "gameplay time" rather than "clock time" - the AI
needed 45,000 years of gametime, and even if in practice you can do
that fast on a big cluster, it's still showing that the underlying
learning algorithm isn't working as well as whatever humans do,
because Dota pros spend more like a single digit number of years, max,
learning Dota.

AlphaGo and AlphaZero haven't been useful outside of board games. This
is sort of true, but on the other hand IMO they provide a good
demonstration of how you can build a larger system out of smaller
parts, with different parts using different AI models. And this is
basically how we are making progress on self-driving cars, or maybe
the fact that self-driving cars are working slower than expected is an
indicator that things aren't working well enough here.

The AI systems can learn on hundreds of Atari games but still don't
play a new Atari game very well. A human expert game player, on the
other hand, is usually pretty good on their first playthrough of a new
game.

It's interesting to think about chess historically... there were
people described in this paper who assumed that solving chess would
naturally require a huge array of mental skills since those are what
people used. Of course in practice the alpha-beta algorithm is super
useful for chess and not really useful for anything that isn't like
chess. Back in the 90's when I was taking undergrad AI classes it did
seem like people thought the chess and game work would be more
relevant than it's turned out to be.

# Athleticism

I never thought of this before, but a parallel question to "what is
intelligence" is "what is physical fitness".

Obviously there is such a thing as physical fitness. You just know
Lebron James is going to be better at juggling than me if we both
practice for a day.

But if you think of physical fitness as "performance on an average
task" then you could easily come up with an incompatible metric. What
if you took an average position, anywhere in the solar system? You'd
end up thinking that humans all had fitness zero because we couldn't
do anything in outer space. Lol.

Robots certainly don't have general fitness if you think of it in a
human sense. Even these industrial robots tend to be like, this robot
installs the rear windows on a Mazda CX-9, and it does it way faster
and more accurately than a human can. But it can't juggle even as well
as me, with days of practice. Much less as well as Lebron James can
juggle.

# Dimensionality

Humans have some parts of intelligence hardcoded. Like
dimensions. Humans have all this instinct for solving 2D geometry
problems, and 3D geometry problems, and then you give the simplest of
4D problems and it's just completely impossible.

Another funny example is shortest-path problems. Humans are pretty
good at instinctively finding the shortest path that meets some
conditions. But they are terrible at finding the *longest* path. For a
computer it's basically the same thing!

Chollet thinks it's important to give an AI system a very similar set
of priors to the set that humans have. I am not sure if I agree with
this or not. Things like object persistence, small number
manipulation. I dunno - personally I feel like the whole notion of
"prior" is overrated because it's mathematically convenient. I don't
really think the human mind works with priors. A prior is more like,
an awkward way of badly summarizing someone's belief system, hinting
at some deep mathematical optimization system that isn't really
optimal in practice.

# "Skill-acquisition efficiency"

Chollet's definition of intelligence:

*The intelligence of a system is a measure of its skill-acquisition
efficiency over a scope of tasks, with respect to priors, experience,
and generalization difficulty.*

Personally, I neither agree nor disagree with this statement. It just
doesn't really bother me how we define intelligence. I guess that
makes it funny that I am thinking so much about this paper that is
entirely about defining intelligence!

What definitely seems true is that current AI systems require too much
training data. Humans learn things with a lot less training data, and
we don't really have incredible priors that are solving the problem
for us. The best example I think is multiple video games. You play 100 Steam
first-person shooters, you're going to pick up the 101st pretty
quickly. Like you play it through once and you do pretty well on that
playthrough.

There is not quite an analog for, study this small number of entities
and learn what you can. Like meditating on it. How much can you train
on a single image? The whole supervised learning thing doesn't really
make sense on it. You need some other... some other something.

# Personal aside

I am pretty interested in video games and AI playing video games. I
tried for a while to make a reinforcement learning agent play Slay The
Spire. I fell completely short, mostly because it seemed like I would
never get enough training data to make any of the RL techniques work.

What it "feels" like is that the AI doesn't really understand things
that a human picks up very quickly. Just the basic mechanics like,
okay we have a deck of cards, every turn we are drawing five cards
from that deck. An AI model isn't learning that underlying
logical structure. Deep learning can learn this but in some crazily
inefficient way where it's memorizing a ton of pairs of inputs and
outputs. All that inefficiency I think just adds up to not letting you
play the whole game.

Why is this interesting at all? I don't know, maybe it's like a
curse. I have this instinct where I try to do something for a while,
and then I end up thinking, hmm, I wonder if a computer could do this
better. And then I think the same way when I'm doing, not some
professional mundane task, but having fun, playing a game. I end up
a bit bored when a computer can solve a game - like chess - but I
think the games that computers currently can't solve - like Magic: the
Gathering or Slay the Spire - are pretty interesting. But if an AI did
solve them, I think I would get bored by them. I guess that's okay though.

# Evaluating general intelligence

Okay, so there's a whole lot of notation on how to evaluate
intelligent agents. Basically it's like, instead of having one task,
you have a bunch of task-categories and what you really want is to
pick up each new task-category quickly.

I am not sure what exactly the difference is between this and a more
normal model. You can just think of a task as a more general
thing. Like instead of "is this picture a cat or a dog" your task is
"your new task: categorize cats and dogs. here's n examples,
categorize example n+1". Yeah, you can add up the scores different and
look at asymptotes of things, but I feel like it all adds up to just
saying, we need to be measuring more abstract, more general tasks. And
then you can have thetas with lots of subscripts, but, I just know
that's not quite going to stick in my head.

# Algorithmic complexity

*The Algorithmic Complexity of a string is the length of the shortest
description of the string in a fixed universal language.*

Like a Turing machine. Although in practice Turing machines are quite
inconvenient, I'd rather go with some minimalist lisp here.

So literally should we just be looking for small Lisp programs that
generate given outputs? I mean, that seems like a possible thing to
try to code. The [best ARC solution on
Kaggle](https://www.kaggle.com/c/abstraction-and-reasoning-challenge),
as far as I can tell, is brute forcing combinations of some hard coded
set of 100 or so functions.

There's some point here that I don't understand. Chollet doesn't want
to simply measure the goodness of a solution by how short it
is. Instead, first there is a definition of "generalization
difficulty". But, the generalization difficulty refers to the shortest
possible of all solutions that achieve at least a certain skill rate
during evaluation. This seems... completely uncalculateable? If you
could actually find the shortest program that generates a particular
output that would probably violate some sort of diagonalization
principle. I'm not sure whether I'm understanding this right, but if I
am understanding it, then I don't think I agree with it.

I like the more basic point of, just looking for small programs that
generate a particular output is a very general task by its nature. If
anything, the 2D grids of ARC are anthropocentric. A 2D grid isn't all
that natural. It's just a really great fit for human eyeballs,
terminal programs, and GPUs. A plain old list is more logical; you use
lists all the time in your head like, I have this list of three
errands to do before dinnertime. I'm never making a 2D grid in my head
to go about everyday life.

# Program synthesis

"Program synthesis" sounds pretty cool. Chollet says his line of
reasoning "encourages interest in program synthesis". Cool.

I wonder what the simplest program synthesis task is. ARC is pretty
simple but you can see from the top scoring results that you get a ton
of value by hardcoding in 2D-specific transforms.

I know deep learning has trouble on just basic O(n) recursive problems
like reversing a list or adding two numbers. The whole structure of
deep learning doesn't really set itself up to learn a pattern of doing
one particular thing a number of times recursively. The gradients
disappear, or by the "lottery ticket" hypothesis you just don't have
enough lottery tickets to make the whole system work in one click. You
need some way to learn substructure without having the whole problem
solved.

# ARC

Oh, maybe this paper was written slightly before the ARC dataset was
released? I guess I am thinking this whole thing through backwards. Ah
well.

So Chollet has all these priors, these assumptions that he thinks are
good ones for ARC.

* Object cohesion
* Object persistence
* Object influence via contact
* Shape upscaling or downscaling
* Drawing lines, connecting points, orthogonal projections

To me this is aethetically displeasing. Objects that influence each
other by touching each other. Okay, the visual real world works that way, but
2D arrays generally don't. But fine. It just makes me think that for
ARC you want some logical core and then you want to boost it up by
giving it some sort of hard coded 2D-grid-handling stuff.

There's some interesting reading linked on program synthesis, I'll
have to check that out.

From working on radio telescope stuff recently I am starting to
develop this theory, that GPU programming is going to overwhelm CPU
programming in every scientific or numerical field, and the whole AI /
deep learning boom is just a leading indicator of this, it's happening
there first because there's a huge industry investment into Tensorflow
and PyTorch and so on, but it'll happen in other places soon. It's way
too hard to program CUDA stuff for most academic research groups to do
it well. So maybe there's something promising here.

# More on program shortness

Chollet writes about a possible ARC approach.

*Select top candidates among these programs based on a criterion such
as program simplicity or program likelihood. Note that we do not expect
that merely selecting the simplest possible program that works on training pairs will
generalize well to test pairs.*

That's a little weird to me. Why would the shortest possible program
not be the best way to describe something?

Eh, I'm probably getting too hung up on this. There might be some sort
of "cheater programs" which are doing something like, hardcoding some
exceptions, hardcoding in part of the output, and if your training
data is really small like three examples, this cheating might end up
being shorter. So you would just have a difference between "is your
program aesthetically cheating" versus "is your program super
short". Seems like the sort of thing you can only really know in
practice.

In practice, it seems like the biggest problem by far that we can't
actually find the shortest program that maps inputs to outputs. I'm
not entirely sure about that but that's my take from reading the [top
ARC solution](https://github.com/top-quarks/ARC-solution) writeup.

# Conclusion

I'm interested to read more about program synthesis. I have a vague
feeling that you should be able to do better with clever GPU stuff,
and also by doing some simultaneous forward and backward searching
where you look for overlap. (That's how rewrite search in Lean to
simplify a given mathematical expressions into a target works, for
example. And in general automatic theorem proving often is more
successful working backwards than forwards.)

But I don't think that will quite be enough, you need some way to
learn interesting things even when in "solution space" you are nowhere
near the right answer. Hmm.

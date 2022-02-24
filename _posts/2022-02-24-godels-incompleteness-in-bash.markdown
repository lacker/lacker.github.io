---
layout: post
title: "Gödel's Incompleteness Theorem, in Bash"
date: 2022-02-24 13:00:00
categories: math
---

Gödel's first incompleteness theorem states that there are mathematical statements that
can neither be proven or disproven. His proof is fairly difficult to
understand - it involves prime numbers, factorization, all this number
theory. Gödel's proof had to be complicated because in 1931, computer
algorithms hadn't really been invented.

Turing machines would only be invented in 1936, five years later. When
Turing proved the halting problem was undecidable - that there is no
program that can decide whether another program will ever finish -
Gödel's work was an inspiration to him. Historically, Gödel clearly
came before Turing. But in the modern day, for people who already
understand the concept of a "computer program", it's a lot easier to
understand the theory the other way around. Turing first, then Gödel.

## Seeking Paradox In Bash

Many software engineers are aware that a program can run on other
programs. For example:

```
$ wc ./my_program.sh
```

This elite "metaprogramming" technique uses the program `wc` to tell you how many lines of
code there are in the `my_program.sh` script. 

You can go even deeper into this running-programs-on-programs, and run
a program on another program that's running on another program. For
example, if you want to know how long it takes to count the lines of
code in `my_program.sh`:

```
$ time wc ./my_program.sh
```

Now imagine a script called `behave_differently.sh`. When you run it on
another program, it outputs something different than that program
does. For example:

```
$ ./behave_differently.sh ./my_program.sh ./my_input.txt
```

This can output anything at all, as long as it is different from the
output of `./my_program.sh ./my_input.txt`.

If we can just write `behave_differently.sh`, then we can write the
script `paradox.sh`:

```
#!/bin/bash
./behave_differently.sh $1 $1
```

For any script, `paradox.sh my_script.sh` behaves differently than
running `my_script.sh my_script.sh`. So what happens when you run
`./paradox.sh ./paradox.sh`? It's a logical impossibility. It must be
impossible to write `behave_differently.sh`.

## Sanity Check

It doesn't really seem impossible to behave differently than another script. What goes
wrong with the naive approach?

```
#!/bin/bash
if [[ `$*` == "YES" ]]
then
  echo NO
else
  echo YES
fi
```

When you run `./paradox.sh ./paradox.sh`, the script simply goes into
an infinite loop, outputting nothing. You can check my work - the code
is [on GitHub](https://github.com/lacker/godel). The reason it is so hard to
behave differently from another script is that you can't tell, when it
goes into a long and silent loop, if that loop is really infinite or not.

## The Halting Problem

If we had a script `halts.sh` that could tell if a program would halt, we could use it to write `behaves_differently.sh`.

```
#!/bin/bash
if [[ `./halts.sh $*` == "YES" ]]
then
  while true ; do continue ; done
fi
```

So it must be impossible to write `halts.sh`. There you go - that's
the impossibility of the halting problem, which Turing proved in 1936.

## Proving an Infinite Loop

Once you see that the fundamental impossibility is writing
`behaves_differently.sh`, it starts to make sense how you can
generalize the halting problem a little bit.

Sometimes, you can prove a program goes into an infinite loop. A smart
compiler can figure out that some areas of the code are
unreachable. If all the parts of the program that exit are
unreachable, then a program must go into an infinite loop.

You don't need to understand all the details, here, you just need to
know that it's possible to build some tools around these proofs. You
can represent these proofs in a `.proof` file format, and there's a
validation script that checks the proof. So when we run:

```
$ ./validate_proof.sh ./my_program.proof ./my_program.sh
```

If it returns `YES`, that means that `./my_program.sh` goes into an
infinite loop. If the proof isn't valid, the validator returns
`NO`. The validation script never goes into an infinite loop itself.

The other tool we need is a way to generate all possible files. It
can be super slow, that's fine. So let's say that this generates a
file by converting a big integer to its binary representation:

```
$ ./generate_file.sh <number>
```

## Putting It All Together

We can try to behave differently from a target script by searching for
a proof that it goes into an infinite loop.

```
#!/bin/bash
i=0
while true; do
  ./generate_file.sh $i > ./possible.proof
  if [[ `./validate_proof.sh ./possible.proof $*` == "YES" ]]
  then
    # The target goes into an infinite loop. Let's behave differently
	exit 0
  fi
  i=$(( i + 1 ))
done
```

If there is any proof of the target script going into an infinite
loop, then this program will eventually find it, and stop. If there is
no proof, then it will loop forever searching for a proof.

If every program that infinite loops has a proof that it infinite
loops, then we have just written `behave_differently.sh`. We know
that's not possible. So, no matter what proof system we use, there
must be some program that never terminates, but there is no proof that
it never terminates. There must be true but unprovable statements,
which is what Gödel proved in 1931.

## Conclusion

Gödel's incompleteness theorem is fundamental to the philosophy
of mathematics. It demonstrates the mismatch between our ideas of
truth and our ideas of proof. It shows us that there will always be a
difference between the theoretical idea of truth and the practical set
of mathematical statements that we know are true.

I hope that this exposition was helpful to people. Personally, I think
we should set aside Gödel's original number-theory-based proof as an
artifact of history, the way we no longer use Isaac Newton's original
notation for calculus. We should accept that the concepts of
mathematical proof and computer algorithms are intertwined at their
heart, teach the halting problem first, and teach the incompleteness
of mathematical proof second.

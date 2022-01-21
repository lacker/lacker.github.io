---
layout: post
title: "Looking For Aliens"
date: 2022-01-21 09:30:00
categories: physics
---

Recently I've been helping the [Berkeley
SETI](https://twitter.com/berkeleyseti) project with their data
processing pipeline and learning a lot about SETI and radio astronomy in the
process. I thought I'd write about how it works because I think
it's really interesting. This blog post will assume you don't know
anything about astronomy so apologies if you are such a savvy
astronomer that this bores you.

## Types Of Telescope

The normal sort of telescope, the sort you might look through to see
the Moon, that is an optical telescope. Optical telescopes make it
easier to see distant light. This is an optical telescope that you can
buy for $100 at Amazon:

![normal-telescope](/assets/normal-telescope.jpg){:class="img-responsive"}

And this is an optical telescope that cost $10 billion or so:

![webb-telescope](/assets/webb-telescope.png){:class="img-responsive"}

Well, maybe it isn't precisely correct to call the James Webb Space
Telescope an optical telescope. It's like a D&D elf, it can see
regular light and also infrared. But infrared is right next to regular
light, so it's at least very close to an optical telescope. The Hubble
saw visible light but also some ultraviolet and infrared. In general
these space telescopes are doing similar things to your backyard
telescope, they are just much better at it.

There is also a totally different sort of telescope called a radio
telescope. A radio telescope is what James Bond fought on top of in
GoldenEye. This is a radio telescope:

![green-bank-telescope-small](/assets/green-bank-telescope-small.png){:class="img-responsive"}

In particular this is the Green Bank Telescope, known to its friends
as the GBT. It's in the middle of nowhere in the Allegheny mountains
in West Virginia. It doesn't sense light, it senses radio waves. In
general these radio telescopes are doing similar things to the radio
receiver in your car radio, they are just much better at it.

For physics reasons, optical telescopes get a lot of interference from
the sky and the atmosphere. So when you want an optical telescope to
analyze space really well, you get it up into space. Radio telescopes,
on the other hand, get a lot of interference from radio waves. So the
area around the Green Bank Telescope is blocked off as the [National
Radio Quiet
Zone](https://en.wikipedia.org/wiki/United_States_National_Radio_Quiet_Zone). They
restrict radio stations and they try to get people to not run microwaves
within 20 miles of the telescope.

I've mostly been dealing with data from the Green Bank Telescope, so
I'll focus on the data it provides in this post. (Green Bank is a
single dish telescope, which means it has one big dish. You can do weirder
things like beamforming with the arrays of lots of smaller dishes.)

## The Output of a Radio Telescope

You can think of a normal video feed as containing four-dimensional
data. The x dimension, the y dimension, the time dimension, and the
color dimension, and you get a "brightness" for each point defined in
those four dimensions. Most image processing you just think of the color as
one entity, and you happen to store that as an RGB triplet, but you
can also think of it as your camera just happens to only provide three
pixels of resolution in the color dimension because most human eyes
can't distinguish finer detail in that dimension anyway.

So what sort of data do you get from a radio telescope? The GBT
typically is using a "single pixel" detector. That means you don't get
an x dimension or a y dimension. It's just looking at one single spot
in the sky. But you get a ton of resolution in the time dimension and
the color dimension. When it's a radio wave, we don't call it "color",
we call it "frequency", but it's the same underlying physical
thing. So the data is two-dimensional, time and frequency.

There is a set of people based in West Virginia who operate the
telescope, and then different research groups from around the world
rent it for blocks of time. There's a relatively small datacenter
on-site and the different research groups run their own computer
systems in that datacenter. The GBT is a pretty good telescope so it
outputs a lot of data. The precise details depend on the
configuration, but the typical raw output of a day's session might be
on the order of hundreds of terabytes. So with one of the larger data
consumers like the Berkeley SETI program you have nontrivial issues
just around the amount of data you are processing.

## Doppler Drift

The fundamental idea behind this sort of SETI is, maybe aliens are
emitting radio signals, so let's look for radio signals coming from
somewhere outside our solar system.

It's harder than you might expect to tell where a radio signal is
coming from. In particular you need to distinguish a radio signal
that's coming from aliens in outer space, and a radio signal that's
coming from radio interference on Earth.

One way you can tell if a signal is coming from outer space is
to move the antenna around. Point at star A for a while, then
point at star B for a while, then point back at A for a while, et
cetera. A signal that shows up when you are pointed both at star A and
at star B is probably just interference.

Another way is to use the Doppler effect. You probably learned about
this in a physics class. The Doppler effect is when a fire truck is
driving toward you, its siren sounds different than when a fire truck
is driving away from you. The pitch of a sound is different when its
source is moving relative to you. For a radio wave, it doesn't have a
pitch, it has a frequency. The frequency of a radio wave is different
when a source is moving relative to you.

By itself, that doesn't tell us anything. If you only hear a
one-second recording of a fire truck, you can't tell whether it was
moving toward you or away from you, because you don't know what the
"natural pitch" of that fire truck is.

However, if a source is accelerating relative to you, you can detect
that without knowing the natural frequency. When a source is
accelerating, the frequency will seem to change steadily over
time. This is called "Doppler drift".

Fortunately, basically everything in outer space is accelerating
relative to you, because as the Earth rotates, you're accelerating
towards the center of the Earth. So for a source in outer space, you
should see some Doppler drift. The magnitude of the drift depends on
whether the object is just cruising along, or whether it's on the
surface of its own planet, or orbiting around something.

## Examples

To me, this makes more sense when I look at the data. Here's a
recording that shows no Doppler drift, so it's probably some sort of
terrestrial interference:

![vertical-line](/assets/vertical-line.png){:class="img-responsive"}

And here's a recording that shows Doppler drift. I don't
know what it is - probably still some sort of interference rather than
aliens - but it's coming from some source that's accelerating
relative to the receiver, which filters out the vast majority of
interference.

![diagonal-line](/assets/diagonal-line.png){:class="img-responsive"}

This data is heavily compressed from the original form that the
telescope receives. The vertical axes on these plots represent about five
minutes of recording. The horizontal axes are frequency at a very fine
resolution - each pixel represents a fractional change in the
frequency of about 3e-10. So imagine if your normal radio could pick up 10
million different radio stations between 101.1 and 101.3.

## Conclusion

So the SETI data pipeline is basically, collect lots of
data pointing at different things. Find cases where you see a diagonal
line when you point at a particular target, and no diagonal line when
you point away from that target. When you see something, notify the
humans to check it out.

I have theories about how well this stuff is working, the
parts that could be improved, why we should build a moon base, all
sorts of things. But this post is getting long so I think I'll call it
here. Let me know if you have any questions about this stuff - I think
the process of explaining it helps me understand things better myself.

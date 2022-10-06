---
layout: post
title: "Rise of the Arrays"
date: 2022-10-06 16:00:00
categories: physics
---

It's been a little while since I blogged about [analyzing radio
signals](https://lacker.io/physics/2022/03/11/lines-and-squiggles.html)
so I thought I'd write a bit more about what I've been up to.

Behold: stamps!

![squiggle-cadence](/assets/stamps-20221006.png){:class="img-responsive"}

# Stamps?

A stamp is the casual name for the input data from a radio telescope
array, with a separate reading for each antenna, in a small range of
frequencies, where a first pass on the data saw "something
interesting". This data is stored as complex voltages, because it's
basically a voltage going through a wire in a sensor, but you can
graph its magnitude as yellow = strong signal, blue = weak signal, and
that's what I'm showing here.

This data is from the [MeerKAT](https://en.wikipedia.org/wiki/MeerKAT)
telescope in South Africa. Right now, the way this system works is
roughly that every five minutes, the telescope records 60TB or so of
data. We do a pass over the data to look for interesting stuff, and
then when we find interesting stuff, we save a little neighborhood of
relevant data in the "stamp".

# What is a Radio Telescope Array?

When I say "radio telescope", think a big dish that looks like a
satellite dish but it's like 40 or 300 feet across. Not the sort of
telescope you look into with your eyes. When I say "radio telescope
array" think a whole bunch of these big dishes in a flat desert in the
middle of nowhere.

# Why Radio Telescope Arrays?

You can see that in this data, antenna 42 is showing "something", and
the other antennas are showing "nothing". Unfortunately, that means
this is not aliens. An alien signal would be coming from very far
away, so it should show up pretty similarly in all the different
antennas.

This is useful data to have, though! "Traditionally", i.e. in most
radio telescope searches for aliens in the years 1990-2020, the best
method for distinguishing alien signals from
other stuff has been to look at the shapes on these charts.

* Big blob: a wide-band radio signal, could be a pulsar, quasar,
  interference
  
* Vertical line: an artificial signal moving in unison with the
  receiver, i.e. on Earth, so it's interference not a signal
  
* Diagonal line: maybe an alien!

The biggest problem with these searches is that
diagonal line does not necessarily mean alien. It just means a radio
signal from a source that is not sitting still on the surface of the
earth. We have tried to get around this by doing a "cadence analysis",
i.e. moving the telescope to point in different directions, and seeing
if that makes the signal go away. This doesn't get rid of
everything, though, because sometimes a signal will just appear and
disappear because it's faint.

The array is cool because now we have a new, very powerful way to
analyze signals - we can compare how the different antennas recorded
the same event.

# Wow?

Back in the 70's, the [Wow
signal](https://en.wikipedia.org/wiki/Wow!_signal) got people excited
that maybe we were sensing an alien signal. That signal was about 30
times stronger than baseline noise. But, nowadays we pick up
signals that strong all the time. Just turn on your radio telescope,
wait five minutes, and you'll probably see a couple of them. The
sample signal I pasted above is about that strong.

Yeah, there's a lot more radio interference out there nowadays. Still,
it seems pretty clear to me that the Wow signal was some sort of radio
interference. We didn't have any strategies at all, back then, for
differentiating narrow band interference from real alien
signals. Academia isn't really set up to clearly communicate
information like,
"In the past fifty years, it's become slowly obvious to most
practitioners that Theory X is incorrect." If it was set up that way,
though, I think the general consensus nowadays would be that the Wow
signal was just terrestrial interference.

# Complex Numbers

Radio telescope arrays are not just redundant copies pointing at the
same thing. They also have very precise timing
measurements. It's precise enough that you can tell when a radio
signal arrives at one antenna slightly before arriving at the other
antenna. You can use this to very precisely determine of the precision
of an astronomical radio source, like a pulsar.

Not only do you have two real numbers that are supposed to be very
close to each other for a real signal, you have two *complex numbers*
that are supposed to be very close to each other for a real signal.

This lets us, in theory, differentiate between a signal that is coming
from a local source like an airplane or a satellite or a cell phone,
versus a signal that is coming from extremely far away, like an alien
planet.

# Now What?

Well, our system is operational on MeerKAT and recording stamps. We
now have far too many stamps to analyze them with our current set of
tools. So we'll need some better tools....

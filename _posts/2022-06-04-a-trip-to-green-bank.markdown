---
layout: post
title: "A Trip To Green Bank"
date: 2022-06-04 21:00:00
categories: physics
---

I took a trip out to Green Bank recently, home of the Green Bank
Telescope, to do some upgrades on the onsite computer systems that process
incoming data from the telescope, but also to take a cool tour and
learn more about the workings of radio telescopes.

It's really big! The highest point is about 480 feet off the ground,
and the dish is 300 feet across. It feels like going up the Eiffel
Tower - you're usually surrounded by metal frameworky parts as you go
up, and it's hard to take it all in. Imagine a 35 story building, but
the top half can rotate around to point at different things in the sky.

Here's what it looks like from the ground nearby.

![gbt from below](/assets/gbt_from_below.jpg){:class="img-responsive"}

This picture is from the next morning - to go up to the top, the
telescope has to be in "maintenance position", where they point it so
that the top tower part is vertical, so you can go up the elevator.

Basically, the way it works is it needs two degrees of freedom so that
it can point anywhere in the sky. The bottom is built on 16 legs that
rest on a circular train-like thing that rotates the whole thing
around. Then the "C" shape in the middle is like the edge of a big
gear that rotates the dish up and down.

When there's too much snow on the dish, they just tilt the thing
sideways to dump the snow off.

Radio waves come in from places in the universe, bounce off the big
dish, and then bounce off the little dish you can see way up at the
top, called the "subreflector". The platform right below the
subreflector has the receivers, which are the sensors that measure
incoming radio waves.

![gbt receivers](/assets/gbt_receivers.jpg){:class="img-responsive"}

The teacups are the receivers. The big circle on the floor is like
the part on a microscope that you can rotate to use different lenses -
it rotates so that you can put different receivers in the beam. Different receivers
measure different ranges of frequency of radio waves.

In the room below this, each of these circle things is connected to
basically a refrigerator. Sometimes it's a refrigerator with another
refrigerator inside it, with another refrigerator inside that. The
sensors have to be really cold because they are so sensitive, they
pick up background heat as radio noise. No pictures in that room
because of secret stuff.

![me over gbt](/assets/me_over_gbt.jpg){:class="img-responsive"}

Here's a selfie of me standing at the lower level, by the big
dish. Yeah I gotta trim my beard. You can just
walk out onto the dish. But it doesn't have a railing or anything,
occasionally a panel falls off, and it's hundreds of feet off the
ground. Usually I consider myself "not afraid of heights" but this is
the sort of trip that makes you reflect on where your limits are.

Once the receivers measure the radio signals, they output an analog
signal, it goes to a datacenter nearby, and then the things that happen
there are pretty normal things, from a software engineering point of
view. The telescope produces data at a much faster rate than there is
bandwidth out of the facility, so you have to do your heavy processing
onsite.

It was a fun trip. I really appreciated the opportunity to see the
telescope and to have a captive audience of engineers and astronomers
that I could pepper with questions.


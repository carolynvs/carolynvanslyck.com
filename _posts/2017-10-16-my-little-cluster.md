---
layout: post
title: My Little Cluster Story
description: This is the story of how I went from chipping away at archiving my movie collection one DVD at at time to running a bare-metal Kubernetes cluster capable of transcoding dozens a day.
date: 2017-10-16
comments: false
categories:
  - kubernetes
---

> If there is anything more satisfying then putting a computer to good use, it would
be doing so with a cluster of computers.

This is the story of how I went from chipping away at archiving my movie collection one DVD
at at time to running a bare-metal Kubernetes cluster capable of transcoding dozens a day.

One night a few months back, my husband decided to stream a movie on Netflix,
something that we already owned on DVD because getting off the couch to put the DVD in the player is hard.
Silly? You bet! Until I remembered that Comcast has recently imposed a 1TB monthly bandwidth cap on our account, and then it felt a whole lot more silly. 🤦‍♀️

Suddenly I was a women on a mission:
to save all my DVDs so that I could watch them without getting off the couch.
A most honorable honorable quest indeed.

<blockquote class="twitter-tweet tw-align-center" data-lang="en"><p lang="en" dir="ltr">All five nodes in my little pony k8&#39;s cluster is running full tilt transcoding videos. 🔥 (The master, Twilight Sparkle, not pictured) <a href="https://t.co/0SPOQQPQLe">pic.twitter.com/0SPOQQPQLe</a></p>&mdash; Carolyn Van Slyck (@carolynvs) <a href="https://twitter.com/carolynvs/status/899464275089117185?ref_src=twsrc%5Etfw">August 21, 2017</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

It took me quite a few weekends, but
I finally did it! ❤️ I am now the proud owner of the My Little Pony<sup>TM</sup> cluster pictured below.
It can can simultaneously transcode five HD videos in three hours. In case of a power outage,
not an uncommon occurrence around here, everything will reboot and pick up where they left off without a hiccup.
If I get a little crazy and buy a few more nodes, they can go from assembled to "work horses" in about 7 minutes.

![Five computers with My Little Ponies on top of them](/images/handbrk8s/pony-cluster.jpg)
*We're gonna need some more horsepower!*

It goes without saying that a pony-powered cluster is a gift unto itself.
But for me, getting there, _finishing a side-project_, was the best part.
I'm going to skip over my exact steps at times; this isn't a howto.
Each step in the story serves a purpose though. If I only showed you the final working setup,
you may be tricked into believing that said magical setup had sprung fully-formed
from my brainbox, and that is very much NOT the case.

![How to draw an owl: First draw two circles, then finish the damn thing](/images/handbrk8s/iterative-owl.jpg)
*I am not cool enough to do this*

I worked
on this in fits and starts, with long periods in-between where I did other things
like contribute to OSS, be with my family, binge on Netflix, and post pictures of my cats
on Instagram. If I was ever going to finish, I needed to change only one thing at a time,
ideally completing each piece by the end of the weekend. That way whenever I found more
time to work on my project, the only thing I needed to do was identify the next step.
I never wanted to be stuck figuring out a chain of "wip: still borked" commits, two stashes,
and a handful of uncommitted changes that I didn't remember making three weeks ago.

![example git log filled with inane wip commit messages](/images/handbrk8s/wip-disaster.png)
*A day in the life of Carolyn's commit history*

So here it is. The true story of how I actually finished something:

* [DIY Netflix]({{site.baseurl}}{% post_url 2017-10-17-diy-netflix %})
* [Docker or GTFO]({{site.baseurl}}{% post_url 2017-10-18-docker-or-gtfo %})
* [All the Pretty Little Ponies]({{site.baseurl}}{% post_url 2017-10-19-all-the-pretty-little-ponies %})
* [It's Go Time!]({{site.baseurl}}{% post_url 2017-10-20-its-go-time %})
* [My Overkill]({{site.baseurl}}{% post_url 2017-10-21-my-overkill %})

Next: [DIY Netflix]({{site.baseurl}}{% post_url 2017-10-17-diy-netflix %})

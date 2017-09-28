---
layout: post
title: Transcode videos with Handbrake on Kubernetes
#date: 2017-08-18
comments: false
categories:
  - kubernetes
---

> If there is anything more satisfying then putting a computer to good use, it would
be putting a cluster of computers to good use.

This is the story of how I went from chipping away at my movie collection one DVD
at at time to running a resilient cluster capable of transcoding dozens a day.

<figure style="text-align: center; float: right; margin: 5px">
  <img src="/images/handbrk8s/pony-cluster.jpg" alt="Five computers with My Little Ponies on top of them" />
  <figcaption>
    We're gonna need some more horsepower!
  </figcaption>
</figure>

A few months back I bought a few Intel NUC kits to play with and became a woman
in search of a project. I had these beefy little boxes and nothing interesting
to run on them....

Then one night, my husband decided to stream a movie on Netflix,
that we owned on DVD, because getting off the couch put the DVD in the player is hard.
Now, the other month Comcast had informed me that we were the lucky recipients
of a 1TB monthly bandwidth cap (jerks). Suddenly I was a women with a mission:
to save all my DVDs so that I could watch them without getting off the couch.

_A most honorable honorable quest indeed_

I have a bad habit of starting a side-project only to never finish it,
so I decided to do this incrementally and always keep the project in a state where
I could pick right back up where I left off. I had big dreams of being able to
buy a new node for the cluster, plug it into the network unformatted, wait 10 minutes
and have it installed, joined to the cluster and immediately running workloads.
But I knew the only way I would get there was to start with what I knew, and then
tweak just one thing at a time until I had accomplished my lofty goal.

It took a few months of random weekends but I did it! I am now the proud owner
of a my little pony cluster that simultaneously transcode five HD videos in about
three hours. It feels damn good to listen to them all hum and whirring doing my bidding.

<blockquote class="twitter-tweet tw-align-center" data-lang="en"><p lang="en" dir="ltr">All five nodes in my little pony k8&#39;s cluster is running full tilt transcoding videos. 🔥 (The master, Twilight Sparkle, not pictured) <a href="https://t.co/0SPOQQPQLe">pic.twitter.com/0SPOQQPQLe</a></p>&mdash; Carolyn Van Slyck (@carolynvs) <a href="https://twitter.com/carolynvs/status/899464275089117185?ref_src=twsrc%5Etfw">August 21, 2017</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

Obviously the end-goal was fun, but getting there, actually finishing a side-project
is almost more notable. Here is the unedited true story of how I actually finished something.

* [Challenge #1: How do the cool kids rip DVDs these days?](#challenge-1-how-do-the-cool-kids-rip-dvds-these-days)
* [Challenge #2: Automate or GTFO](#challenge-2-automate-or-gtfo)
* [Challenge #3: Wasn't this supposed to be a cluster?](#challenge-3-wasnt-this-supposed-to-be-a-cluster)
* [Challenge #4: Kubernetes is so hot right now](#challenge-4-kubernetes-is-so-hot-right-now)
* [Challenge #5: Or how I totally forget to do this incrementally](#challenge-5-or-how-i-totally-forget-to-do-this-incrementally)
* [Challenge #6: Suck it up buttercup, time to figure out volume mounts](#challenge-6-suck-it-up-buttercup-time-to-figure-out-volume-mounts)
* [Challenge #7: Admitting that my code never works right the first time](#challenge-7-admitting-that-my-code-never-works-right-the-first-time)
* [Challenge #8: How the hell did I end up with 8,000 pods?](#challenge-8-how-the-hell-did-i-end-up-with-8000-pods)
* [Challenge #9: How could I ever have doubted you, Tivo!](#challenge-9-how-could-i-ever-have-doubted-you-tivo)
* [Warm Fuzzies and Hot Cocoa](#warm-fuzzies-and-hot-cocoa)

## Challenge #1: How do the cool kids rip DVDs these days?
Actually I'm pretty sure that cool kids these days most definitely do _not_
deal with mundane objects as DVDs... 🤔 However I cannot let such concerns distract
me from my mission. Onwards towards victory and bad memes!

Having never transcoded a video before, I chose [HandBrake](https://handbrake.fr/) because the internet
seemed to agree that it was EasyMode<sup>TM</sup>. Since I was most likely going
to watch the same clip way too many times while I tweaked the settings, I selected
something that one can never get tired of watching: Twister. Choose wisely, is all I'm saying.

At first glance, the dizzying array of toggles and switches available in HandBrake
are overwhelming. So I headed straight for the presets and tried a few rips using the
"slow", "very slow" and "audiophiles couldn't tell the difference" presets. I used
to pride myself on not giving a fuck about pixels, FPS, 5.1 channel *mumble mumble*
but if I was going to go through all this trouble, I wasn't about to half-ass it.

![Ron Swanson: Never half-ass two things, whole ass one thing](/images/handbrk8s/whole-ass.jpg)

I settled on "HQ 1080p30 Surround" which means 1080p at max 30 FPS with 5.1 AAC and A3C audio tracks.
But I couldn't stop there because I love closed captions. This ... took more time
than I care to admit. Here is the magic sauce:

![Screen shot of the HandBrake GUI's subtitles tab](/images/handbrk8s/subtitle-defaults.png)

In order to not lose my tweaks each time I opened a DVD, I made a copy of my preferred
preset and then used "Configure Defaults" to setup the default subtitle behavior:

* Foreign Audio Search: ✓ Forced Only, ✓ Burned In. This means that when the movie is in English
but the subtitles are in another language, always show these subtitles. This way when Jabba the Hut
is speaking, his English subtitles always show up automagically.
* English Subtitles: Do not force, do not burn in. This saves the English subtitles
with the video, turned off by default. When you are watching the video, you can decide to
turn them on.

I left pretty much everything else alone, which [in hindsight wasn't the right thing to do](#).
But for now, the video played, I could turn on subtitles and it didn't look like a hot turd.
Huzzah!

✅ Transcode a video<br/>
✅ Support optional subtitles

Weekend accomplished!

Next Up: [Challenge #2: Automate or GTFO](#challenge-2-automate-or-gtfo)

## Challenge #2: Automate or GTFO
Single Handbrake GUI in Docker that watches a directory
* single threaded

## Challenge #3: Wasn't this supposed to be a cluster?
Multiple Handbrake GUI in bash
* multiple that claim a file in a dir
* felt like it was hard to change the code when something was working on it already

## Challenge #4: Kubernetes is so hot right now
Run it on k8s
* manually mount cifs volumes
* required manual setup of hosts
* easy to break, hard to recover

## Challenge #5: Or how I totally forget to do this incrementally
watcher + uploader + handbrake
* this was too much to take on at one time, stuff was broken for a while...
* watcher waited for a file to stop copying and creates a k8s job
* lightbulb - make it less fragile by moving the state into the cluster using jobs
* uploader plops the file on the nas
* jobchain waits for the transcode to finish
* came up with a new handbrake docker image that just did one thing

## Challenge #6: Suck it up buttercup, time to figure out volume mounts
dynamic nfs mounts
* yay no more custom host config/setup
* dang this can be hard to debug when I didn't mount stuff right. still looking for a good
way to debug when the mount is bad, or succeeds but wasn't what I intended

## Challenge #6: The part where the Kubernetes scheduler didn't read my mind
split job cfg from watcher
* realized that my transcode jobs weren't being scheduled efficiently, multiple per node
* found container resource cpu request
* got annoyed having to deploy the watcher dockerfile for just that change

## Challenge #7: Admitting that my code never works right the first time
improved uploader
* handles restarting from any point in the process
* I can fix most problems and eventually k8s will retry the job and start working again.

## Challenge #8: How the hell did I end up with 8,000 pods?
ruh roh, wtf are all these pods doing?

## Challenge #9: How could I ever have doubted you, Tivo!
tivo crashes and CFR

## Warm Fuzzies and Hot Cocoa

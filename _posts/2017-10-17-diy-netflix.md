---
layout: post
title: DIY Netflix - My Little Cluster
description: How I setup my own in-home Netflix experience for my personal videos
date: 2017-10-17
comments: false
categories:
  - kubernetes
---

> This is part of the story of how I went from chipping away at archiving my movie collection one DVD
at at time to running a bare-metal Kubernetes cluster capable of transcoding dozens a day.
>
> [Start from the beginning]({{site.baseurl}}{% post_url 2017-10-16-my-little-cluster %})


Putting together your own Netflix at home takes a bit of cobbling together. Here
are all the pieces:

### Storage Space
A compressed standard definition video takes up about 2GB of space, and a high definition video
anywhere from 5-15GB. With almost 200 videos in my collection, I was going to need over a terabyte
of disk space. My NAS, or network attached storage,
a fancy term for a computer dedicated as a file server, has a 4TB Raid 1 array which is 2 4TB hard drives where one of them is a mirror of the other.

So I already had enough space to spare, though not enough to store the originals. Uncompressed
video sizes range from 10-30GB per video, which was way more than I cared to redundantly backup
on my NAS. Drives may be relatively cheap these days, but I'm still a cheap bastard
at heart, and plan to treat the original disks as my archive or backup. Hopefully I
won't regret that down the line!

_Narrator: She did._

### Video Server
My NAS is a [QNAP TS251+](https://www.qnap.com/en-us/product/ts-251+) and one
of the built-in apps is [Plex Media Server](http://plex.tv). So it only took a minute to install and
configure it to look for videos in a directory on the NAS.

![QNAP Plex Installation Screenshot](/images/handbrk8s/qnap.png)

Side Note: The QNAP has a web UI for installing a limited set of apps, which at first
was disappointing but if you are whale-inclined (as I am), you can install
the Container Station app, otherwise known as Docker, and then you can run whatever you like.
Long term I'll probably run Plex through Docker so that I can indulge my inner control freak.

### Video Client
I have been a proud owner of a Tivo for years with _one remote to rule them all_.
So of course my heart was immediately set on watching my videos with my trusty Tivo.
Years ago I started out with a Roamio, but quickly upgraded to a Bolt for 4K support,
because I wanted all the K's. It turns out that the client drives most of
your decisions down the road, so choose wisely. Overall the biggest concerns are:

_Does it have a hard-wired ethernet connection?_

This will impact your streaming quality and overall experience.
Luckily, I just ran CAT6 throughout my house last Christmas. 🎄 Go me!

_Does it support Direct Play and Direct Stream?_

Since I am serving videos from my NAS, I didn't
want it transcoding the videos on the fly, interfering with its other responsibilities.
Direct Play/Steam mean that the video or audio track data is sent directly to the client,
without any additional transcoding to match
the capabilities of the client. Now since I have only one TV, and wasn't streaming
to something underpowered like a smartphone, I could transcode
my videos in a Tivo-friendly format up-front, and then play them directly on my Tivo.

The result is no buffering, better quality, and world peace.

### Transcoded Videos
I used [MakeMKV](http://www.makemkv.com) to save the disk to a file, and
then [HandBrake](https://handbrake.fr) to perform the transcoding.

Depending on how you go about transcoding a video, it could take anywhere from
30 minutes to 12 hours(!). It requires a lot of raw computing power,
is boring to do, requires a ton of time to redo if you mess it up, and is ripe
for parallelization. Translation: This is the perfect job for a computer,
even better a _cluster_ of computers.

### We got cows
I picked a video clip that I was okay watching repeatedly while testing...

![flying cow scene from Twister](/images/handbrk8s/twister.jpg)

I then proceeded to watch that happy little cow dance with a tornado for a few hours while
tweaking the transcoding settings until my cownado looked _just right_.

Two days tinkering yielded a very pretty, near-Netflix experience
on my TV.

![Plex Screenshot](/images/handbrk8s/plex.png)
*I have the best taste in movies*

Wow that was easy! I bet I can do the rest in just a few more weekends, right?
Erm... yeah that's not how it went. The remainder of my journey revolves around
how I got the "horse power" to tackle transcoding over 200 videos.

Next: [Docker or GTFO]({{site.baseurl}}{% post_url 2017-10-18-docker-or-gtfo %})

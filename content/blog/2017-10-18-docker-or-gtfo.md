---
categories:
- kubernetes
comments: false
date: "2017-10-18T00:00:00Z"
description: Running the HandBrake CLI in Docker
title: Docker or GTFO - My Little Cluster
slug: docker-or-gtfo
---

> This is a part of the story of how I went from chipping away at archiving my movie collection one DVD
at at time to running a bare-metal Kubernetes cluster capable of transcoding dozens a day.
>
> [Start from the beginning]({{site.baseurl}}{% post_url 2017-10-16-my-little-cluster %})

At this point, I knew what needed to happen in order to go from a physical disc to
watching the movie on Plex. However, I only knew how to do it by hand. My goal was to save the disc to a file,
have it automagically transcoded, and then uploaded to Plex without any further
intervention.

My laptop is a cesspool of random shit that I've piped into my shell (oops), a smattering of out-of-date homebrew packages, and is regularly reformatted in the hopes that I'll do better next time.
Every time I've worked on a project, inevitably I'll try to pick it up months later and realize that:
I have the wrong version of ruby installed, was relying on some rando global npm package,
and have no clue how to get it working again. This is how side-projects die.

## Time to automate!

_Hi, my name is Carolyn, and I am a Dockerholic_

I really like Docker and it's not _just_ because of the cute whales. Docker makes it easy
for me to get an app working once, put all the magic for running it into a Docker image,
and then never have to rely on my laptop being set up properly again. So my first
thought when tasked with how to automate transcoding my videos was to get it running
in Docker.

![Docker whale](/images/docker.png)
*Dammit, this whale is pretty cute*

I found this very nice Docker image, [jlesage/handbrake](https://hub.docker.com/r/jlesage/handbrake/),
capable of operating in either GUI or CLI mode. Plus it could even watch a directory
for files to transcode! This was the perfect stepping stone from running HandBrake
in a GUI to running it in Docker.

In no time, I figured out how to load my Tivo-friendly HandBrake settings into the
Docker container, and use the GUI to transcode videos manually.
Eventually, I had folders from my laptop mounted in the container, and could
drag 'n' drop my video sample into a directory, wait 30 seconds and out popped
the transcoded video in another directory.

>  Sure, it was a GUI with a bunch of stuff I didn't understand installed
into the container.
>
> Sure, it was totally hardcoded to only work on my laptop.
>
> Sure, it didn't upload the final video to Plex.
>
> Sure, it didn't run on my cluster.
>
> But it was a good start.

This was kind of neat and I did stop here for a while. I left the container
running on my laptop, transcoded a bunch of videos, and simply uploaded them to
Plex by hand.

As an aside, I'm not sure I would have stuck with this week after week if
I hadn't always been able to use the project in whatever state it was in. Every week
I did a couple more videos and got that wonderful "Hey I made something and it does stuff!"
feeling.

## Why do one thing, when you can do all the things?
One glaring problem with the current state of my project was that it was
_single threaded_, only transcoding a single video at time. While a single video
can't be split up and transcoded in pieces, I could transcode multiple
videos at the same time, which would really speed things up.

So I dug into the [wrapper script][wrapper] for the HandBrake container
and modified it so that multiple instances of the container could run at the same time,
This was both really cool and opened up a huge can of worms. On one hand, I was
transcoding videos much more quickly now that I could process more than one at a time.
On the other hand, anytime I fixed a bug I had to:

1. Stop all my containers, sometimes when they were in the middle of processing something.
1. Delete any partially transcoded files.
1. Build a new version of my container with the bug fix.
1. Start up a bunch of containers with the latest code.
1. Move any interrupted videos back into the watch directory so that they would
   be picked up again.

This wasn't just a minor annoyance, but a complete violation of the **Side-Project Manifesto**\*.
Loosely stated: "Don't do things in such a way that I have to remember how shit works 6 months from now".

The point being that while
those steps weren't particularly onerous, I wouldn't remember how to do all that
come next Christmas when I wanted to transcode my newly acquired movies. It would
end up feeling like more work than was worth it, I wouldn't bother, and all my
work so far on my glorious project would be for naught.
For the sake of my side-project, my dignity as a developer, I had to do better!

\* _Manifesto? When the hell did this turn into a manifesto?_

Next: [All the Pretty Little Ponies]({{site.baseurl}}{% post_url 2017-10-19-all-the-pretty-little-ponies %})

[wrapper]: https://github.com/jlesage/docker-handbrake/blob/master/rootfs/etc/services.d/autovideoconverter/run

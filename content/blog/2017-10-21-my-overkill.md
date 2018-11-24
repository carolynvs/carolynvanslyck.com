---
categories:
- kubernetes
comments: false
date: "2017-10-21T00:00:00Z"
description: When half-assing it just isn't enough
title: My Overkill - My Little Cluster
slug: my-overkill
---

> This is a part of the story of how I went from chipping away at archiving my movie collection one DVD
at at time to running a bare-metal Kubernetes cluster capable of transcoding dozens a day.
>
> [Start from the beginning]({{< ref "2017-10-16-my-little-cluster.md" >}})

Now to some of you, this all may seem like overkill but believe me, it wasn't.
If I had stopped sooner, half-assing it until things mostly worked, what happened
next would have been a disaster.

![Ron Swanson: Never half-ass two things, whole ass one thing](/images/handbrk8s/whole-ass.jpg)

Remember my [rigorous cownado testing]({{< ref "2017-10-17-diy-netflix.md" >}}/#we-got-cows)?
Well... I got it wrong. Really wrong. **Getting up off the couch wrong**.

Everything was working great at first. My little pony cluster had made short work of about 100 videos,
and my Saturday mornings were filled with some really good movies, perfect for ignoring while reading the internet. Unfortunately sometimes the movie would stutter,
the screen would flicker, and then the HDMI signal would cut out. No amount of button
mashing would get it working again. The only fix was to get off the couch, unplug the
HDMI cable from the Tivo and reseat it. Since my entire endeavor was motivated specifically
by _not having to get off the couch_, this threatened to ruin everything.

After quite a bit of troubleshooting I discovered that the problem was my transcoding settings.
I was using a variable frame rate, a ticking time-bomb. Most videos stick to the same frame rate,
but sometimes, like during scene transitions on older movies, the frame rate changes.
This caused the Plex client to crash, and Tivo along with it. The fix was to force
a constant frame rate.

So I had to re-transcode all the videos that I had already done so far. I had to start over.
While that should have royally sucked, instead of being demoralized, I was excited.
_Let's throw 100 videos at my cluster all at once and see what happens!_ 🔥

You know how much work it was to redo those 100 videos?

1. Drag 'n' drop the originals into the watch directory.
1. There is no step 2.

![Gopher droppin' the mic](/images/handbrk8s/gopher-mic-drop.png)

Next: [I Did a Thing]({{< ref "2017-10-22-i-did-a-thing.md" >}})

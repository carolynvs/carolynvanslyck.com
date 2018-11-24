---
categories:
- kubernetes
comments: false
date: "2017-10-19T00:00:00Z"
description: What if my Kubernetes cluster had nodes named after My Little Ponies?
title: All the Pretty Little Ponies - My Little Cluster
slug: all-the-pretty-little-ponies
---

> This is a part of the story of how I went from chipping away at archiving my movie collection one DVD
at at time to running a bare-metal Kubernetes cluster capable of transcoding dozens a day.
>
> [Start from the beginning]({{< ref "2017-10-16-my-little-cluster.md" >}})

Now that I had a working HandBrake container capable of running in parallel,
obviously the next step was to buy a proper cluster of computers, right? 😇
After much researching, I settled on a configuration and bought five beefy computers in a mini-computer form factor.
Video transcoding will use as much computer power you'll give it, and I have future plans
of using this cluster to offload compiling programs, so I erred on the side of awesome.

* Three [Intel NUC i5 "shorties"][shorty] with 32GB RAM and 256GB NVMe drive for the worker nodes.
* Two [Intel NUC i5 "tallboys"][tallboy] with 16GB RAM and 256GB NVMe drive with an additional 512 GB SSD for the masters.

![Comparison of a short BNK vs. a tall BNH](/images/handbrk8s/nucs.png)
*The taller model has space for a second 2.5" drive*

In the beginning I had trouble telling the nodes
apart because they all looked the same. _Did I set up the third one from the left already?_ 🤔
So I named each node after a My Little Pony character and put the corresponding pony
atop for shits and giggles:
Rainbow Dash, Pinkie Pie, Twilight Sparkle, Fluttery Shy, and Apple Jack.

I started by booting each node from a Ubuntu USB stick, and using
kubeadm to set up an artisanal cluster: hand-crafted and lovingly configured.
That helped me prove out how to setup a cluster. Next step was to automate the cluster setup!

I knew PXE booting was a thing, and while I'm all about the
DevOps, most days I'm a bit more _dev_ than _ops_. When my friend Ryan hit me up,
asking to sleep on my couch while he attended the
local legacy computing conference that was being hosted in the Chicago burbs, I instantly
agreed and warned him that in return he would have to help me figure out this whole
PXE boot stuff.

![Friendship is Magic](/images/handbrk8s/friendship-is-magic.jpg)
*Ryan is the one on the right*

That week was filled with said legacy compute conference, DevOps Days Chicago,
a butt-numbing amount of video games, and an epic day of pairing with Ryan
learning the ins and outs of syslinux. Ryan knows his shit, and by the time he was back at
[LazerCo](https://www.ligo.caltech.edu/) my cluster setup was fully automated.
The result is a Raspberry Pi running dnsmasq, which takes care of DHCP, DNS and PXE booting.

![Blurry photo of my PXE boot screen](/images/handbrk8s/ponyboot.jpg)
*This could really use some ascii art*

After booting a node from the LAN, I can either set it up
as the master of a new cluster, or join to an existing cluster. The entire
Debian installation and kubeadm setup is fully automated; all I need to do is wait for it
to complete, and then run a single command to finalize the node. It takes about seven minutes
to go from a newly assembled computer to fully joined and running workloads.

![Five computers with My Little Ponies on top of them](/images/handbrk8s/pony-cluster.jpg)
*Say hello to my little (pony) cluster*

## I am my own personal chaos monkey
Honestly, I didn't expect the PXE boot setup to be all that useful. I would run it once, and then
it would only come in handy for hypothetical new nodes. In fact I've used it a number
of times as I've tweaked my cluster setup, accidentally dorked-up a node while trying out
various cluster storage options, and when upgrading the cluster to the latest
version of Kubernetes.

For those keeping score at home, I had:

✅ Figured out how to transcode videos<br/>
✅ Automated it in a Docker container<br/>
✅ Moved the party into Kubernetes<br/>
🔥 Ruined a video when I unplugged a node while vacuuming

Next: [It's Go Time!]({{< ref "2017-10-20-its-go-time.md" >}})

[shorty]: https://www.intel.com/content/www/us/en/products/boards-kits/nuc/kits/nuc7i5bnk.html
[tallboy]: https://www.intel.com/content/www/us/en/products/boards-kits/nuc/kits/nuc7i5bnh.html

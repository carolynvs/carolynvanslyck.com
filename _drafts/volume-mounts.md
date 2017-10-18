---
layout: post
title: My Kingdom for Cloud - My Little Cluster Story
description: "Kubernetes (Volume Mounts): The Hard Way"
#date: 2017-08-18
comments: false
categories:
  - kubernetes
---

## Challenge #6: Suck it up buttercup, time to figure out volume mounts
dynamic nfs mounts
* yay no more custom host config/setup
* dang this can be hard to debug when I didn't mount stuff right. still looking for a good
way to debug when the mount is bad, or succeeds but wasn't what I intended

---
layout: post
title: "The Ninety-Ninety Rule - My Little Cluster Story"
description: How I learned to stop worrying and admit that my code never works the first time
#date: 2017-08-18
comments: false
categories:
  - kubernetes
---

For those not familiar, the Ninety-Ninety Rule states that:

> The first 90 percent of the code accounts for the first 90 percent of the development time.
> The remaining 10 percent of the code accounts for the other 90 percent of the development time.
> — Tom Cargill, Bell Labs

## Challenge #6: The part where the Kubernetes scheduler didn't read my mind
split job cfg from watcher
* realized that my transcode jobs weren't being scheduled efficiently, multiple per node
* found container resource cpu request
* got annoyed having to deploy the watcher dockerfile for just that change

## Challenge #7: Admitting that my code never works right the first time
improved uploader
* handles restarting from any point in the process
* I can fix most problems and eventually k8s will retry the job and start working again.

* had a bug in the jobchain (my init container for uploading)
* I fixed jobchain and pushed a new docker image
* I deleted the uploader job pod, only, leaving the job
* The job then started a new pod, which picked up the latest jobchain image
* bug is fixed, and the job continues without having to start over!

The uploader is idempotent, meaning that every time it starts up it figures out how
far it made it last time, and picks up where it left off. It can also figure out
if I have already transcoded a video previously with different settings (resulting in a different file size),
and will nuke the old video and re-upload it.

---
layout: post
title: How to get going with Go
date: 2017-08-18
comments: true
categories:
  - golang
---

<figure style="text-align: center; float: right; margin: 5px">
  <img src="/images/go-learn.png" />
  <figcaption>
    <a href="https://github.com/ashleymcnamara/gophers/">Gophers by Ashley McNamara</a>
  </figcaption>
</figure>

Yesterday I had a great time chatting with [GoTimeFM](https://changelog.com/gotime)
about how to land a job in Go. Often the question of how to get a job in Go boils down to:

> I'm not paid to write Go and am struggling to build up relevant experience

I've found that anytime you want to learn something on-the-job the safest path is
to find areas that aren't directly related to the business and apply it there.
Ask for forgiveness, not permission. Then start incorporating Go (or whatever you are trying to learn)
into all the little automation tasks that make up your day. You don't have to come
up with some great idea or project, just find existing code.

This is how I learned Go! I tried to use the Docker Version Manager on my Windows
machine and was saddened to discover that it was written in Bash. Over the weekend,
I rewrote it in Go and that started me on the path to discovering my inner gopher.

* **Dev Scripts** - What repo doesn't have a scripts or hacks directory filled
with bash scripts?
* **Dev Tools** - Perhaps you have a tool that everyone uses to grab a sanitized copy
of your production database?
* **Commit Hooks** - Got a script that is executed before you commit, like running a linter?
* **CI Scripts** - Take a peek into your CI's build scripts and you'll usually find
a hodepodge of scripts ripe for the porting!
* **Chat Bots** - You know that inane chat bot that spams everyone with pictures of pugs?

Pick something and port like the wind! Then at your next team brownbag, walk through
how that went. Build up enthusiasm on your team and more people may decide
to learn along with you.

---
comments: false
date: "2019-04-27"
title: "Nerd Sniped: What I'm working on now"
slug: nerd-snipe
description: 
image: images/swiper.jpg
---

<figure style="text-align: center; float: right; margin: 5px">
  <a href="https://xkcd.com/356/">
    <img src="/images/swiper.jpg" width="250" alt="Swiper, No Swiping" />
    <figcaption>xkcd.com/356</figcaption>
  </a>
</figure>

I just finished the release notes for [Porter v0.5][release] and holy smokes,
this is a MEGA RELEASE `O DOOM! 💥

Err... let me back up a bit.

Most of you have no idea what Porter is and are wondering "_I thought Carolyn
worked on Go stuff, dep? Maybe Kubernetes?_" You would have been right, until this fall
when I got [nerd sniped][snipe] _hard_.

I was minding my own business, wait, scratch that, y'all know that isn't true.
There I was, snarking it up on Slack and looking for drama, when the [DeisLabs][deislabs]
team asked me to lend some engineering muscle on a new
proof of concept they were working on. It had the silliest name: [CNAB][cnab]

**Cloud Native** _obligatory cloud native prefix_ 

**Application** _because we need some vowels up in here_ 

**Bundles** _finally, a noun!_

Ok, so I guess I was going to do something with bundles, maybe packaging? ADVENTURE! 🤓

---

I was asked to review the specification, provide feedback and try out the CLI that they were
making to prove out the spec.

Folks, I spent the next three weeks feeling like a dumbass. I read that spec, 
made a bundle, used the tool to install the bundle, and was like 
_"I must be missing something here"_. 😅 

Everyone seemed really into it though! They all said that this was going to solve 
big problems but I couldn't get over that I had to write artisanal Dockerfile and 
Bash scripts, it didn't have dependency management (I know right?!) and the bundles 
weren't reusable. I wasn't feeling super Cloud Native. Was this a long con? 👀

That October I flew out to San Fransisco for an offsite (on-site?) with my buddy 
[@jerrycar][jerrycar] to meet with the 
team and the feeling like everyone understood it but us continued. At the end of the
second day we asked a bunch of questions, didn't really get the answers and decided to
have our own off-site/on-site/Doritos-powered meeting. 

Fueled by jet lag, the Microsoft snack bar and a heavy dose of imposter syndrome, we came
up with a new tool, [Porter][porter] 👩🏽‍✈️. Named after the friendly person who carries
your bags 🛍, it would implement this CNAB spec but it would also answer all those
awkward questions we had about CNAB.

---

I never want anyone to feel like they are missing the joke or need to be an expert 
in some spec just to use a tool. I took everything that made me feel like I didn't get it 
and wasn't qualified over that past month, and then baked solutions for those problems into
this new tool, into Porter. So that the next person would feel like they belonged
and could spent their time Getting Shit Done<sup>TM</sup>, instead of figuring
out this CNAB stuff.

Phew! I've been working on this for a few months now. I really should 
have blogged about it, and explained what Porter is and how it's pretty neat. 
Can I leave you an IOU one blog post that explains everything? What I really wanted 
to talk about is this epic release notes that I just wrote up for the latest release!

No? You demand that I bring y'all along for the ride so that you aren't left
feeling confused and like you don't belong? 

OK, I get you. I'm on it. 💖

[release]: https://github.com/deislabs/porter/releases/tag/v0.5.0-ralpha.1%2Belderflowerspritz
[porter]: https://porter.sh/
[jerrycar]: https://twitter.com/jrrickard
[deislabs]: https://deislabs.io
[cnab]: https://cnab.io
[snipe]: https://xkcd.com/356/
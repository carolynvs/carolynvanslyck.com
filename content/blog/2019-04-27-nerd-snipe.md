---
comments: false
date: "2019-04-27"
title: "Nerd Sniped: Porter"
slug: nerd-snipe
description: "How I was nerd sniped into starting a new project: Porter"
image: images/swiper.jpg
---

<figure style="text-align: center; float: right; margin: 5px">
  <a href="https://xkcd.com/356/">
    <img src="/images/swiper.jpg" width="250" alt="Swiper, No Swiping" />
    <figcaption>xkcd.com/356</figcaption>
  </a>
</figure>

I just finished the release notes for [Porter v0.5][release] and holy smokes,
this is a MEGA RELEASE OF DOOM! 💥

Err... let me back up a bit. Most of you have no idea what Porter is and are
wondering "_I thought Carolyn worked on Go stuff, dep? Maybe Kubernetes?_" Not
so much lately. You see I got [nerd sniped][snipe] _hard_ this fall.

I was minding my own business, wait scratch that, y'all know that isn't true.
There I was, snarking it up on Slack and looking for drama, when the
[DeisLabs][deislabs] team asked me to lend some engineering muscle on a proof of
concept they were working on with the silliest name: [CNAB][cnab] which stands
for ...

**Cloud Native** _obligatory cloud native prefix_

**Application** _because we need some vowels up in here_

**Bundles** _finally, a word that tells me what this is!_

Ok, so I guess I was going to do something with bundles, maybe packaging?
ADVENTURE! 🤓

I was asked to review this CNAB specification, provide feedback and try out the
CLI that they were using to prove out the spec.

Folks, I spent the next three weeks feeling like a dumbass. I read that spec,
made a bundle, used the tool to install the bundle, and was like _"I must be
missing something here"_. 😅 Everyone else agreed that CNAB was a great solution
but I kept thinking "_I wouldn't use this_".

I could see what it was trying to do, but it simply fell short of being useful
for me. Sure, I had bundled up stuff and things, but here I was still
hand-crafting artisanal Dockerfiles and Bash scripts just like I was before
CNAB. I had to know the spec inside and out to write those scripts properly. It
didn't have dependency management (I know right?!) and the bundles weren't
reusable.

That October I flew out to San Francisco for an off-site (on-site?) with my
buddy [Jeremy][jerrycar] to meet with the team and that feeling of "everyone
gets this but us" didn't go away. At the end of the second day we asked a bunch
of questions, still didn't really like the answers and decided to have our own
off-site/on-site/Doritos-powered meeting.

Fueled by jet lag, the Microsoft snack bar and a heavy dose of imposter
syndrome, we had an idea, [Porter][porter] 👩🏽‍✈️. Named after the friendly
person who carries your bags 🛍, it would implement this spec but it would also
answer all those awkward questions and fill in the gaps we saw in CNAB. Most
importantly we thought that if we could pull it off, Porter would be something
that we would actually use ourselves. Ok, now that's something worth working on.

<h4 align="center">Nerd Snipe Accomplished</h4>

At this point you may be grumbling to yourself "_Carolyn if you refer to this
CNAB or Porter shit one more time without explaining what the hell it is, I'm
out_". Sorry, I wanted to trick you into listening to Porter's origin story
before I dove into the details of [what is CNAB and Porter]({{< ref
"2019-04-28-porter.md" >}}).



[release]: https://github.com/deislabs/porter/releases/tag/v0.5.0-ralpha.1%2Belderflowerspritz
[porter]: https://porter.sh/
[jerrycar]: https://twitter.com/jrrickard
[deislabs]: https://deislabs.io
[cnab]: https://cnab.io
[snipe]: https://xkcd.com/356/

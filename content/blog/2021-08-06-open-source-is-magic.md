---
comments: false
date: "2021-08-06"
title: "Open Source is Magic"
slug: open-source-is-magic
description: >
  First post in a series on my own personal experience working with open source software (OSS) and what it is like to work in open source
image: images/open-source-is-magic.png
---

<figure style="text-align: center; float: right; margin: 5px">
  <img src="/images/open-source-is-magic.png" width="300px" alt="All the characters from My Little Ponies standing together, captioned Our Little Project: Open Source is Magic" />
</figure>

Hi, my name is Carolyn Van Slyck and Microsoft pays me to write open source software. 👋 This _sounds_ super cool and maybe you are wondering how you too can trick a multi-national corporation into paying you to do this too.

From the outside you don't often get a clear view of what it is really like to actually do open source. You see people tweeting memes about geese and KEPs, seemingly having fun and somehow software is getting shipped. Let's get a glimpse into the life of open source, the exciting public parts and the other parts we don't often advertise.

As with any good story, it begins by talking about yourself. Why listen to Carolyn's Very Proper and Goode Advice on Open Source? Because what follows is based on my own 20+ years of experience participating in open source. If you think my oss chops are lacking, then no need to read the rest! Think of the time saved!

One thing that I hope my journey through open source shows is that there is  no one right way to "do open source". On a shallow level, open source is talking about putting code out there with an open-source license, allowing people to not only read the source code, but modify it to suit their own purposes too. There are a lot of different ways to build on top of that.

My first accidental open source contribution was back in the day before WordPress existed. We hadn't yet settled on the one true cms and so I was using something called Geekblog. I had created my own theme for my website, very purple, bubbly and with sparkles and saw other people sharing their themes and figured maybe someone else would like mine too. So I copied what everyone else did, mic dropped it into the Geekblog forum and 💥! I was an open-source contributor. Surprisingly people actually _used_ the theme, and I was quickly introduced to the joys of people assuming that I was going to maintain the random code I had gifted to the internet for them.

In college, I started using Subversion (svn) and really wanted to run my own svn server and host my source code myself. Back in my day we didn't have virtual machines, we had Virtual Private Servers and they were oddly slapped together collection of control panels, weird kernel configuration, chroot jails, and overlay filesystems. Installing software on them often required resorting to compiling packages from source because the ones shipped with other package managers just didn't work. For a few years I compiled my own berkley db and svn packages and distributed them to other confused would-be sysadmins who also wanted the latest in source control technology. I wasn't writing open source software, but I was repacking and distributing it because the license allowed me to do so.

In one of my first programming jobs, we occasionally were allowed to use open source software (this used to be a bit more controversial) and I was thrilled to learn that I could fix problems in _other people's software_. This is when I caught the bug. Literally. I'd find bugs and for once I could fix them myself instead of waiting for a support ticket to prompt a vendor to fix their code. At the time it was a novel concept, and I distinctly remember feeling empowered. It was also the first time I actually thought about a license at all, was aware of the term "open source", and what it entailed.

At work we used Atlassian software for everything, and once again I was delighted by the concept of open source software. Atlassian actually let me _see their source code_ and get a real understanding of how it all worked. I spent years reading their entire code base for Bamboo and Stash among other things, writing plugins to fit these tools better into the workflows and developer experience that I envisioned for my team. I distributed many of those plugins with an open-source license and for a while was the lucky recipient of frantic emails from real companies demanding that I immediately update a plugin to be compatible with a new version of some Atlassian product. I never understood _why_ they felt that they had any right to contact a stranger out of the blue and demand free work. But ooh boy did I learn quickly that everyone felt that they were owed my nights and weekends.

This was also my first taste of working with another type of open source, that I like to call "Source Code Available". The upstream projects that we were all integrating with as plugin authors was 100% controlled by Atlassian. There wasn't a way for us to submit patches, suggestions, fight for them to please stop breaking their interfaces, etc. We could read the code, but not modify it. Ultimately we were all building on to of a "community" that we really had no say in. At the time I didn't have the experience to really frame why I felt like my hands were tied because I still hadn't seen what a real open source community could be like. In hindsight, I would never spend my time contributing into an environment like that again. It was too easy to have all of your hard work made irrelevant or usually irrevocablly incompatible in a single release and there was nothing you could do about it.

I was working as a closed-source .NET developer when I started getting these _feelings_ about open source. Namely that I wanted my dependencies and tech stack to be open source, and I wanted much more control and input into the decisions made in that ecosystem. I had had a taste of being able to submit a patch and get it merged! Or comment on an issue and actually have the maintainer take my feedback into account. I was starting to realize that I didn't have to put up with closed-source software vendors ignoring me, and expecting me to just continue accommodating their plans. For a brief while, I tried to engage with the .NET community on... you guessed it package management because I must have a martyr complex, and attempted to influence NuGet (before it was open source) and when that wasn't successful threw my weight and heart behind Paket. It was an open-source alternative to NuGet that was much more open to supporting what the community needed, instead of what Microsoft thought was best for everyone. (Sorry Microsoft, you were a bit of a jerk back then!) I quickly had that lesson reinforced that you should not build upon vendor-owned ecosystems and "communities" where ultimately the vendor can unilaterally take things in different direction that the community wants, undercutting potentially years of investment.

A wiser women, I finally could articulate what I had wanted since my very first computer science class where I naively asked _Why we were guessing about how Windows implemented something, couldn't we just read the source code?_ I still recall my instructor's sad laughter to this day. If I was going to build a product depending on a tech stack, an ecosystem of tools and libraries, I needed some level of influence and control over it. Either through direct feedback, submitting patches or forking if need be. I wanted options, dammit. 💪

When I searched for my next job, it wasn't just for any job that fit my skills. I wanted it to be **open source**. 🌈 I jumped over to Rackspace, in the heady days before they were bought by that stinky private equity firm, and became the maintainer for OpenStack.NET an open-source .NET SDK for working with OpenStack clouds. Because Rackspace controlled the projects, as a relative newbie I was able to immediately become a maintainer on the project, set direction, and commit code. I didn't realize it at the time, but I had stumbled my way into another type of open source: Vendor-Controlled Open Source. The vendor (Rackspace) had an open source licence, it even allowed other people to modify it, and we even accepted patches. But the project was wholly governed by Rackspace, and decisions were made by Rackspace employees, not the community.

With a taste of the heady highs of being paid to work on open source software, I decided to jump off the .NET ship and move into containers, kubernetes and something called cloud native. In March 2017 I was presented with a unique opportunity, a dependency manager for Go called dep. The project was young, popular, overwhelmed and needed contributors. I figured that working on a popular open source project would help build my credentials and be the foot in the door to the type of jobs I was looking for. So I quit my job (thank you, Fuck It Fund) and contributed to dep full time, eventually becoming a maintainer.

* my open source journey
    * what I have done. these are all based on my 20+ years of experience in open source. it's changed over time
        * geekblog theme
        * custom packages to run svn that worked with the vps software
        * contributing for work projects that we used but wasn't really paid to do
        * atlassian plugins (another vendor's ecosystem sucks)
        * tried to get into .net open source before microsoft became more oss friendly (nuget alternative, .net core early days) this wasn't a good place to be (same as atlassian plugins)
        * contributing to openstack docs
        * always fixing random bugs or adding features in dependencies
        * open source corporate software (carina, rackspace.net)
        * ground floor of dep as a volunteer
        * kubernetes service catalog (worked up to chair then stepped down)
        * porter -> cncf -> maybe it's going to work out?
        * TAG contributor strategy. contributor -> wg lead -> tech lead
        * my own random libraries
    * Why did I decide to do open source as a job?
        * I really like the mix of activities
        * I meet great people and can keep working with them when I change jobs
        * I've always enjoyed it
        * I like contributing to something used by lots of people.
        * lots of opportunities to help other people: mentoring, giving them experience and a space to learn.
    * people ask me for advice and I am constantly having interactions with people that reinforce that most people don't know what to expect out of oss or how to navigate it. (explain the series)
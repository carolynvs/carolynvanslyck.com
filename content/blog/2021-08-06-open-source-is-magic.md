---
comments: false
date: "2021-08-06"
title: "Open Source is Magic"
slug: open-source-is-magic
description: >
  First post in a series on my own personal experience working with open-source software (OSS) and what it is like to work in open source
image: images/open-source-is-magic.png
---

<figure style="text-align: center; float: right; margin: 5px">
  <img src="/images/open-source-is-magic.png" width="300px" alt="All the characters from My Little Ponies standing together, captioned Our Little Project: Open Source is Magic" />
</figure>

Hi, my name is Carolyn Van Slyck and Microsoft pays me to write open-source software. 👋 This _sounds_ super cool and maybe you are wondering how you too can trick a multi-national corporation into paying you to work in open source.

From the outside you don't often get a clear view of what it is really like to actually do open source. You see people tweeting memes about geese and KEPs, having fun and somehow software gets shipped. In this blog series, I want to give people a glimpse into what it's like to be in open source, both the exciting parts and the other stuff that we don't often advertise.

As with any good story, it begins by talking about yourself. Why listen to Carolyn's Very Proper and Goode Advice on Open Source? Because what follows is based on my own 20+ years of experience participating in open source. If you think my OSS chops are lacking, then no need to read the rest. Just think of the time saved!

One thing that I hope my journey through open source shows is that there is no one right way to "do open source". On a shallow level, open source is about putting code out there with an open-source license, allowing people to not only read the source code, but modify it to suit their own purposes too. There are a lot of different ways to build on top of that.

## Accidental Contributor

My first accidental open-source contribution was back in the early 2000's before WordPress existed. We hadn't yet settled on the one true CMS and I was using something called Geekblog. I had created my own theme for my website, very purple, bubbly and with sparkles. When I saw other people sharing their themes, I figured maybe someone else would like mine too.

I copied what everyone else did, mic dropped it into the Geekblog forum and 💥. I was an open-source contributor. Surprisingly people _actually used_ the theme, and I was quickly introduced to the joys of people assuming that I was going to maintain the random code I had gifted to the internet. Oops. 🤦‍♀️

## Open Source Distributor

In college, I started using Subversion, which is another source control tool like git. For unknown reasons, I really wanted to run my own svn server and host my source code myself. Back in the day if you wanted root on your slice of a shared webserver, you would use Virtual Private Servers. They were an oddly slapped together collection of control panels, weird kernel configuration, chroot jails, and overlay file systems. Installing software on them often required resorting to compiling packages from source because the ones shipped with your distribution's package manager just didn't work.

For a couple years I compiled my own BerkleyDB and Subversion packages, distributing them to other confused would-be sysadmins who also wanted the latest in source control technology. I wasn't writing open-source software, but I was repackaging and distributing it because the license allowed me to do so.

## Source Code Available

In one of my first programming jobs, we occasionally were allowed to use open-source software (this used to be a bit more controversial) and I was thrilled to learn that I could fix problems in _other people's software_. This is when I caught the OSS bug. Literally. I'd find bugs and for once I could fix them myself instead of waiting for a support ticket to prompt a vendor to fix their code. At the time it was a novel concept, and I distinctly remember feeling empowered. It was also the first time I actually thought about a license at all, was aware of the term "open source", and what it entailed.

At work we used Atlassian software for everything, and once again I was intrigued by the concept of open-source software. Atlassian actually let me _see their source code_ and learn for myself how it all really worked. I read the entire code base for Bamboo and Stash, writing plugins to fit these tools better into the workflows and developer experience that I envisioned for my team. I distributed these plugins with an open-source license so that someone else on the internet could tinker with what I had made.

<p align=center><strong>Everyone felt that they were owed my nights and weekends</strong></p>

For a while, I was the lucky recipient of frantic emails from real companies demanding that I immediately update a plugin to be compatible with a new version of some Atlassian product. I never understood why they felt that they had any right to contact a stranger out of the blue and demand free work. But ooh boy did I learn quickly that everyone felt that they were owed my nights and weekends.

This was also my first taste of working with another type of open source: **Source Code Available**. The Atlassian projects with which plugin authors were integrating were 100% controlled by Atlassian. There wasn't a way for us to submit patches, suggestions, beg for them to please stop breaking the plugin interfaces, etc. We could read the code, but not modify it.

Ultimately we were all building on to of a "community" that we had no say in. At the time I didn't have the experience to adequately frame why I felt like my hands were tied because I still hadn't seen what a proper open-source community could be like. In hindsight, I would never again spend my time contributing into an environment like that. It is too easy to have all of my hard work made irrelevant or usually irrevocably incompatible in a single release with no recourse.

## Vendor-Controlled Tech Stacks

I was working as a closed-source .NET developer when I started getting these _feelings_ about open source. Namely that I wanted my dependencies and tech stack to be open source, and I wanted more control or influence over the decisions made within that ecosystem. I had had a taste of being able to submit a patch and get it merged! Or comment on an issue and actually have the maintainer take my feedback into account. I was starting to realize that I didn't have to put up with closed-source software vendors ignoring me, and expecting me to simply continue accommodating their plans.

For a brief while, I tried to engage with the .NET community on package management and attempted to influence Microsoft's NuGet. When that wasn't successful, I threw my weight and heart behind Paket. It was community alternative to NuGet that was open to supporting what the community needed, instead of what Microsoft thought was best for everyone. Sorry Microsoft, you were a bit of a jerk back then! 😘 I once again learned the lesson that you should not build upon vendor-controlled tech stack and or invest in their communities. Ultimately the vendor can unilaterally take things in different direction than the community wants, locking you out and undercutting potentially years of investment. If you know the history of Go's dep, then you know that it took me a couple tries to learn this lesson. 😭

## Vendor-Controlled Open Source

A wiser woman, I finally could articulate what I had wanted since my very first computer science class where I naively asked _Why we were guessing about how Windows implemented something, can't we just read the source code_? I still recall my instructor's sad laughter to this day. If I was going to build a product depending on a tech stack, an ecosystem of tools and libraries, I needed some level of influence and control over it. Either through direct feedback, submitting patches or even forking if need be. I wanted options, dammit. 💪

<p align=center><strong>I wanted it to be open source</strong></p>

When I searched for my next job, it wasn't just for any job that fit my skills. I wanted it to be **open source**. 🌈 I jumped over to Rackspace, in the heady days before they were bought by that stinky private equity firm, and became the maintainer for OpenStack.NET, an open-source .NET SDK for working with OpenStack clouds. Because Rackspace controlled the project, as a relative newbie I was able to immediately become a maintainer on the project, set direction, and commit code. I didn't realize it at the time, but I had stumbled my way into another type of open source: **Vendor-Controlled Open Source**. The software had an open-source licence, people could modify the code, and we even accepted patches. But the project was governed by Rackspace, and decisions were made by Rackspace employees, not the community. It's not necessarily bad per-se but it's not what I'm interested in.

## Vendor Controlled Tech Stacks: Part Deux 

With a taste of the heady highs of being paid to work on open-source software, I decided to jump off the .NET ship and move into containers, Kubernetes and something called Cloud Native. In March 2017 I was presented with a unique opportunity, a dependency manager for Go called dep. The project was young, getting popular, but also overwhelmed and in need of contributors. I figured that working on a popular open-source project would help build my credentials and be the foot in the door to the type of jobs I was looking for.

<p align=center><strong>Pay Attention. Learn. Be Helpful.</strong></p>

I quit my job and contributed to dep full time, eventually becoming a maintainer. My contributions were not ground breaking advances in solving hard graph problems (I left that to Sam Boyer). Rather I followed the maintainers around on GitHub and Slack, and when they answered a question, I paid attention. When someone asked that question again, I answered it. Eventually I collected the common questions and [turned it into a FAQ](https://github.com/golang/dep/pull/401). I also spent a lot of time reading the source code, walking through it in the debugger to understand how it worked, trying out pulling dependencies for people when they ran into problems, and figured out if there was a workaround to be had or a bug/gap in dep. I did everything I could to build up enough domain knowledge so that I could eventually submit pull requests that weren't just copy/pasted answers from someone else, but new features, complex bug fixes. Somehow I went from a newbie to someone whose contributions were a net help to the project. Or at least I sincerely hope I did.

<div align=center>
<blockquote>
Fool me once, shame on you.<br>
Fool me twice, shame on me.<br>
Fool me thrice and hey cut that out, Google!<br>
</blockquote>
</div>

Sadly poor little dep didn't reach its goals. The Go team at Google decided to create a dependency management solution built-in to Go that didn't allow for community alternatives. RIP dep, it was fun while it lasted. 💔

## Open Source with a sidecar of Open Governance

After months of interviewing and [chasing my cloud native dream][dream], I accepted a position at Microsoft surprisingly enough. I know that I ragged on them a bit earlier, but now they were offering to pay me to work on upstream Kubernetes. It's enough to give a girl whiplash.

Because Kubernetes is owned by an open-source foundation, the CNCF, I was working on yet another type of open-source project: **Open-governance Open Source**. Ooh, now this I like. This time when I started on a new project, Kubernetes Service Catalog, I wasn't immediately crowned a maintainer and let loose. Project leaders are nominated and voted on. Maintainers are made by building trust, being useful, and making a commitment.

Over the next couple months I found a gap in the project (a CLI of course) and not only did I contribute code, but I watched project leaders like Paul Morie, Aaron Schelsinger, paid attention to what they did. It wasn't all code! They were driving consensus, moderating open community meetings ensuring that everyone had a voice that was given speaking time and listened too, grooming the backlog, and generally herding cats. So just like I had done before, I watched people, and found ways to be helpful too. I stepped up and took over some of these not fun but necessary roles. Not only did I eventually become a maintainer for the project, thanks to my technical contributions, I also became a Project Chair. 

Unfortunately, shortly after dragging myself up that mountain, Microsoft decided that they weren't interested Service Catalog anymore. They wanted me to work on another project, and I had to step down. This was a tough but important lesson about being paid to work in open source.

[dream]: https://carolynvanslyck.com/blog/2017/10/i-did-a-thing/)

## Community Driven Open Source

My current project is [Porter](https://porter.sh). It has grown from neat idea that Jeremy Rickard and I had at a team offsite, to a popular open-source project that is in the CNCF sandbox. After experiencing so many different ways that a project could be run, I was very intentional in creating what I wanted this time. Porter is a community-focused project where anyone can work their way up to becoming a maintainer, you don't have to work at Microsoft. Both the technology and the project governance is focused on community. Anyone can extend Porter with third party plugins that are treated just the same as the official plugins written by the maintainers. Anyone can help shape our project roadmap by attending project meetings. Work is prioritized using the feedback from our users and contributors. We don't yet have a formalized open governance model, mostly due to lack of interested people, but it is on our roadmap as a CNCF project.

It has been both humbling and exciting to shape and grow a new community. I've had some good ideas that people really responded to well, and other times regardless of the effort I would pour into something, it just didn't pay off. I am definitely still learning.

## Open Source Committees

Being an opinionated dork who likes to help others, I have also let myself be sucked into non-code roles in open-source communities. I served on the Kubernetes Code of Conduct committee for 2 years. I helped bootstrap CNCF TAG Contributor Strategy, where I am a Tech Lead and Working Group Lead. I help CNCF maintainers grow their project's community and run [contribute.cncf.io](https://contribute.cncf.io). I also run Women Who Go, a Go community centered on building a safe space for gender minorities to meet up with other gophers.

That is my story of how I went from an accidental open-source contributor to running my own open-source projects with welcoming, inclusive communities. Apologies for the wall of text, turns out I still feel the need to prove that I belong in this space. 😬 Thank you for reading this far! My next post in this series will tackle how to break into open source.

<!--
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
-->
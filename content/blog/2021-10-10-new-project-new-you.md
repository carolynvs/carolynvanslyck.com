---
comments: false
date: "2021-10-10"
title: "New Project, New You: Joining an open-source project"
slug: new-project-new-you
description: >
  This isn’t the usual, “how to get into open source” advice, so if this isn’t your first rodeo, stay put, this applies to you too.
image: /images/mlp-let-me-in.png
cardStyle: summary_large_image
---

<figure>
  <img src="/images/mlp-let-me-in.png" alt="Twilight Sparkle, a purple cartoon unicorn, looks suprised because another pony fan, in a Twilight Sparkle t-shirt, is standing outside her room, with their face pressed up against the window with their arms raised, banging on the window to be let in." />
  <figcaption><a href="https://mlp.fandom.com/wiki/Once_Upon_a_Zeppelin">My Little Ponies: Once upon a zeppelin</a></figcaption>
</figure>

> This is part three in the series [Open Source: The Nice and Accurate Advice of Carolyn Van Slyck]({{< ref "2021-08-06-open-source-journey.md" >}})

Do you feel that excitement? Like when you open a new notebook at the beginning of the school year, and before you put your pen to the page, you think "_This time everything is going to be different_". Or I may just have weird associations with school supplies... 🤷‍♀️ But never mind that now, let's talk about being a new contributor! This isn't the usual, "how to get into open source" advice, so if this isn't your first rodeo, stay put, this applies to you too.

Everyone starts as a new contributor, but what most don't realize is that you never _stop_ being a new contributor. No matter who you are, when you join a new project, you get to experience that new car smell all over again. No matter how comfortable and well-accepted you may be somewhere else, here you are new and get to start over.

I am not saying that your reputation and actions elsewhere don't carry over. They do; so make good choices! What I am saying is that other things do not carry over, such as privilege, authority, and trust. Even if you are a maintainer for another project, on this project, you are new. To the code, the community, their values and processes, perhaps even the domain and people involved. Each time that you join a project you can be intentional about how you engage with that project.

## Pick a Project

When you find a project that you would like to work on, lurk for a minute, and get the lay of the land. Before you invest any of your time, ask yourself a couple questions:

**Are other contributors and community members treated well?**

I like to poke around the issue queue, mailing list or slack channel. See if things often get tense and mean spirited, people are ghosted, or it looks like a friendly place to hang out. Pay attention not just to how maintainers treat contributors and end-users, but also how everyone else treats the maintainers. Respect is a two-way street.

**Does the project want contributors?**

Look for the project's governance structure, contributing ladder, or contributing file. It is a good sign if they clearly outline the project roles and how someone could work their way up to being a maintainer. If that is missing, check who is merging pull requests. Is it just the repository owner, only employees of the company, or is it a healthy distribution of maintainers?

Check if pull requests are actually getting reviewed and merged. Some popular projects may seem great at first glance, but upon further inspection reveal that this is someone's old side-project, restricted to just employees, or not terribly interested in accepting contributions.

**Is this project a good fit for my skills?**

Think about what skills are needed to be a successful contributor to the project, and what you still need to learn. All projects require some proficiency with editing files, git, and GitHub. If you are new to open source or programming, be prepared to spend time learning how to do common tasks. If on top of that you are also learning the programming language, and aren't familiar with the project or the problems it solves, you may want to look for a project that has a formal mentorship program, a new contributor onboarding program, or an active community who likes to help beginners.

As long as you are able to put in the time to learn, you can find other ways to contribute until you understand the technical side. But it is easier to start with a project where you aren't learning _everything_ all at the same time. So keep that in mind.

## Build Trust

Your most important job as a new contributor is building trust. From your first pull request, demonstrate that you are willing to learn, take direction from the maintainers, collaborate with others in a positive way, and that you will be a net positive for the project.

<p align=center><strong>What matters is that you are a net positive for the project</strong></p>

I want to stop here for a moment and really let that sink in, because we all come to a project with different goals. Maybe you are contributing because you use the project at work and it would make your life easier if they would just accept this one patch upstream. Or you are using it as a learning experience, and are new to coding, the programming language, or the domain. Whatever your reasons, they aren't relevant from the project's perspective. What matters is that you are a net positive for the project. Keep that in mind and let it guide your decision making because it will help you avoid common mistakes.

I say "net" positive because it is okay to need help, especially at the beginning. A maintainer expects to provide context and guidance while you get your bearings. They also need to see that an investment in you will eventually lead to you being more of a help than a burden. I have seen a lot of new contributors start off on the wrong foot because they:

* Expected the maintainers to teach them.
* Wanted to offload the maintenance of a patch onto the project and then leave.
* Tried to make their needs the maintainers' responsibility.

<p align=center><strong>Respect the maintainer's time, and take advantage of their most valuable asset</strong></p>

So what is reasonable to ask for help with as a new contributor, and what should you be figuring out on your own? Before you hit up a maintainer with questions ask yourself: Have I put in the effort to learn this myself? Respect the maintainer's time, and take advantage of their most valuable asset: project specific knowledge. Here are a few examples:

<p align=center><strong>Become an end-user before attempting to be a contributor</strong></p>

I want to start with what should be the most obvious but never is. You should know what the project is, and have used it before. Become an end-user before attempting to be a contributor. Read their documentation, watch a demo, install the software, and really use the project. If you have questions at this point, ask in the project's preferred channels for asking questions. You don't have to be an expert by any means, but not doing this homework first demonstrates an astounding lack of interest in actually helping the project. Maintainers, this is a great way to avoid wasting a ton of time on people who aren't ever going to give back.

<p align=center><strong>Maintainers can help with project-specific questions</strong></p>

Setting up your development environment... depends. Avoid asking for lots of support with the language and standard tools. Maintainers aren't here to teach you Go, git, how to use the package manager, or other things that you could pick up from blogs and online resources. Maintainers can help with project-specific questions such as: makefile targets, if there is a script to assist with deploying the project locally, or setting up a test environment. Do your best to learn general knowledge on your own time. Don't forget to read the contributing file first, since there is a good change that the answers you seek lie within. And if not, then you may have just come up with a great idea for a first pull request.

You have fixed a bug or implemented a feature, but you are struggling with how to test the change given their test framework. Not how to write a test. But how to add a test that fits in with their existing test suite, and takes advantage of any special sauce that they use to make maintaining tests easier.

If you new to coding and people pointed you at open source as a great way to learn, they weren't wrong but that is not the whole story. Head over to my previous post about [why would you contribute to open source]({{< ref "2021-08-08-open-source-curious.md" >}}) to get some background, and set expectations. While a lot of maintainers are really nice people who will answer basic questions, if you need more structure and one-on-one support, I recommend looking for projects that advertise a mentoring program, like the [LFX Mentorship Program]. Also join the beginners channel in any relevant Slack teams like #beautifulbeginners in the [Women Who Go Slack], #kubernetes-users in the [Kubernetes Slack], or #go-for-beginners in the [Gophers Slack]. 

[LFX Mentorship Program]: https://lfx.linuxfoundation.org/tools/mentorship/
[Women Who Go Slack]: https://womenwhogo.org/invite.html
[Kubernetes Slack]:https://slack.k8s.io/
[Gophers Slack]: http://invite.slack.golangbridge.org/

## Submit a Pull Request

Sometimes a project puts out the welcome mat, and curates issues with labels like "good first issue" or "help wanted". Ideally these issues have enough context, explicit requirements and a suitable difficulty level for someone new to the project.

However, if those aren't available, never fear! The best way to get started on any project is:

1. Read the documentation. Not just the quickstart either, really try to understand and learn the project, the problems it solves, and how to use it.
2. Try out the software. Run through some tutorials, and then make something that uses it. For example, if you were trying out Porter, make a bundle, install it, and then upgrade to a new version.
3. Now think about which parts were hard, or confusing. Once you have figured how to do something, ask yourself if there was anything missing or not fully explained in the docs that would have helped you be successful more quickly.

Maybe the docs have gotten out of date, and the instructions didn't quite work without modifications. Sometimes a project will have reference docs that explain the available commands, or config file syntax but are missing high level explanations of the concepts, or task-oriented tutorials.

Check the issue backlog to see if anyone else has run into the same problem. If you ran into it too, give it a 👍. If not, create an issue, explain what you had trouble with and what would have helped you understand it better.

If there was a small bug in the docs or setup instructions, many projects don't need an issue first (check the contributing file to know for sure), and would welcome a quick pull request to fix it. When you aren't sure what the correct solution should be, create an issue first and discuss it with the maintainers.

## Be Helpful

Here are some other ideas for finding ways to contribute when you aren't yet an expert.

### Help other new users
Once know how to setup the project and have figured a few things out, keep an eye out for questions from new users in Slack and answer the ones that you can. Point people to the relevant documentation, examples of what they are trying to do, or share what you have learned from setting up your own environment.

Don't answer questions that you aren't sure that you know the answer though. Lurk, be patient, and wait for the right question.

### Help the maintainers scale
Pay attention when other people ask questions on Slack. Try your best to understand what they asked, and the answer they got. The next time you see someone asking a similar question, you can answer! Often great questions and insights about a project are buried in replies on Slack or the mailing list.

If the project has a FAQ, submit a pull request adding the question and answer. If they don't have a FAQ, suggest that they add one in an issue and then offer to create an initial FAQ for them.

## What next?

After that first pull request, you may be thinking to yourself "_Now, that was awkward_"... so let's assess how it went. If there were some red flags hinting that you should spend your time elsewhere, pay attention to your gut. It is okay to decide that this project just isn't for you.

But if it was only weird because you were trying to collaborate with strangers on the internet, then buckle up! Next up I will lay down some advice for how to improve as a contributor and how to settle into a project. Stay tuned!

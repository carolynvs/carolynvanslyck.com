---
categories:
- go
- kubernetes
comments: false
date: "2018-06-24T00:00:00Z"
title: Interview Brain Dump
slug: interview-brain-dump
---

<figure style="text-align: center; float: right; margin: 5px">
  <img src="/images/interview-technique.jpg" alt="Fry: Not sure if I'm calm because I studied enough or because I don't give a shit anymore" width="300" />
  <figcaption>
    My Interview Technique
  </figcaption>
</figure>

Last year I spent a silly amount of time interviewing for remote senior Go developer
positions working on upstream Kubernetes. I'm not sure if I landed my current position on the Azure
Containers team at Microsoft because of my interviewing
skills. In fact it may have more to do with [my cluster decorating](http://carolynvanslyck.com/blog/2017/10/all-the-pretty-little-ponies/)
to be quite honest, but I'm not so cool that I won't take all help that I can
get!

I had hoped to write up some inspiring, insightful post on how to go about
the interview process but after circulating this advice in gist form for a few
months, I'm going to simply admit defeat, fix some spelling mistakes, and turn
that gist into a proper blog post. 😉

## Stuff I have been asked in my most recent senior developer interviews

* Kubernetes architecture and how take to take advantage of it to solve problems.
  Understanding the market, the problems that we are trying to solve with k8s,
  what still needs to happen. Of course I also think it's pretty useful to have
  a feel for the various groups of k8s users and what they are looking for.
* Docker architecture and understanding of how it is implemented: cgroups,
  namespaces, security options, alternative runtimes, volumes, persistence...
  Essentially, what's really going on after unpacking the higher level abstractions.
* Go mastery, particularly how Go's concurrency works and how to leverage
  various patterns. I recommend reading [Concurrency in
  Go](https://www.amazon.com/Concurrency-Go-Tools-Techniques-Developers/dp/1491941197)
  and watching [Kavya's GopherCon talk](https://www.youtube.com/watch?v=KBZlN0izeiY).
* Cultural fit, mostly focused on how well I would do in a completely distributed team.
  * Do I like to collaborate?
  * How do I approach dealing with conflicting personalities in the workplace,
    and in open source?
* Making sure that the things that make me happy in a job are satisfied, and
  that my career goals align.
* Since I wanted to do 100% OSS, we talked a lot about politics, the realities of
  how things get done in OSS, the frustrations, how I deal with them, how I deal
  with conflict, tricks for getting stuff done with a PR is rejected, or not
  merged for months, etc.

I found it impossible and demoralizing to try to prep for algorithm / data
structure questions, since the set of possible questions is large and there's
only so much that one can study. Mine was about identifying disjoint sets in a
directed cyclic graph, and I struggled with it since I graduated from university
over 14 years ago. If you really do want to go down that
route, memorize Cracking the Code and have fun interviewing at Google. 👋


## Preparation Ideas

* Draw the kubernetes architecture:
  * What's on the master, the workers, what are the communication flows, how can
    it be secured.
  * What are some of the types of resources such as replica sets, jobs and
    how/when would you use them.
  * I had a diagram piece of paper while interviewing so that it was easier for
    me to talk about it over the phone with someone, because I like to point at
    things and gesture wildly.
* Decide which language you want to interview in (e.g. Go), and make sure that you
  aren't rusty on key stuff that maybe you are comfortable reading and understanding,
  but may not be great at typing out into a blank editor: various for-loop syntaxes,
  variable declaration, type casting and switching, anonymous functions, defining
  a struct/interface, defining a method on a struct, and fmt.Println vs Printf, vs Sprintf, etc.
* Be ready to speak to what recent/upcoming features are you excited about:
  * What areas of k8s or just problems in general (like infra) are you excited to
    solve?
  * What is a bug or lack of feature that you wish you could fix?
  * What's your opinion on upcoming Go features, like dependency management.
* If you have side projects that you are excited to talk about, they are great to
  bring up. I made sure to mention my pony cluster, and it made people laugh and
  demonstrated that I really do enjoy this stuff. It's okay if you don't have
  something like that to point to, just saying that it's okay to bring up things
  if they don't ask about them.
* Practice answering a question like "Describe all the things that happen between
  someone typing `docker run...` or `kubectl run ...` and the command completing
  successfully". It is a similar question to the "Tell me what happens when you
  type an address into the web browser and the page is loaded".

  The intent of the question is to see where you have deep knowledge and how
  broad your knowledge is. For example do you go off and talk about networking,
  dns, api call flows, or system/kernel stuff. Are you only able to talk about
  what happens, e.g. "a pod is deployed" or can you go
  deeper into _how_ it happens, such as walking through the lower level components
  (kubectl, the api server, kubelet, docker, the kernel) and the actions they
  perform.
* Seriously, read that concurrency book and watch Kavya's talk. In all of my
  interviews the only thing consistent was that **everyone asked about concurrency**,
  how channels work, how they are implemented (such as "Is every goroutine on a
  separate thread" Are they OS threads?"), etc.
* Reflect on some of your most recent projects, pick 1-2 and be ready to answer
  a variety of questions about them. Practice your answer, write down key points
  and keep that handy for a phone interview.

  Common questions are:
  * Explain the project at a high level in 30 seconds.
  * Tell me about a time when you had to debug something really hard, how did you go
    about figuring out what was wrong?
  * Tell me about a time when you had an interpersonal conflict on a project and how
    you resolved it?
  * Tell me about a project that you really enjoyed, and be ready to talk about the
    architecture of the project, what your role was, did you support it in
    production, what would you do differently, etc.
  * Keeping it to a few recent projects, and especially projects that you enjoy
    talking about will make it easier to be prepared, easier for the interviewer to
    follow your answers, and show them that you enjoy your work.
* Make sure that you understand what you are looking for in a job/career:
  * Do you want to work on a tight knit team? Or are you okay with being on a "team
    of one"?
  * Do you prefer to independently work and then sync up with people? Or do you
    thrive on collective brainstorming?
  * Do you enjoy collaborating on a design, or do you prefer to think about it
    first and then share when you feel prepared?
  * What types of problems do you want to be solving? (for example I am very
    focused on developer experience, others care about working on new features)
  * Are you comfortable talking to customers/users or do you prefer to leave
    that to others?
  * What areas do you want to learn more about or grow your skills in?
  * What are some things that would make you unhappy and think of questions to
    spot them.

## Performance Art Problem Solving
When you are asked to solve any problem (algorithm or something more high level)
in front of people, here my some tips:

* It matters more how you approach solving the problem than having the right
  answer.
* Speak out loud as you think. It's okay to be quiet for a few seconds while you
  collect your thoughts, especially at the beginning but let the person know what
  you are thinking.

  Examples:
  * _"Let me think about that for a second"_
  * _"Hmm, here are some concerns that I would have and want to verify"_
  * _"I am stuck on this part, here's what I think but maybe I am missing something related to X"_
* Focus on solving the problem iteratively. It's perfectly ok to start with a
  brute force or bad solution, identify its problems, and then make another pass
  and improving your solution. That is _much_ better than focusing immediately
  on the optimal solution and then not finishing.
* It's okay to say what you are stuck on, and then say that you will come back to
  it later. Or that you know the category of problem and what you would research.
  For example when asked an algorithm question that I had trouble solving
  perfectly, the fact that I could identify the problem (disjoint set
  identification), indicated to them that I was familiar with it, and that I was
  capable of finding a solution with additional time and resources (read: Mr. Google).
* Don't give up and practice talking out loud as you think through how you would
  approach the problem, what are potential problems, what are things that should
  be tested even if you don't write tests for them.
* Keep a piece of paper and draw, write lists, write down the problem after they say
  it so that you don't forget things or get lost/confused.
* It's okay and expected that you will ask questions and collaborate with the
  interviewer to solve the problem.
* One good way to get practice is find a friend, and hop on a Video call with them.
  Share your screen, open up an editor (not an IDE!) and try to write Go app from
  scratch. For example: Print out all the even numbers from 0-10. Your friend doesn't
  need to even know Go for this to work. It just gets you comfortable with typing
  in blank file while someone is watching you.

Let me know if you found this helpful while interviewing! If you are in Women Who Go
or K8s Women, and would like someone to chat with about your interview adventures
and mishaps, feel free to DM me on Slack!

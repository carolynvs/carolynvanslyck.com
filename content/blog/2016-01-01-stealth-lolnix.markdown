---
categories: git lolnix windows
comments: true
date: "2016-01-01T00:00:00Z"
title: Install a Linux-like Environment on Your Windows Machine in Minutes
---

<figure style="text-align: center; float: right; margin: 5px">
  <img src="/images/stealth-lolnix/hipster-kitty.jpg" />
  <figcaption>Can haz lolnix?</figcaption>
</figure>

Sometimes it feels like Windows developers are left out of all the fun. The cool new tools and
technologies are all written by hipsters on their sexy Macs
with the intention of being deployed on unsexy Linux servers off in the cloud.
A decade ago, Windows developers didn't care. We had a very nice stack of Microsoft technology
and tools that just worked, and we weren't much interested in what the other team was up to.
At first it was just a trickle, tools from the other side, such as
git, snuck in. Then node and its front-end tools popped up,
and now everyone feels like they should really know what
Docker is all about. _Uh... whales, right?_ <img src="/images/stealth-lolnix/docker.png" alt="docker docker docker mushroom!" class="emoji" />

The Windows, Linux and Mac OS X worlds are starting to collide and I am loving it!
My computing background is a total hodgepodge:
I wrote my first choose-your-own-adventure game with QBasic on DOS,
played Oregon Trail on my school's coveted Apple computer, administered linux web servers,
made a living slinging C# and now I get to spend my time helping to bring these worlds
closer together.

So back to the poor Windows developer, who can't seem to catch a break. Short of
buying expensive hardware or making the leap from Windows to a Linux desktop,
there weren't many ways to learn and try out some of these tools. While it
was always an option to totally geek out and setup Cygwin... let's be honest, that's
a daunting task that few were willing to sign up for.

Enter stage left: Git for Windows, my beloved Trojan Horse. Many Windows developers
have installed git, either manually or thanks to it being bundled with Visual Studio 2015.
But why did I call it a Trojan Horse? Because you don't just _get git_ when you install it.
You also get a Linux-like environment that I lovingly call **lolnix**. After innocently running a simple installer,
not only do you have git, but you also have a new shell, bash, plus useful tools like
`curl`, `vim`, `cut`, `sed`, `grep`, and all sorts of goodies.

> lolnix = my pet name for a Mac OS X/Linux like environment on Windows

This is nice but once I became used to having _some_ of these tools
on my Windows machine, I wanted _all_ of them. Recently I learned that I can go
even further with lolnix, with very little effort. Just switch
from installing [Git for Windows][win-git] to [Git for Windows SDK][win-git-sdk] and you now have access
to a cornucopia of tools because the SDK gives you [pacman][pacman]! No, not the hungry yellow
ghostbuster, but the package management tool. Armed with pacman, you can install
[all sorts][msys2-packages] of [fun tools][mingw-packages]. Just one installer,
and you are up-and-running with a very functional Linux-like environment where
you can start playing with new tools at your leisure, no big bang required.

For me, I really wanted `make` on my Windows machine, as I'm playing around
with some cross-platform Go development. {insert unrepentant pitch for the [Docker Version Manager (dvm)][dvm] and
the [Carina CLI][carina-cli] here} So give it a shot and discover your own favorite tools today!

**A friendly note about command line terminals**

I don't know how to put this politely but the command-line experience on Windows sucks.
If you are using the default terminal in Windows, whether with CMD, PowerShell or Bash,
follow my tutorial [Set Up a Proper Windows Terminal][proper-terminal].
I promise it is worth your time and you'll quickly see how much better things can be!

[win-git]: https://git-for-windows.github.io/
[win-git-sdk]: http://git-for-windows.github.io/#download-sdk
[pacman]: https://wiki.archlinux.org/index.php/Pacman#Installing_specific_packages
[msys2-packages]: https://github.com/git-for-windows/MSYS2-packages
[mingw-packages]: https://github.com/git-for-windows/MINGW-packages
[proper-terminal]: /blog/2016/01/a-proper-windows-terminal/
[dvm]: https://getcarina.com/docs/tutorials/docker-version-manager/
[carina-cli]: https://getcarina.com/docs/getting-started/getting-started-carina-cli/

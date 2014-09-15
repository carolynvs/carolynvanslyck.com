---
layout: post
title: "First Impression of .NET vNext"
date: 2014-09-11
comments: true
categories: vnext
---

When ASP.NET vNext was first announced, I was scratching my head over how it would impact developing .NET in non-Windows environments. There was a lot of hype, snippets of info coming from multiple sources, and nothing I could try out for myself. Well now that the [Visual Studio 2014 CTP](http://www.visualstudio.com/en-us/downloads/visual-studio-14-ctp-vs.aspx) is out, I finally can! 

<aside>If you have an Azure account, I recommend using their Visual Studio 2014 VM image to test things out without wreaking havoc on your day-to-day machine.</aside>

Here are my first impressions:

## What the heck is it? ##
vNext is Microsoft's term for the upcoming version of .NET which is based on their new OSS compiler (Roslyn). It includes both plain old .NET and ASP.NET. The goal is to make .NET development easier, truly cross platform and cloud friendly.

To that end, vNext means:

* Microsoft's now includes Mono in their test matrix. Their partnership with Xamarin should help Mono keep pace with .NET development. Xamarin still maintains Mono, and Mono is still the .NET platform for non-Microsoft operating systems.
* An improved development experience outside of Visual Studio. They are adding command line tools, and simplifying project management so that developing in say Sublime on OS X is not only possible but a good experience.
* Decoupling ASP.NET from IIS, System.Web and removes remaining impediments to running .NET websites on Linux.
* Adding the Roslyn compiler and C# 6 goodies.

## It is finally easy to get up and running on Linux/Mac! ##

You no longer need to build Mono yourself, or wait months for an up-to-date package. WOOHOO! Here are the steps I used ([taken from the Mono install doc](http://www.mono-project.com/docs/getting-started/install/linux/)) to install the latest version of Mono (3.8) on Ubuntu.

<script src="https://gist.github.com/carolynvs/4520736f6017ca252a44.js"></script>

Run `mono --version` to verify. You should see something like this `Mono JIT compiler version 3.8.0`.

## Worst naming ever, k all the things! ##

For some reason, all the new commands and associated concepts start with the letter 'k' and god help you if you need to search the web using these terms, they are too generic and often already had another meaning, such as 'kvm'... [Read this for an explanation of all the k's](http://weblogs.asp.net/imranbaloch/k-kvm-kpm-klr-kre-in-asp-net-vnext). 

On a Windows + Visual Studio environment, learning these commands is not necessary. However if you are targeting cross-platform or would like to develop on a different operating system than what you are running in production, these commands handle everything that previously was performed by msbuild, NuGet, etc.

* k - executes commands such as `k run` which runs a console application, `k kestrel` which starts the Kestrel web server. Think of it as "rake for .NET".
* kpm - manages dependencies, e.g. `kpm restore` to restore dependencies, `kpm build` to compile and build your package. Dependency management is built on top of NuGet.

## Bye Bye IIS ##
Previously, if you wanted to use ASP.NET, you had to host on Windows + IIS. Though other frameworks, such as NancyFX, have always worked on Linux/Mono. Now with vNext you can finally use the ASP.NET MVC or WebAPI cross-platform without the IIS requirement.

Just a few options for hosting include:

**Self Hosting**

Rather than hosting your application in a web server, your process will bind to a port and serve itself directly. To configure add the following to the commands section of your project.json and start your server using `k web`.

    {
        "dependencies": {...},
        "commands": {
            "web": "Microsoft.AspNet.Hosting --server Microsoft.AspNet.Server.WebListener --server.urls http://localhost:5001"
        }
    }

**Helios**

Free yourself from System.Web, and take advantage of OWIN based hosting on IIS. [Read more about project Helios](http://blogs.msdn.com/b/webdev/archive/2014/02/18/introducing-asp-net-project-helios.aspx).

**Kestrel**

This is a new cross-platform web server developed for ASP.NET vNext. It is quite unfortunate that they chose this as the name is already used by the [Kestrel queue framework](https://github.com/twitter/kestrel). Make sure to use "kestrel vNext" when searching for more info on it... To configure add the following to the commands section of your project.json and start your server using `k kestrel`.

    {
        "dependencies": {...},
        "commands": {
            "kestrel": "Microsoft.AspNet.Hosting --server Kestrel --server.urls http://localhost:5004"
        }
    }

<aside>At the time of writing there is an [open issue](https://github.com/aspnet/KestrelHttpServer/issues/10) with running Kestrel on Linux. What I did to work around it is compile Kestrel (v0.11.29), and copy the resulting libuv.so.11 to ~/.kpm/packages/Microsoft.AspNet.Server.Kestrel/1.0.0-alpha3/native/darwin/universal/libuv.dylib. If you trust me and don't feel like building libuv yourself, [download the file that I built](/downloads/libuv.0.11.29.tar.gz).</aside>

## k10, Core CLR, Cloud CLR... pick a name already! ##
In keeping with their love of the letter 'k', k10 a.k.a Core CLR, a.k.a. Cloud CLR, is Microsoft's new .NET Framework. Traditionally the .NET Framework was optimized for running on a desktop machine. It includes the entire BCL (Base Class Library), has a heavy footprint, and was not designed with cross-platform concerns in mind. It will continue to work and be backwards compatible going forward. k10's framework has been broken down into discrete packages, e.g. `System`, `System.Console`, allowing you to pick and choose which aspects of the framework you require, e.g. including only `System` and `System.Console` and excluding heavy stuff like `System.Drawing`. Dependencies on tightly coupled modules, mostly `System.Web`, have been removed.

If you want to target non-Windows platforms, k10 is what you should be using. Unfortunately, because the entire BCL is not included, existing assemblies will not work with it. Similar to how you could only reference assemblies that were built with the Compact Framework in mind, you cannot reference an assembly from k10 that wasn't also built for k10 This means that 99% of the packages on NuGet are off-limits for now, severely limiting how quickly you could upgrade an existing code-base.

So if you are developing for cross-platform, it is going to be a while before you can use anything beyond pure .NET + ASP.NET MVC/Web API. I am concerned that this will severely slow-down adoption and sure puts a kink in my plan to migrate [Bytes for Health](http://bytesforhealth.com) in 2014.

## Simplified Project Management ##
I really like the new project file format, project.json. This file is the master definition of your project, replacing the traditional csproj file. It does not list individual files anymore which is a great improvement. Instead project.json is used to list dependencies, build configuration, etc. [Checkout the official doc](https://github.com/aspnet/Home/wiki/Project.json-file).

<script src="https://gist.github.com/carolynvs/f9d1a4b4f09542778bf8.js"></script>

Now if you use Visual Studio, you will see that a few extra files are created. Don't worry, they aren't necessary or even used on other platforms and appear to simply exist to help Visual Studio work with vNext. They don't store duplicate data such as references or files. So let VS create them and check in both the `*.kproj` and `sln` files. Ignore the `ide.sln` directory as that contains temporary build artifacts.

## Final Thoughts ##

I love developing in C# and I am really excited about where things are heading. Why?

Because my main complaint about ASP.NET is requiring Windows/IIS for hosting.  Now with vNext I'm deploying to Linux which is an environment I am much more comfortable securing, maintaining and licensing. 

I think that one day soon, .NET will be a viable cross-platform alternative to Java. A girl can dream, right?


---
categories: atlassian
comments: true
date: "2014-08-07T00:00:00Z"
title: Create an Atlassian Plugin
slug: atlassian-plugin-getting-started
---

I am a big fan of continuous integration, testing and improving the development experience. Using Atlassian Stash and Bamboo every day has given me lots of ideas for making them better. Thanks to Atlassian's great SDK, and the ability to view the core application's source code as a reference, developing plugins is very straightforward. My [first plugin](https://marketplace.atlassian.com/plugins/com.carolynvs.reject-merge-commit-hook), was completed and deployed to the marketplace in just a single weekend and after that ... I was hooked.

I have now [published four plugins](https://marketplace.atlassian.com/vendors/1211016) on the marketplace, some trivial while others really dig into the guts of the core application. This post is the first in a series on writing plugins for Atlassian, sharing some of my lessons learned and consolidating what can be sparse documentation into a more useful format.

---

* Getting Started: Create an Atlassian Plugin
* Anatomy of Plugin *coming soon!*
* Unit Testing *coming soon!*
* Wired / Integration Testing *coming soon!*
* Dependency Injection: Using Core Atlassian Classes from your Plugin *coming soon!*
* Accessing the Database *coming soon!*
* SDK Development Tools *coming soon!*
* Building and Testing your Plugin on a Build Server *coming soon!*
* Publishing your Plugin to the Marketplace *coming soon!*

---

So you have an idea for a plugin, or perhaps filed a feature request / bug report with Atlassian and are tired of waiting, what next?

## Plugin Types

Before you start developing a plugin there are a few questions you need to consider:

1. Do you need to alter the core application's behavior? ***You must use a server plugin.***
2. Do you want use your plugin on Atlassian's OnDemand? ***You must use a cloud (Connect) plugin.***

<aside>I have not yet written a cloud (Connect) plugin, so this series will focus solely on server plugins.</aside>

**Server**

Server plugins can be deployed to an Atlassian application instance that is hosted on your own server. While there are some limitations, for the most part they have access to the same code that the core application itself is written in.

* Hosted on the application server
* Written in Java
* May access most of the application's internal classes
* May save data to the application's database

**Cloud**

Cloud plugins can be deployed to Atlassian OnDemand cloud hosted applications. They use the [Connect plugin framework](https://developer.atlassian.com/static/connect/docs/guides/introduction.html). A Connect plugin is hosted on a server external to the application server and is similar to a hosted div or iframe. Your plugin will look like it is part of the application but all code is executed on your server and has very limited access to the core application.

* Hosted externally from the application server
* Written in any language
* Interacts with the core application via its public REST api

## Setup

### Install SDK
First step is to download and install the SDK on your machine ([Windows](https://developer.atlassian.com/display/DOCS/Install+the+Atlassian+SDK+on+a+Windows+System), [Linux or Mac](https://developer.atlassian.com/display/DOCS/Install+the+Atlassian+SDK+on+a+Linux+or+Mac+System)).

**Windows Tips**

I develop plugins both on Windows and Mac; the experience is mostly the same. When on Windows, I prefer bash over cmd and wrote [wrapper shell scripts](https://github.com/carolynvs/atlassian-plugin-sdk) for the batch files provided by the SDK. This lets me stay in bash and use the sdk commands exactly the same as I would on Mac or Linux, e.g. `atlas-run-standalone --product Jira`.

Also I can't help but recommend that you use a real command line terminal instead of cmd.exe. [Console](https://github.com/cbucher/console) is easy to use and lets you copy/paste, resize, maximize, use tabs, etc.


> Friends don't let friends use cmd.exe.

### Download Source
I recommend downloading the source code for the application you are extending. To download the source, purchase a starter license then go to [my.atlasian.com](http://my.atlassian.com) and there will be a link to source from your license entry.

<aside>While not strictly necessary, I have a much easier time understanding which classes are available and how they should be used by reading the source code than their online class documentation. This also enables you to debug into the core application.

Note that the license is purely to gain access to the source code, as the SDK automatically generates temporary development licenses and doesn't require or use a real or evaluation license.</aside>

### Install Java IDE
While you could go commando and just use your favorite text editor, I prefer an IDE. [JetBrains IntelliJ IDEA](http://www.jetbrains.com/idea/) is free, can debug your plugin code and has all the nifty refactorings that have I come to expect from developing in C# with ReSharper.

## Create an Empty Plugin
The SDK provides a command which scaffolds an empty plugin for each application. From the command line run the appropriate command for the application you are extending: e.g. `atlas-create-bamboo-plugin` or `atlas-create-stash-plugin`. The SDK will then ask you a series of questions:

* **groupId**: Plugin namespace prefix, e.g. com.carolynvs
* **artifactId**: Plugin name, e.g. trade_depot
* **version**: Plugin Version, e.g. 1.0.SNAPSHOT. You may change this at any point by editing your pom.xml. I recommend accepting the default.
* **package**: This should be groupId.artifactId, e.g. com.carolynvs.trade_depot

<aside>If you are unfamiliar with Maven and Java, check out [Maven Naming Conventions](http://maven.apache.org/guides/mini/guide-naming-conventions.html) and [Naming a Java Package](http://docs.oracle.com/javase/tutorial/java/package/namingpkgs.html). The SDK will not validate what you enter and if it is not valid, your plugin won't compile and you will need to start over.</aside>

At this point you have a skeleton plugin with a sample plugin defined. I recommend committing this to source control before making any changes as it is in a deployable state and will help you identify where you went wrong if you run into problems after making customizations.

Now let's verify that our plugin works and see it in action:

1. Change into your newly created plugin directory.
2. Execute `atlas-run` and wait until you see the following output from the command line "[INFO] bamboo started successfully in 374s at http://localhost:6990/bamboo".
3. Open your web browser and go to the URL from step 1.
4. Login using user: admin, password: admin.
5. Go to the Addons view in the Administration area of the application. You should see entries for your plugin and your plugin's tests.

Hurray! You now have an empty plugin with everything you need to start developing.

Coming soon... Part 2: Anatomy of an Atlassian Plugin

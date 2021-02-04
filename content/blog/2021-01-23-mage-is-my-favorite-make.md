---
comments: false
date: "2021-01-23"
title: "Mage is My Favorite Make"
slug: mage-is-my-favorite-make
description: >
  What is mage and why would you use it instead of make?
image: images/mage-twitter.png
---

<figure style="text-align: center; float: right; margin: 5px">
  <img src="/images/mage.png" width="300px" alt="Gopher in a wizard hat and robe, with a staff. The mage logo." />
  <figcaption><a href="https://magefile.org">magefile.org</a></figcaption>
</figure>

I am fangirling over a build tool, [Mage](https://magefile.org), and need to tell _everyone_ why.
Mage is very similar to make, only you write Go instead of bash.
To the end user it has the same user experience, `make build` instead of `mage build`, so it's an easy switch for your fingers.
It behaves the same as well, handling targets, prerequisites, file modification timestamps in the same way so there aren't many surprises to be had.

Now if Mage is basically make, why am I migrating all my projects from make to Mage and telling my friends?

* [Cross Platform](#cross-platform)
* [Go](#go)
* [Shell Helpers](#shell-helpers)
* [Reusable Packages](#reusable-packages)
* [Using Mage](#using-mage)
  * [Anatomy of a Magefile](#anatomy-of-a-magefile)
  * [List Mage Targets](#list-mage-targets)

### Cross Platform

Let's step back and think about why we like make to begin with.
We like make because _everyone_ already has make, right?
You won't see instructions on a project's readme on how to install make and bash before they can start working with your project.
They just say "clone the repo and run make".
It sounds so easy, and I have done that for years but there is a bit of a lie in there that I have a problem with.

Make isn't installed by default on Windows. _le gasp!_
The bash commands in your Makefile won't work on Windows without some heavy customization either.
When a contributor joins your project with a Windows machine, there is a 100 foot wall in front of them that you inadvertently built.
If they want to contribute, they **just** need to leave the developer environment that they are familiar and proficient upon.
They need to figure out hyper-v or docker, install WSL, install a linux distro, learn bash, and figure out how to edit files that are now stored on the WSL side. They **just** need to set up an entirely new machine to contribute to your project.
And I am not okay with that! 😰

Here's what the new contributor experience looks like with Mage, for developers on any platform:

Install Go

go run mage.go TARGET

Success! 🚀

<h3 align="center">This is the new contributor experience that I want for people</h3>

I like to have a reusable target that installs mage on their computer to streamline set up even further.
This gets us real close to the simplicity of _just clone and run make_, while being accessible to everyone.

1. Install Go.
1. Run `go run mage.go EnsureMage`.
1. Use `mage TARGET` from now on, just like make.

So far I have only looked at this from an inclusion perspective, which unfortunately may not be as important to everyone as it is to me. 🤷‍♀️
Maybe you don't care if experienced Windows developers become contributors, improving your code for your Windows users without you ever having to deal with Windows yourself.
Sadly the _If they are using Windows, that's their problem_ mentality is still prevalant in open-source.

Either way, there are other benefits to Mage, even if you don't give a fig about Windows users. Let me show you what's got me excited about Mage. 🧙‍♂️

### Go

I am great at bash... as long as I can reference scripts that I have previously written or lookup the syntax for the hundredth time because I immediately forget it as soon as I paste it.
For me, writing bash is not the best use of my skills and time.
I know Go better, so why not use what I know?

Bonus: I am _much_ better at graceful error handling in Go than in bash.
My Makefiles rarely do more than fail on first error and leave it up to the user to fix... 🙈

<h3 align="center">The quality of my build scripts have moved from rudimentary commands to production code</h3>

My Magefiles check for edge cases such as:

> Is Docker running and if not start the Docker Desktop process?

> Does the container exists with the same name?

> Is the error message a conditions that I can recover from?

I know that there people who are better at bash than me and I am happy for them! I'm gonna stick with Go. 😁

### Shell Helpers

Out of the box, Mage provides a package, sh, that helps you quickly run commands so that you aren't futzing with `exec.Cmd` all the time, which would be a lot more verbose. This package gives Mage the ease of use of make.

#### Run a Command

Running a command for the most part looks like what you would type at the command line:

```go
// kubectl apply -f deployment.yaml
sh.Run("kubectl", "apply", "-f", "deployment.yaml")
```

#### Capture a Command's Output

It is straightforward to capture the output of a command as well:

```go
output, err := sh.Output("docker", "logs", "mycontainer")
```

### Reusable Packages

Often I have a set of repositories for a project that all need some common build logic.
Usually it ends up with a tools repo with git submodules to include it, or curling it from another repo, or just unabashedly duplicating it in each repo.
Now that my build script is in Go, I can create a package with useful functions and import it into my other Magefiles with `import "github.com/carolynvs/buildhelpers"`.

For example I am working on a package with helper methods for installing developer tools like jq, kubectl, and helm that I need for my builds.
With a single call, I can check if the tool is installed, install the tool into GOAPTH/bin, and put it on the PATH so that it's immediately available to use without any intervention by the user.
Instead of giving people a list of dev tools they need to install, my Magefile transparently takes care of that for them.

___

## Using Mage

I hope by now you are a wee bit interested in trying out Mage. If this sounds like an improvement to you, then read on to learn how to get started. If not, well then don't @ me and enjoy your Makefiles. 😇

### Anatomy of a Magefile

Let's see what a Magefile looks like.
It's a file named **magefile.go**, usually at the root of your repository.

In this example I am using it to work with a project written in Go, but I have been happily using it on other repositories where Go isn't involved at all.
Mage is suitable for any project.

<script src="https://gist-it.appspot.com/github.com/carolynvs/mage-example/raw/main/magefile.go"></script>

It starts by applying a build tag so that it isn't picked up by your own code.
It is only compiled when `mage` is run.

<script src="https://gist-it.appspot.com/github.com/carolynvs/mage-example/raw/main/magefile.go?slice=0&footer=0"></script>

Next we import the core Mage libraries and my helper library:

<script src="https://gist-it.appspot.com/github.com/carolynvs/mage-example/raw/main/magefile.go?slice=4:9&footer=0"></script>

Here I have configured mage to run the build target by default when mage is run without a target specified.

<script src="https://gist-it.appspot.com/github.com/carolynvs/mage-example/raw/main/magefile.go?slice=12&footer=0"></script>

Using the sh package, I run `golint` and `go build`.
The `mg.Deps` call tells mage that Lint is a prerequisite of Build.

<script src="https://gist-it.appspot.com/github.com/carolynvs/mage-example/raw/main/magefile.go?slice=14:27&footer=0"></script>

The lint target uses my helper library to install golint if it's not already installed.

<script src="https://gist-it.appspot.com/github.com/carolynvs/mage-example/raw/main/magefile.go?slice=28:32&footer=0"></script>

Below is the output when I run mage.
The `-v` flag prints the executed targets and commands, instead of just the command output.

```console
$ mage -v
Running dependency: Lint
Running dependency: EnsureGoLint
exec: golint ./...
exec: go build ./...
```

### List Mage Targets

You can print all available targets with `mage -l`.
If you did not set the `Default` variable in your magefile, then running `mage` without any arguments will also print out a list of targets.

```console
$ mage -l
Targets:
  build*          Compile and lint the cli
  ensureGoLint    Install golint if needed
  ensureMage      Install Mage if necessary
  lint            Nit the hell outta my code

* default target
```

Targets are case-insensitive, so both `mage EnsureMage` and `mage ensuremage` will work.

___

I am in the process of migrating Porter from make to Mage, and using it for all my new projects.
After having a few new contributors go through the setup successfully and with a LOT less pain than previously, it is clear that this will attract and keep new contributors.

It would be great to  hear from anyone who tries Mage, or is already using it.
I'm not associated with the project at all, but I would love to hear how it works for other people, any problems you ran into, or improvements you have made yourself!

<p align="right">
Happy Building! 🌈✨<br/>
Carolyn 
</p>
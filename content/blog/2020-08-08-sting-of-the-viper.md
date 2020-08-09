---
comments: false
date: "2020-08-08"
title: "Sting of the Viper: Getting Cobra and Viper to work together"
slug: sting-of-the-viper
description: >
  Viper wasn't made to work with Cobra, but with a bit of wiring you can create
  a great user experience for your command-line tool with cascading configuration
  using user-defined flags, environment variables, config files and hard-coded defaults.
image: images/cobra+viper.png
---

<figure style="text-align: center; float: right; margin: 5px">
  <img src="/images/cobra+viper.png" width="150" alt="Cobra and Viper logos smooshing a heart" />
</figure>

Cobra and Viper, two great libraries for working with command-line tools in Go
that were never meant to work together. The sting of the viper 🐍. After lots of
time reading their source code and a bit of plumbing code, I have been happily
forcing these two [sneks] to get along for years.

Let's start off with what each library is good at:

* [spf13/cobra]: Generates command-line tools, including flags
* [spf13/viper]: Manages configuration, understands how to read it from config
  files and environment variables

[spf13/cobra]: https://github.com/spf3/cobra
[spf13/viper]: https://github.com/spf3/viper

What most of us really want is a combination of these two libraries. A
command-line tool where the user can control configuration in a precedence
order: **flags > environment variables > configuration files and the defaults set
by the tool.**

I have put together a working example that demonstrates how to accomplish this:
[sting of the viper]. First I define a function to build my cobra command in
`buildRootCommand`, having this outside of main helps me unit test it later.

<script src="https://gist-it.appspot.com/http://github.com/carolynvs/stingoftheviper/raw/main/main.go?slice=29:38"></script>

Ultimately I want to bind my configuration from the cobra flags, the viper
environment variables and configuration files to a single data structure that I
can read from. That way I don't have to deal with the precedence order of flags > 
environment variables > config file > flag defaults myself. So the very first
thing I do is define the configuration values that I want to work with, in this
case I have `color` and `number`.

Now let's use cobra to define the command-line tool:

<script src="https://gist-it.appspot.com/http://github.com/carolynvs/stingoftheviper/raw/main/main.go?slice=40:61"></script>

A few things are happening here of interest, the rest is boilerplate cobra usage:

* I am using the **root command's** `PersistentPreRunE` handler to bind together
  cobra and viper. You call this once on your root command, not
  every command that you define.
* The app has a flag and default value defined for each configuration value.
* The app prints out the final resolved value of our configuration: color and
  number. The intent is to help us understand the relationship between
  user-defined flags, environment variables, configuration, flag defaults and
  their precedence using this set up.

Next let's use viper to define our configuration. I'd like to use an optional
configuration file named **stingoftheviper.json|toml|yaml** in the same
directory. Also to avoid conflicts with ambient environment variables, I want to
only match against environment variables that start with STING_. For example,
`STING_NUMBER` can configure the `--number` flag.

<script src="https://gist-it.appspot.com/http://github.com/carolynvs/stingoftheviper/raw/main/main.go?slice=65:95"></script>

So far everything I have done is built-in to cobra and viper, but they aren't
working together yet. I have only configured each separate library. Finally this
last function is executed after cobra has parsed the flags, and just before your
command is run, and it merges cobra's data with viper's data. The final resolved
value is still bound to the variables you set when you bound the cobra flag, in
this case the variables color and number.

<script src="https://gist-it.appspot.com/http://github.com/carolynvs/stingoftheviper/raw/main/main.go?slice=103:119"></script>

Other than the tiny workaround above for dealing with flags with hyphens in
them, it replaces the hyphen with underscore since environment variables can't
have hyphens, the code to merge them is fairly unobtrusive.

I wrote a full working example from the walkthrough, [sting of the viper] with
tests to demonstrate how this works so that you can poke around and see this
work yourself. I recommend you try it out and please copy paste that last
function wherever you need it. I know I have!

I hope this is helpful to anyone else trying to tame the two spf13 🐍 libraries to build
a command-line tool. Happy coding! 🙌

[sting of the viper]: https://github.com/carolynvs/stingoftheviper
[sneks]: https://www.google.com/search?q=snek+cute

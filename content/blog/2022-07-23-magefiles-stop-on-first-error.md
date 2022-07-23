---
comments: false
date: "2022-07-23"
title: "Magefiles: Stop on first error"
slug: magefiles-stop-on-first-error
description: >
  How to stop your Magefile execution on the first error that occurs
image: images/mage-twitter.png
---

<figure style="text-align: center; float: right; margin: 5px">
  <img src="/images/mage.png" width="300px" alt="Gopher in a wizard hat and robe, with a staff. The mage logo." />
  <figcaption><a href="https://magefile.org">magefile.org</a></figcaption>
</figure>

Using [Mage] to write build scripts in Go is great, but one area where Go is pretty different from Bash is error handling.
When I write scripts, I near compulsively add `set -euo pipefail` to the top so that when an error occurs, the script stops executing immediately.
In Make, stopping immediately after a non-zero exit code is the default behavior.
So how do you make Mage stop executing when an error occurs? 🤔

While that's not really possible with Go, here are some patterns you can follow to make your Magefiles act like Make.

### Example Magefile

First let's look at what we are all starting with in Go:

```go
import "github.com/magefiles/mage/sh"

func MyTarget() error {
  err := sh.RunV("go", "build", "./...")
  if err != nil {
    return err
  }

  err = sh.RunV("go", "vet", "./...")
  if err != nil {
    return err
  }
  return nil
}
```

So how can we get this closer to the Makefile equivalent below?

```Makefile
mytarget:
  go build ./...
  go vet ./...
```

### Magex Library
My [magex] library is intended to extend Mage and provide useful helpers for common tasks.
Mage has a function [mg.Fatal(exitCode, error)][mgfatal] that Mage itself uses to throw a panic and stop execution.
Mage's main function recovers the panic, formats the error message and returns the specified exit code.
I've added a function, [mgx.Must(error)][must] that makes it easy to stop when an error is present.

```go
import (
  "github.com/carolynvs/magex/mgx"
  "github.com/magefiles/mage/sh"
)

func MyTarget() {
  err := sh.RunV("go", "build", "./...")
  mgx.Must(err)

  err = sh.RunV("go", "vet", "./...")
  mgx.Must(err)
}
```

The `mgx.Must` function reduced the error handling code quite a bit, and our Mage target no longer needs to return an error but we can go even further!

![photograph of a white long haird cat sitting on a cat sized bed frame, it looks like the frame legs have replaced his own cat legs](/images/rebuild-him-meme.jpg)

The magex library also includes the [shx] package which is an alternate implementation of Mage's sh package with additional features such as stopping when the command returns an error, specifying the working directory and more.
There are two ways to use shx to keep your commands brief:

1. Require a single command to run successfully
    ```go
    import (
      "github.com/carolynvs/magex/mgx"
      "github.com/magefiles/mage/sh"
    )

    func MyTarget() {
      shx.Command("go", "build", "./...").Must().RunV()
      shx.Command("go", "vet", "./...").Must().RunV()
    }
    ```
1. Require all commands to run successfully
    ```go
    import (
      "github.com/carolynvs/magex/mgx"
      "github.com/magefiles/mage/sh"
    )

    var must = shx.CommandBuilder{StopOnError: true}

    func MyTarget() {
      must.RunV("go", "build", "./...")
      must.RunV("go", "vet", "./...")
    }
    ```

In my own Magefiles I use a combination of [shx.CommandBuilder] to require all executed commands to succeed, along with `mgx.Must` to handle errors returned from other functions, for example handling an error from `ioutil.ReadFile`.

### Best Practices
Using panic is only suitable in certain areas of your build scripts.
It works great in your Mage targets, but I don't recommend using panic in a helper function because that makes it more difficult to write unit tests or handle the error.

For example, I have a helper function that returns information about a running Docker container.
Depending on what I'm doing, I may want to ignore the error (maybe I was just checking the container should be started), or parse the error message and perform different actions when the container isn't running, or when the Docker service is offline...
For that function, I would use standard Go error handling best practices, and not any of the tricks above that use panic to stop when an error occurs.

Judicious use of panic has helped keep my Magefiles easy to scan and understand what the build script is doing, without drowning in Go error handling.

Give it a try and let me know how it works for you!

[Mage]: https://magefile.org
[magex]: https://github.com/carolynvs/magex
[mgfatal]: https://pkg.go.dev/github.com/magefile/mage/mg#Fatal
[must]: https://pkg.go.dev/github.com/carolynvs/magex/mgx#Must
[shx]: https://pkg.go.dev/github.com/carolynvs/magex/shx
[shx.CommandBuilder]: https://pkg.go.dev/github.com/carolynvs/magex/shx#CommandBuilder

---
categories:
- go
- oss
comments: false
date: "2018-07-16T00:00:00Z"
title: Building Go from Source
---

<figure style="text-align: center; float: right; margin: 5px">
  <img src="/images/go-build.png" width="250" />
  <figcaption>
    Gophers At Work
  </figcaption>
</figure>

> This is a part of a larger effort that I'm calling [GopherSource]({{site.baseurl}}{% post_url 2018-06-19-gopher-source-adventures %}),
>  and our goal is for more of the gopher community to become upstream Go contributors.

Before we can become Go contributors, the very first step is being able to build
Go from source. I followed the [official doc](https://golang.org/doc/install/source)
and filled in the blanks a bit to figure out how to get everything working.

Go is compiled with ... Go! 🤯 Since I already have Go 1.10 installed on my computer,
I decided to use that. Another option is to bootstrap Go, [Karen Carcamo wrote up
how to do that on Linux](https://forum.golangbridge.org/t/gophersource-building-go-from-source/9722/12).

Here is the tldr of how to download the Go source and build it:

1. Clone the Go repository, it doesn't have to be in your GOPATH.

    ```
    git clone https://go.googlesource.com/go
    ```

    If you want to build a specific version of Go, now's the time to checkout that
    version using a tag, for example `git checkout go1.10.3`. Since we want to try out
    new features, namely Go Modules (the prototype formerly known as [vgo][vgo]),
    I am going to use the latest changes on the master branch.
    If you _just_ cloned, you can skip this step since you already have the latest changes.

    ```
    git checkout master
    git pull
    ```
1. Compile Go! If you are on Windows, use `make.bat` instead.

    ```
    $ cd src
    $ ./make.bash
    Building Go cmd/dist using /usr/local/Cellar/go/1.10.3/libexec.
    Building Go toolchain1 using /usr/local/Cellar/go/1.10.3/libexec.
    Building Go bootstrap cmd/go (go_bootstrap) using Go toolchain1.
    Building Go toolchain2 using go_bootstrap and Go toolchain1.
    Building Go toolchain3 using go_bootstrap and Go toolchain2.
    Building packages and commands for darwin/amd64.
    ---
    Installed Go for darwin/amd64 in /Users/carolynvs/src/go
    Installed commands in /Users/carolynvs/src/go/bin
    ```
1. Open a new shell session. Now prepend the bin directory from the output above
    to your PATH so that you are using your custom go binary by default.

    ```
    export PATH=/Users/carolynvs/src/go/bin:$PATH
    ```

    On Windows use this command instead:

    ```
    $env:PATH = "/Users/carolynvs/src/go/bin;"+$env:PATH
    ```

    Make sure to replace `/Users/carolynvs/src/go` with the location where you
    cloned the Go repository.
1. Use the version command to verify that you are now using your custom build of Go.

    ```
    $ go version
    go version devel +a12c1f26e4 Tue Jun 26 20:00:51 2018 +0000 darwin/amd64
    ```

![Excited Dog: I DID A GO!](/images/i-did-a-go.jpg)

Now that we have the latest version of Go, let's try it out and use a new feature
that has been added to Go 1.11, Go Modules! Go Modules is the official name going
forward for the [vgo prototype][vgo] and is the next
step in the evolution of dependency management in Go.

Luckily, you don't need to know what that is in order to see it in action.
Now when you run `go build`, Go will take care of retrieving your dependencies,
not just master but even a specific version or commit! 🎉

1. Clone my test repository, ANYWHERE YOU LIKE! Doesn't have to be in the GOPATH.

    ```
    git clone https://github.com/carolynvs/go-depmgmt-testrepo
    ```
1. My repo relies upon external code that isn't checked into the vendor directory.
   When you run the code, Go retrieves v0.8.0 of the errors package before building.

    ```
    $ go run main.go
    go: finding github.com/pkg/errors v0.8.0
    go: downloading github.com/pkg/errors v0.8.0
    hello world!
    ```

    There are some extra debug lines printed in the output, those are from the
    new Go modules feature:

    ```
    go: finding github.com/pkg/errors v0.8.0
    go: downloading github.com/pkg/errors v0.8.0
    ```

1. Try running the code again, and you won't see those extra lines.

    ```
    $ go run main.go
    hello world!
    ```

    Go downloaded the dependency and cached it in `$GOPATH/src/mod`. Next time
    you build, Go will retrieve that package from its cache.

    ```
    $ tree ~/go/src/mod
    ~/go/src/mod
    ├── cache
    │   ├── download
    │   │   └── github.com
    │   │       └── pkg
    │   │           └── errors
    │   │               └── @v
    │   │                   ├── list
    │   │                   ├── v0.8.0.info
    │   │                   ├── v0.8.0.mod
    │   │                   ├── v0.8.0.zip
    │   │                   └── v0.8.0.ziphash
    └── github.com
        └── pkg
            └── errors@v0.8.0
                ├── LICENSE
                ├── README.md
                ├── appveyor.yml
                ├── bench_test.go
                ├── errors.go
                ├── errors_test.go
                ├── example_test.go
                ├── format_test.go
                ├── stack.go
                └── stack_test.go
    ```

    We will go into more detail about Go modules and what's happening under the covers
    in the next blog post!


![Gopher hanging on GO balloons](/images/go-balloons.png)

<p style="text-align: center">🚀 Step 1 of becoming a real Go contributor accomplished! 🚀</p>

If you'd like to play with Go Modules more, a bunch of friendly gophers are sharing what we
learn as we go along and you can join us in the Go forums in the [Exploring Go Modules
thread](https://forum.golangbridge.org/t/gophersource-exploring-go-modules/9900).
Otherwise if you want all the info but don't have time to play, I will do a followup
post in a few days summarizing what we discover.

[vgo]: https://research.swtch.com/vgo

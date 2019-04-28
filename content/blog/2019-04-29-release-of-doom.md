---
comments: false
date: "2019-04-29"
title: "Mega Release of Doom - Porter"
slug: release-of-doom
description: "Release notes for humans on v0.5.0-ralpha.1+elderflowerspritz"
image: images/porter-logo.png
---

<figure style="text-align: center; float: right; margin: 5px">
  <img src="/images/porter-logo.png" width="250" alt="Porter Logo" />
</figure>

> This is part of a miniseries explaining what I am working on lately:
> [Porter][porter] which is based on the Cloud Native Application Bundle, or 
> [CNAB][cnab] Specification.
> [Start from the beginning]({{< ref "2019-04-27-nerd-snipe.md" >}})

I just finished the reßlease notes for [Porter v0.5][release] and holy smokes,
this is a MEGA RELEASE OF DOOM! 💥

The official release name is **v0.5.0-ralpha.1+elderflowerspritz** and as part
of our release, I've finally gotten around to documenting [how we name our
releases][releases].

Normally I'd just link to the release notes and let y'all enjoy the scavenger
hunt of looking up the pull requests to figure out what features went in. But we
went a lil overboard, a bunch of really cool features snuck in one after another
before we realized "gee we haven't released in a while" and I figured this one
deserved a bit of showing off.

## Install and Uninstall Bundles

You can now make a bundle, install it, then burn it to the ground all through
porter. No need to fall back to using duffle anymore! 🎉

I am working hard to implement more commands so that you can do everything from
porter.

## Proper Templating

Jeremy has heard your request for templating and delivered! You can use
[Mustache][mustache] template syntax in the manifest.

Anywhere you were previously using 

```yaml
something:
  source: bundle.parameters.foo
```

you can now use

```yaml
something: "{{ bundle.parameters.foo }}"
```

You may have noticed the extra quotes, that's YAML for you. It's extra
motivation for us to add support for more markup languages. 😉

## Mixin Install Command and Mixin Feeds

The core of Porter are mixins and pretty soon there are going to be A LOT. I
have been working on adding mixin distribution functionality to Porter to make
it easier to find and manage mixins.

The first step is installing them (upgrade, and uninstall coming soon).

```console
$ porter mixin install kubernetes --feed-url https://cdn.deislabs.io/porter/atom.xml
installed kubernetes mixin
kubernetes mixin v0.5.0-ralpha.1+elderflowerspritz (851458b)
```

For the moment, all of our mixins are available from a single Atom feed but you
could also install a mixin that someone from the community created
and uploaded to their repository's Github releases.

I'm also working on subscriptions so that you can subscribe to a feed and stay
up to date with a set of mixins, such as the ones that come with Porter by default.

## Kubernetes Mixin

We have a Kubernetes mixin now! Just point it at your wonderful YAML-filled
manifests, and it will handle running them in your bundle.

The docs are a wee bit missing and you should tease Jeremy unmercifully about
that. But until then, here's an [example][k8s-example] of how to use it.

You can install the mixin with the following command:

```
porter mixin install kubernetes --feed-url https://cdn.deislabs.io/porter/atom.xml
```

## Terraform Mixin

ZOMG! Our first mixin contributed from the community! A huge thank you to [Josh
Dolitsky](https://twitter.com/jdolitsky) for making this happen, and to Vaughn
for adding the finishing touches to get it release ready.

We have two real world [examples][terraform-examples demonstrating how to use
the mixin with AKS and KeyVault.

You can install the mixin with the following command:

```
porter mixin install terraform --feed-url https://cdn.deislabs.io/porter/atom.xml
```

## Reorganized Commands and Help Text

## Mask Sensitive Values

## Smart --debug Flag

## Improved Install Script

[release]: https://github.com/deislabs/porter/releases/tag/v0.5.0-ralpha.1%2Belderflowerspritz
[porter]: https://porter.sh
[cnab]: https://cnab.io
[releases]: https://porter.sh/faq/#how-does-your-release-naming-scheme-work
[mustache]: https://mustache.github.io
[k8s-example]:
https://github.com/deislabs/porter/blob/master/pkg/kubernetes/testdata/install-input.yaml
[terraform-examples]: https://github.com/deislabs/porter-terraform/tree/master/examples
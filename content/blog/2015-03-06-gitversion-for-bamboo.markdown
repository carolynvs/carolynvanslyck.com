---
categories: atlassian bamboo git
comments: true
date: "2015-03-06T00:00:00Z"
title: GitVersion for Bamboo
slug: gitversion-for-bamboo
---

<img src="/images/gitversion/logo.png" style="float: right; margin: 5px" />

I have just released a plugin for Atlassian Bamboo which integrates with GitVersion: [GitVersion for Bamboo](/projects/gitversion). Check out the link for info on how to install and configure the plugin.

GitVersion is a tool which automates generating unique, [semantic versions](http://semver.org/). It detects your branching pattern and uses your tags to generate a repeatable version number which you can then use to stamp assemblies, version NuGet packages, etc.

What I like about GitVersion is the flexibility it provides. Instead of generating a single version number, "take it or leave it", GitVersion provides over a dozen variables that you can choose from to build your own version number. If you are lucky and can just use pure semver, great!, use the FullSemVer variable and call it a day. However if you are perhaps like me, working on a legacy code base with an existing versioning scheme, it's still incredibly useful.

Here is the output of running gitversion.exe from my repository:

    {
      "Major":1,
      "Minor":3,
      "Patch":4,
      "PreReleaseTag":"bamboo",
      "PreReleaseTagWithDash":"-bamboo",
      "BuildMetaData":61,
      "FullBuildMetaData":"61.Branch.feature/bamboo.Sha.3474397158a37e9b9525345d8205d1e4f8eca06a",
      "MajorMinorPatch":"1.3.4",
      "SemVer":"1.3.4-bamboo",
      "LegacySemVer":"1.3.4-bamboo",
      "LegacySemVerPadded":"1.3.4-bamboo",
      "AssemblySemVer":"1.3.4.0",
      "AssemblyFileSemVer":"1.3.4.0",
      "FullSemVer":"1.3.4-bamboo+61",
      "InformationalVersion":"1.3.4-bamboo+61.Branch.feature/bamboo.Sha.3474397158a37e9b9525345d8205d1e4f8eca06a",
      "ClassicVersion":"1.3.4.61",
      "ClassicVersionWithTag":"1.3.4.61-bamboo",
      "BranchName":"feature/bamboo",
      "Sha":"3474397158a37e9b9525345d8205d1e4f8eca06a",
      "NuGetVersionV2":"1.3.4-bamboo",
      "NuGetVersion":"1.3.4-bamboo"
    }

At work we are (still!) [transioning from svn to git](blog/2014/02/migrating-from-svn-to-git/). Previously we would use the svn revision as the 4th part of our version number, e.g. 1.0.0.{svn rev}. With git that's not available as we just have a commit hash which doens't fit the bill. So we are using GitVersion to generate just the last number for us by using the BuildMetadata variable. BuildMetadata represents the number of commits on a branch since the last release tag. So if when we started working on v15.2.0, the first commit is tagged and each new commit will result in a unique, increasing version number: first commit = 15.2.0.0, second commit = 15.2.0.1 ...

Is that a good idea? Shouldn't we have simply jumped onto the semver bandwagon? Probably. However sometimes things are beyond a peon's control and it's nice that I don't have to boil the ocean just to get a number.

---
layout: page
title: GitVersion for Bamboo
comments: false
sharing: false
sidebar: false
footer: true
---

<img src="/images/gitversion/logo.png" style="float: right; margin: 5px" />

* [Download the latest version from Atlassian Marketplace](https://marketplace.atlassian.com/plugins/com.carolynvs.gitversion)
* [View the Source Code](http://stash.carolynvanslyck.com/projects/BAM/repos/gitversion)
* [Report a bug or request a feature](http://jira.carolynvanslyck.com/browse/GITVER)

GitVersion for Bamboo is a plugin which integrates [GitVersion](http://particularlabs.github.io/GitVersion/) with Atlassian Bamboo. This gives you a couple benefits over using the tool directly in your build scripts:

* Every GitVersion generated value is persisted in the Bamboo build metadata and can be used at any point in the build.
* Seamlessly transfers a version number from the build to a deployment, enabling you to use the version number for your releases without relying on Bamboo build number.
* If you have builds on multiple platforms, you can use GitVersion to generate a version number on a Windows build agent and the value is available to your MacOS and Linux build agents.

<aside>[GitVersion](http://particularlabs.github.io/GitVersion/) is a tool which automates generating unique, [semantic versions](http://semver.org/). It detects your branching pattern and uses your tags to generate a repeatable version number which you can then use to stamp assemblies, version NuGet packages, etc.</aside>

##Quick Start

1. Install GitVersion on your build agent(s). `choco install gitversion.portable`
2. Install the [GitVersion plugin](https://marketplace.atlassian.com/plugins/com.carolynvs.gitversion) on your Bamboo master.
3. From the Bamboo Administration page, select System Capabilities and click the "Detect Capabilities" button.
4. In a Bamboo plan, edit your tasks and insert the GitVersion task after your Source Code Checkout task. ![image](/images/gitversion/task-definition.png)
5. Optionally configure the task to only extract specific GitVersion variables, or pass additional command-line arguments. For example, if you are building a .NET project, you may want to pass `/UpdateAssemblyInfo` to automatically stamp your assemblies with the generated version.
5. Run a build and when it completes, go to the results of the job which contains the GitVersion task. On the Metadata tab you will see all the new variables available to you to use. ![image](/images/gitversion/job-metadata.png)

##Version Deployments
1. In your deployment project, edit the Release Versioning
2. Enter the GitVersion variable you would like to use: ${bamboo.GitVersion.SemVer} or 1.0.0.${bamboo.GitVersion.BuildMetadata} ![image](/images/gitversion/release-versioning.png)
3. Create a new release and verify that it is using your new versioning scheme.

##Use GitVersion with Linux/Mac Builds
1. Add a Windows build agent to your Bamboo installation
2. Install GitVersion on the agent
3. Add GitVersion as a capability to the agent in Bamboo
4. In your plan, add a job which calls the GitVersion task

Now when Bamboo executes your plan, it will first run that job on the Windows agent, generating a number and saving the metadata in the plan results. Your plan then continues executing as normal on the other build agents. Subsequent jobs and deployments can then access the GitVersion variables.

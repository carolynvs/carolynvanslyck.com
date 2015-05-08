---
layout: post
title: A Better Force Clean Checkout in Bamboo
date: 2015-05-07
comments: true
categories: bamboo
---

Recently, I was asked for help to alter one of our builds to "run dirty". They use npm and were incurring a significant cost by starting with a fresh checkout on every build. By leaving the node_modules diretory around between builds, it would shave 4 minutes off the build time.

While I could have simply unchecked "Force Clean Checkout" on our Source Code Checkout task in Bamboo, that would have made dealing with the occasional need to do a clean build a bit awkward. In order to do a clean build, someone would have to:

1. Have admin rights on the plan
2. Edit the definition to check "Force Clean Checkout"
3. Run a build
4. Then (hopefully) remember flip it back again. 

A bit clunky... plus it would affect all builds, not just the single branch that needed the clean build.

<aside>
Actually I never use the "Force Clean Checkout" option because what that does is remove the entire repository, then do a fresh clone. Instead all my builds run git clean after the Source Code Checkout task.
</aside>

What I wanted was a push button method for someone with build rights to force a clean build on a single branch. Here's how it works:

1. Add a plan variable, force_clean, with a value of false. 

   ![image](/images/bamboo-force-clean-checkout/force-clean-variable.png)
   
2. Add a Script task before the Source Code Checkout task. 
   In it, check if force_clean = true, then clean the working directory.
   
   ![image](/images/bamboo-force-clean-checkout/force-clean-task.png)

3. Now to force a clean build, use "Run Customized..." and override force_clean to true! Simple.

   ![image](/images/bamboo-force-clean-checkout/run-customized.png)

   ![image](/images/bamboo-force-clean-checkout/override-force-clean.png)

<aside>
I also use this to workaround a limitation in Bamboo, where new tags are not picked up in a build without a fresh clone. *Shakes fist at the Atlassian Overlords*<br/><br/>
Since [some of my builds rely upon tags to generate a version number](/blog/2015/03/gitversion-for-bamboo/), I use this force clean trick to remove the source directory before the Source Code Checkout task. That way when we need to pickup a new tag, we just force a clean build.
</aside>

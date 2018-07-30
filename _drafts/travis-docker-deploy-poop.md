---
layout: post
title: Travis Docker Permission Hell
description:
#date: 2017-08-18
comments: false
categories:
  - docker
---

if you are running rando docker commands in your travis build,
you may end up with files created in your build dir that you don't have permission to.

The fix is to run your docker command with -u $UID, so that the docker build runs as Travis (or the current user). Alternatively,

before_deploy: sudo chown -R travis:travis /home/travis/

---
layout: post
title: Deploy to gh-pages with Travis
description:
#date: 2017-08-18
comments: false
---

* generate key
* add deploy key (public)
* run travis cli in docker

docker run --rm -it -v `pwd`:`pwd` -w `pwd` \
  --entrypoint="sh" jess/travis \
  -c "travis login --github-token=$GITHUB_TOKEN && \
  travis encrypt-file scripts/travis.deploy.pem scripts/travis.deploy.pem.enc --add"

* encrypt private key
* save both keys to your repo

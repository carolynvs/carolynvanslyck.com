---
categories:
- git
comments: true
date: "2017-02-14T00:00:00Z"
title: Set the line endings for all files in a directory
---

The Git for Windows installer often leads people to turn on AutoCRLF, an
occasionally useful feature that can also cause a ton of trouble. Luckily,
you aren't at the mercy of whatever settings a developer may have when
contributing to your project. You can force git to do things your way by
adding a `.gitattributes` file to your repository.

This all started when Windows users with AutoCRLF enabled ran the test suite,
tests would fail because the files containing expected values were helpfully
modified by AutoCRLF to use CRLF instead of LF. It was difficult to troubleshoot
because the test's console output looked fine
`expected value: foo actual value: foo`.

The solution was to setup a `.gitattributes` file at the root of the repo. This
allowed me to override a developer's AutoCRLF setting and specify that all
files in my `testdata/` directories should use LF. It can be a bit tricky
because patterns which work in `.gitignore`, like `testdata/*` don't work
the same when used in `.gitattributes`.

Here's the magic pattern to use LF as the line ending for all files in a `testdata/` directory, whether
at the root of the repo, or nested in subdirectories:

```
**/testdata/** text eol=lf
```

The leading `**` applies the test pattern at both the root and subdirectories,
while the trailing `**` ensures that directories nested under `testdata/` also
match. So this pattern forces LF for the following paths:

```
/testdata/kittens.json
/testdata/stuff/things.go
/util/testdata/puppies.json
/util/testdata/foo/bar.js
```

---
categories: null
comments: true
date: "2012-12-11T00:00:00Z"
title: Knockout Observables
---

<p>I sometimes run into a bug where can't figure out why Knockout is changing the value of my variables. After digging around, it always is caused by me passing an object in the constructor when newing up an observable or changing its value. When setting the value of an observable or observableArray, remember that if you pass it an array, date or object, when your observable is changed, the value of your variable will also be changed.</p>

<p>If you don't want that to happen, pass a copy of your variable.</p>

<script src="https://gist.github.com/4264028.js"></script>

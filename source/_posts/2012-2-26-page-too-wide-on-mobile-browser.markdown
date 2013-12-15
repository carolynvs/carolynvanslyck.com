---
layout: post
title: "Why is my web page is too wide in a mobile phone browser?"
date: 2012-2-26
comments: true
categories: 
---
<p>I don't know why the scrollbars don't show up in any other browser but in
    a mobile browser the phone zooms out much too far by default. However
    you can easily fix it by adding the following tag to your page header.</p>
<pre><code>&lt;meta name="viewport" content="width=device-width, initial-scale=1.0;" /&gt;</code></pre>
<p>Here is a full sample:</p>

<pre><code>&lt;!DOCTYPE HTML&gt;
&lt;html&gt;
&lt;head&gt;
  &lt;title&gt;I love titles!&lt;/title&gt;
  <strong>&lt;meta name="viewport" content="width=device-width, initial-scale=1.0;" /&gt;</strong>
&lt;/head&gt;
&lt;body&gt;
  ...
&lt;/body&gt;
&lt;/html&gt;</code></pre>
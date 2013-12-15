---
layout: post
title: "Why is my web page is too wide in a mobile phone browser?"
date: 2012-2-26
comments: true
categories: 
---
I don't know why the scrollbars don't show up in any other browser but in a mobile browser
the phone zooms out much too far by default. However you can easily fix it by adding the 
following tag to your page header.

    <meta name="viewport" content="width=device-width, initial-scale=1.0;" />

Here is a full sample:

    <!DOCTYPE HTML>
    <html>
      <head>
        <title>I love titles!</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0;" />
      </head>
    <body>
      ...
    </body>
    </html>
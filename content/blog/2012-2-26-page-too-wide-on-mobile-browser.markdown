---
categories: null
comments: true
date: "2012-02-26T00:00:00Z"
title: Why is my web page is too wide in a mobile phone browser?
slug: page-too-wide-on-mobile-browser
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

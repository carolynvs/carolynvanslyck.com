---
categories: null
comments: true
date: "2013-01-17T00:00:00Z"
title: Using both HTTP and HTTPS in ASP.NET MVC
slug: mixing-http-https-in-mvc
---

<p>I recently added a secured payment page to my MVC site using the <a href="http://msdn.microsoft.com/en-us/library/system.web.mvc.requirehttpsattribute%28v=vs.108%29.aspx">RequireHttps</a> attribute and quickly noticed that once the user went to the page, all other pages were now being served up via https as well. I prefer to only use https when necessary and wanted the user to be redirected back to http for any pages that didn't require https.</p>

<p>Below is the code for my RequireHttp attribute. It can be placed on either a controller or action and will redirect from https to http when necessary.</p>

<script src="https://gist.github.com/4558181.js"></script>

---
categories: null
comments: true
date: "2013-01-03T00:00:00Z"
title: Mixing REST and RPC style methods on an ASP.NET Web API Controller
slug: webapi-mixed-rest-rpc-routing
---

<p>I wanted to have an API controller that had the normal RESTful actions (Get/Put/Post/Delete) and also some RPC style actions. This used to work in the MVC 4 Beta but now in RTM I would get the following error <i>"Multiple actions were found that match the request: Get() on type CarController and Blue() on type CarController"</i>.</p>

<p>While I can understand that Microsoft is trying to encourage RESTful web services, it doesn't seem too farfetched to want simple filter methods on top of a normally RESTful controller. Since I didn't want to split my RPC style actions into a separate controller... a workaround had to be found! There is an <a href="http://aspnetwebstack.codeplex.com/workitem/184">open work item</a> that may eventually make it back into the next release. In the meantime I found this <a href="http://stackoverflow.com/a/11253940/808818">StackOverflow answer</a> and modified to get it working for the following routes:</p>

<ul>
    <li><b>/api/car</b> (GET all cars)</li>
    <li><b>/api/car/blue</b> (GET all blue cars)</li>
    <li><b>/api/car/15</b> (GET/POST/DELETE a specific car)</li>
</ul>

<p>Here is a sample RouteConfig that will allow you to mix REST style actions with RPC style actions on the same controller.</p>
<script src="https://gist.github.com/4444243.js"></script>

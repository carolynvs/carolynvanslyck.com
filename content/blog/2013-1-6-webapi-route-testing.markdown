---
categories: null
comments: true
date: "2013-01-06T00:00:00Z"
title: Unit testing your ASP.NET Web API routes
---

<p>When your API is purely RESTful, your routes are pretty simple and there isn't much need to test. But if you are like me and decided to <a href="webapi_mixed_rest_rpc_routing.html">mix RPC and RESTful style methods on the same controller</a>, then some tests are in order.</p>

<p>I had been using the RouteTestingExtensions from <a href="http://mvccontrib.codeplex.com/">MvcContrib</a> to test my MVC routes. It allows you to assert that a URL was routed to the expected controller and action. I modified it to work with Web API routes and contributed it to the sister project, <a href="http://github.com/WebApiContrib/WebAPIContrib">WebApiContrib</a>. The package, <a href="http://nuget.org/packages/WebApiContrib.Testing">WebApiContrib.Testing</a> is available via NuGet.

<p>Below is an example of how to use this extension method to validate your url:</p>
<script src="https://gist.github.com/4471039.js"></script>
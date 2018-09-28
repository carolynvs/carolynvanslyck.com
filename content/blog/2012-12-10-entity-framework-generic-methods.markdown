---
categories: null
comments: true
date: "2012-12-10T00:00:00Z"
title: Using Generic Methods in Entity Framework Queries
---

<p>Many of my models have a common property that I wanted to use in Entity Framework queries. After creating a generic method to encapsulate the filter logic, everything compiled but at runtime I ran into the following error:</p>
<p style="font-style: italic">
    Unable to cast the type 'FooBar' to type 'IFooBar'. LINQ to Entities only supports casting EDM primitive or enumeration types.
</p>
<p>Thanks to <a href="http://stackoverflow.com/questions/13700505/where-is-the-cast-here-linq-to-entities-only-supports-casting-entity-data-model">this StackOverflow post</a>, I found the solution. When specifying the constraints on your generic parameter, include "class" as the first constraint. Success!</p>

<script src="https://gist.github.com/4255487.js?file=EntityFrameworkGenericMethod.cs"></script>
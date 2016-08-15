---
layout: post
title: "Working with DateTime in ASP.NET Web API"
date: 2012-8-13
comments: true
categories: 
---
<p>I was writing a website that tracked and displayed timestamps, and I only cared about what the time was on the client's machine. 
    The server or database time was irrelevant. This seemed easy, just generate the timestamps on the client and I was all set, right? Wrong!</p>

<h3>Client: JavaScript</h3>
<p>I was first convinced by old StackOverflow answers to use a Date utility instead of the built in Date constructor in JavaScript. 
    That was completely unnecessary since I was working with <a href="http://en.wikipedia.org/wiki/ISO_8601">ISO 8601</a> dates 
    which are now supported in all the major browsers. Most of my parsing errors went away when I moved to simply calling 
    new Date('2012-08-13T22:57:24.716Z'). I also made sure when sending timestamps in my requests to call 
    <a href="http://www.w3schools.com/jsref/jsref_toisostring.asp">toISOString()</a> on the date object first. Now I am always 
    sending UTC dates to my sever, instead of local dates.</p>

<h3>Server: Web API</h3>
<p>I'm using ASP.NET Web API RC (which comes with MVC 4). I found that when the timestamps were passed into my actions, the UTC 
    date had been helpfully converted into a DateTime which was in my server's local time. Gee, thanks... 
    Note to self, call <a href="http://msdn.microsoft.com/en-us/library/system.datetime.touniversaltime.aspx">ToUniversalTime()</a>
    on my incoming DateTime objects. I also made sure that I was never using DateTime.Now and instead used DateTime.UtcNow 
    if I needed to generate a timestamp on the server.</p>

<h3>Database: Entity Framework</h3>
<p>So I was saving my UTC DateTime values in SQL Server successfully but when reading the values out (using Entity Framework code first), 
    the DateTime's were no longer UTC and instead were coming out with a DateTimeKind of Unspecified, which when serialized to JSON and 
    sent back to the client is treated as a local time. To fix this, you can simply call 
    <a href="http://msdn.microsoft.com/en-us/library/system.datetime.specifykind.aspx">DateTime.SpecifyKind</a>(timestamp, DateTimeKind.Utc) 
    for any timestamps read from the database.</p>

<p>Since my model had timestamps everywhere, I simplified things by forcing all my timestamps to be read from and written to the database as 
UTC in a single location. To do this I modified my DbContext to identify any DateTime properties on the model and set the DateTime to UTC 
if the DateTimeKind is Local or Unspecified.
<script src="https://gist.github.com/3344800.js?file=AutoConvertToUtcDataContext.cs"></script>

<p>Here's a generic converter that I'm using in my DbContext to handle the UTC conversions. It can identify a DateTime?
or DateTime property on your model, caches the reflected type information and automatically converts all DateTime properties to UTC.</p>
<script src="https://gist.github.com/3344800.js?file=Carolynvs.UtcDateTimeConverter.cs"></script>

<p>I am makings use of 2 extension methods on the Object type, Get and Set which allows me to dynamically get and set values on my model.</p>
<script src="https://gist.github.com/3344755.js?file=Carolynvs.ObjectExtensions.cs"></script>
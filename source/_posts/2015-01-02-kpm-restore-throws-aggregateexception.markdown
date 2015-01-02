---
layout: post
title: "KPM Restore Throws AggregateException"
date: 2015-01-02 11:32
comments: true
categories: vnext
---

While I was migrating a legacy codebase from .NET 4.5 to vNext (.NET 5), I started getting this error when restoring my dependencies via `kpm restore` or building inside VS 2015.

    System.AggregateException: One or more errors occurred. ---> System.NullReferenceException: Object reference not set to an instance of an object. 
    at Microsoft.Framework.PackageManager.Restore.NuGet.PackageFeed.<OpenNuspecStreamAsync>d__1.MoveNext()
    
    
Turns out there was a trailing space after one of my dependencies, e.g. 

    {
      "dependencies": {
        "Microsoft.AspNet.Mvc ": "4.0.0.0"
      }
    }
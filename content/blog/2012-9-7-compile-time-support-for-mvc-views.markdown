---
categories: null
comments: true
date: "2012-09-07T00:00:00Z"
title: How to get compile-time checking of ASP.NET MVC views
---

<h2>The Backstory</h2>
<p>
    When I first got started with ASP.NET MVC, I immediately noticed that my views were not checked for errors at compile time.
    The thought of random runtime errors in my views was unacceptable! A bit of searching turned up the BuildMvcViews project
    flag. Simply unload your MVC project, open the csproj file and switch BuildMvcViews to true. Reload your project and
    now you views will have a test compilation performed during each build. If life were that simple, I wouldn't be writing about it...
</p>
<p>
    After a while, I noticed that my build times were terribly slow, about 30 seconds for a small, 4 project solution.
    After turning on detailed build output, I saw that the BuilMvcViews task was taking 24 seconds!
</p>
<p>
    I then stumbled upon Razor Generator. It is a VS extension + nuget package that compiles your views to code when you save and
    instructs ASP.NET to use the precompiled view instead of dynamically building one from the cshtml at runtime. Now all of my views
    were compiled to code which seemed quite nice. The build was lightning fast again and I had my compile-time support. It will even
    check if your view has been updated since being compiled and optionally serve up the new dynamic view. That is incredibly helpful as
    it allows you to edit the view while debugging and without rebuilding.
</p>

<h2>The Solution</h2>
<ol>
    <li>Install the <a href="http://razorgenerator.codeplex.com/">Razor Generator</a> Visual Studio extension</li>
    <li>Install the RazorGenerator.Mvc nuget package to your MVC project.</li>
    <li>Convert all your views to use the RazorGenerator. Use the Package Manager Console command
        "Enable-RazorGenerator" to set the CustomTool to "RazorGenerator" for every view in your project.</li>
    <li>Note that the RazorGenerator.Mvc package added a new file to your App_Start folder, RazorGeneratorMvcStart. This class
        instructs ASP.NET to use the precompiled views unless the cshtml file is has been changed. In production this flag will be
        false (since the requests aren't local) so you won't have a performance hit doing file timestamp comparisons.
    </li>
</ol>

<p>
    If motivated, one could change their production deployment to exclude the cshtml files, since the views are compiled into your assemblies. That would keep the deployment small and slightly improve performance since all the views are precompiled.
</p>

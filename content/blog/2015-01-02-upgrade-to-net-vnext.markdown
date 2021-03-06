---
categories: dotnet vnext
comments: true
date: "2015-01-02T00:00:00Z"
title: Upgrade to .NET vNext
slug: upgrade-to-net-vnext
---

While I have read informal comments from the .NET developers that vNext is intended for new development, I really wanted to upgrade [BytesForHealth](http://bytesforhealth.com) to .NET vNext (.NET 5).

<aside>This is just my first step towards migrating, I'm sticking with the .NET Framework and am not making changes to work with .NET Core. Once I get this working, I'll start refactoring to only use Core packages.</aside>

Here are some of the steps I took to upgrade:

<ol>

  <li>Install Visual Studio 2015 Preview.</li>

  <li><a href="https://github.com/aspnet/Home#install-the-k-version-manager-kvm">Install KVM</a>.
    <br />
    <pre><code class="list-code">iex ((new-object net.webclient).DownloadString('https://raw.githubusercontent.com/aspnet/Home/master/kvminstall.ps1')"</code></pre></li>

  <li>Verify that you are using at least the beta of KPM: <code>kpm --version</code> should return <code>1.0.0-beta1-10662</code>. If not run <code>kvm upgrade</code> to get the latest KRE and then <code>kvm use 1.0.0-beta1 -x86 -r CLR -p</code> to set it as the active version.</li>

  <li>Open Visual Studio and create a ASP.NET Class Library (vnext) project. Take that kproj file and copy it into your each of your project directories, name it after the project and if you like overkill, update the project's guid to match the original in the csproj. Now edit your solution file and tweak the project reference to use the kproj file instead of the csproj file and update the project type guids from FAE04EC0-301F-11D3-BF4B-00C04F79EFBC to 8BB2217D-0F2D-49D1-97BC-3654ED321F3B.</li>

  <li>Rename packages.config to <a href="https://github.com/aspnet/Home/wiki/Project.json-file">project.json</a>. Add <code>{ "dependencies": {</code> at the top and using some creative find/replace, alter your packages xml to the new json format.
  <br/>
  <b>Before</b>
  <pre><code>&lt;?xml version="1.0" encoding="utf-8"?&gt;
&lt;packages&gt;
    &lt;package id="AutoMapper" version="2.2.1" targetFramework="net45" /&gt;
    &lt;package id="Microsoft.AspNet.Mvc" version="4.0.20710.0" targetFramework="net45" /&gt;
&lt;/packages&gt;
</code></pre>
<br/>
<b>After</b><pre><code>{
  "dependencies": {
    "AutoMapper": "2.2.1",
    "Microsoft.AspNet.Mvc": "4.0.20710.0"
  }
}</code></pre></li>

<li>Using your original csproj, find .NET Framework references (e.g. System.Web, or just look for anything without a packages hintpath), and add them to the frameworkassemblies section in project.json.

<br/>
<pre><code>{
  "dependencies": {
    "AutoMapper": "2.2.1",
      "Microsoft.AspNet.Mvc": "4.0.20710.0"
  },
  "frameworks": {
    "net45": {
      "frameworkAssemblies": {
        "System.Web": "4.0.0.0"
      }
    }
  }
}
</code></pre></li>

<li>Using your original csproj file, find project references and add them as dependencies in your project.json file. The name of the dependency will be the name of the project. For example if ProjectA references ProjectB, then it should have the following line in its project.json dependencies section <code>"ProjectB": ""</code>.
<li>Delete your old csproj files.</li>
<li>If all of your source code is in a single directory and at the same level, i.e. not nested, then you can skip this next step. Otherwise you will need to add a global.json to the root of your solution. In order for projects to reference each other when they are not in the same directory, add a hint path for where the projects can be found.
<br/>
<pre><code>{
  "sources": ["Src", "Src/ReallyAwesomeStuff", "RandomDir"]
}</code></pre>
</ol>

You should now be able to build your solution using Visual Studio. You can build individual projects by first running `kpm restore` in the soluiton directory, then by running `kpm build` from within each project directory. If it builds with Visual Studio but not via the command line, review step 3 and make sure you are using the latest version of the KRE.

<aside>
To learn more about building outside of Visual Studio, check out [Building future .NET projects is quite pleasant](http://blog.maartenballiauw.be/post/2014/12/19/Building-future-NET-projects-is-quite-pleasant.aspx) for a breakdown of what the builds currently look like for some of Microsoft's projects on GitHub. It's not quite clear yet if [sake](https://github.com/sakeproject/sake) is going to be the recommended build tool for all .NET projects or if it's only an internal tool; there's very little documentation and guidance at this point and I've seen [musings about open-sourcing msbuild](http://forums.dotnetfoundation.org/t/compiling-net-core-code-on-linux-os-x/302/6)... so things are still up in the air.
</aside>

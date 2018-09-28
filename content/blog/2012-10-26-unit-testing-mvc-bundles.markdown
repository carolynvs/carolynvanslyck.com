---
categories: null
comments: true
date: "2012-10-26T00:00:00Z"
title: Unit Testing ASP.NET MVC Bundles
---

<p>In order to unit test your bundles you must assign <b>BundleTable.MapPathMethod</b> to a function which mocks mapping from the bundle item's virtual path to the physical path of the file. I created a simple method (see MapBundleItemPath below) that uses a hard-coded string to find the root physical path of the MVC project. If your tests are run on multiple environments, you should replace the implementation to dynamically discover the project's path.</p>

<p>There is one "catchall" test which validates that all bundles registered in my BundleTable have at least one file. This is helpful because it will catch major problems with any registered bundle, even if you didn't explicitly write a test for the bundle.</p>

<p>I prefer to also have a test per bundle because when a bundle item virtual path doesn't resolve to a valid physical file, the bundle silently ignores the error. This means that when you move a file, you can easily break a bundle and not realize it until you are testing your application in the web browser.</p>

<script src="https://gist.github.com/3961521.js?file=BundleConfigFixture.cs"></script>

<h4>Caveats</h4>
<p>I am not testing the dependency order of my files and am assuming that I don't have duplicate file names in a bundle (e.g. path1/common.js and path2/common.js in the same bundle). You may want to tweak how you validate the contents of your bundles if you have to deal with more complex scenarios.</p>

<h2>Best Practice</h2>
<p>While not necessary to unit test your bundles, I recommend creating a static class containing all of your bundles so that you can safely reference them in your views without using hard-coded strings. </p>
<script src="https://gist.github.com/3961521.js?file=Bundles.cs"></script>
<script src="https://gist.github.com/3961521.js?file=BundleConfig.cs"></script>
<script src="https://gist.github.com/3961521.js?file=_Layout.cshtml"></script>
---
layout: post
title: "How do I make Google Analytics ignore my traffic?"
date: 2012-2-26
comments: true
categories: 
---
<p>
    Originally I tried having Google ignore my IP address but since it does 
        change from time to time and I also enjoy checking my site at work too... I 
        needed something more robust. When you only get a handful of visitors a 
        week, it is important to not have your own traffic skewing the reports!
</p>
<p>
    After setting up your special page and tweaking your Google Analytics settings, whenever you want to view your 
        website, go first to this special web page and then all of your traffic will 
        be excluded from your reports.
</p>

<ol>
    <li>Add a page to your site that isn't linked to from anywhere and update your robots.txt to disallow that page. In this example created a page named nogoogle.html at the root of my site.

<pre><code>User-agent: *
<strong>Disallow: /nogoogle.html</strong>
Allow: /</code></pre>

    </li>
    <li>Add the following script to the header of your page and replace UA-XXXXXXX-X with your own Google Analytics code.
            <pre><code>&lt;script&gt;
var _gaq = _gaq || [];
_gaq.push(['_setAccount', '<strong>UA-XXXXXXX-X</strong>']);
_gaq.push(['_setVar','test_value']);
_gaq.push(['_trackPageview']);

(function() {
var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();
&lt;/script&gt;
</code></pre>

    </li>
    <li>Now in your Google Analytics report settings page, add a Custom Filter to exclude any traffic that has this special cookie.
            <pre><code>Name of Filter: Exclude me
Filter Type: Custom filter &gt; Exclude 
Filter Field: User Defined
Filter Pattern: test_value
Case Sensitive: No
</code></pre>
        <img src="{{root_url}}/blog/images/google_analytics_ignore_your_traffic.png" alt="Exclude User Defined with a Filter Pattern of test_value" /></li>
    <li>If you develop your site locally, you will need one more filter to exclude traffic to your development web server. Replace "localhost" with the name of the development server.
            <pre><code>Name of Filter: Exclude Localhost
Filter Type: Custom filter &gt; Exclude 
Filter Field: Hostname
Filter Pattern: localhost
Case Sensitive: No
</code></pre>
        <img src="{{root_url}}/blog/images/google_analytics_ignore_localhost.png" alt="Exclude Hostname with a Filter Pattern of localhost" />
    </li>
</ol>
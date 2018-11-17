---
categories: null
comments: true
date: "2012-02-26T00:00:00Z"
title: How do I make Google Analytics ignore my traffic?
slug: google-analytics-ignore-your-traffic
---

Originally I tried having Google ignore my IP address but since it does
change from time to time and I also enjoy checking my site at work too... I
needed something more robust. When you only get a handful of visitors a
week, it is important to not have your own traffic skewing the reports!

After setting up your special page and tweaking your Google Analytics settings, whenever you want to view your
website, go first to this special web page and then all of your traffic will
be excluded from your reports.

1. Add a page to your site that isn't linked to from anywhere and update your robots.txt to disallow that page. In this example created a page named nogoogle.html at the root of my site.

        User-agent: *
        Disallow: /nogoogle.html
        Allow: /

2. Add the following script to the header of your page and replace UA-XXXXXXX-X with your own Google Analytics code.

        <script>
            var _gaq = _gaq || [];
            _gaq.push(['_setAccount', '<strong>UA-XXXXXXX-X</strong>']);
            _gaq.push(['_setVar','test_value']);
            _gaq.push(['_trackPageview']);

            (function() {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
            })();
        </script>

3. Now in your Google Analytics report settings page, add a Custom Filter to exclude any traffic that has this special cookie.
<img src="/images/google_analytics_ignore_your_traffic.png" alt="Exclude User Defined with a Filter Pattern of test_value" />

            Name of Filter: Exclude me
            Filter Type: Custom filter > Exclude
            Filter Field: User Defined
            Filter Pattern: test_value
            Case Sensitive: No

4. If you develop your site locally, you will need one more filter to exclude traffic to your development web server. Replace "localhost" with the name of the development server.
<img src="/images/google_analytics_ignore_localhost.png" alt="Exclude Hostname with a Filter Pattern of localhost" />

        Name of Filter: Exclude Localhost
        Filter Type: Custom filter > Exclude
        Filter Field: Hostname
        Filter Pattern: localhost
        Case Sensitive: No

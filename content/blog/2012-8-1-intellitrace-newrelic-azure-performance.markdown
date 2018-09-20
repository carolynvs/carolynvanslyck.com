---
categories: null
comments: true
date: "2012-08-01T00:00:00Z"
title: Intellitrace, New Relic and Windows Azure
---

<p>I recently discovered Intellitrace and think it's the bee's knees. It was especially helpful
    debugging issues on Windows Azure. Since I couldn't attach a debugger to my site, and it was
    working fine on my development machine, being able to view errors and other information
    (that Elmah wasn't pickup up) seemed like a huge win. So I decided to leave Intellitrace
    enabled on my web role and moved on with my life.</p>
<p>Fast forward to last week when I learned that New Relic standard edition is free for Azure users.
    SIGN ME UP! I had been having performance problems lately that I couldn't pin-point and New Relic
    was just the right tool to figure them out. But I couldn't get it working, for DAYS. Not my finest moment...
    After working with New Relic tech support, I learned that you can't have Intellitrace and New Relic
    running at the same time. So Intellitrace was "winning" and I wasn't receiving any data on New Relic.</p>
<p>Problem solved right? Even more than I realized. After disabling Intellitrace, not only did New Relic
    start working (like a charm) but my app performance increased 5x. Pages that would take 5-6s went
    down to 800ms - 1.3s. I had previously looked at CPU and memory usage on my instance and a single
    page request would spike the CPU to 100% and memory usage was almost maxed out. Now a page would
    spike to 10% CPU and memory is comfortably at 50%. I may even try downgrading from a Small to Extra Small instance just for kicks. :)</p>
<p>Lessons learned?</p>
<ul>
    <li>Only turn on Intellitrace on development and staging.</li>
    <li>If you swap staging and production, make sure to disable Intellitrace before swapping.</li>
    <li>Pay attention to the level of tracing you have turned on in your Azure project settings.</li>
    <li>New Relic doesn't work with Intellitrace enabled...</li>
</ul>

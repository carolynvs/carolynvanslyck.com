---
layout: page
title: "Projects"
comments: false
sharing: false
sidebar: false
footer: true
---

<p class="center">
    <a href="https://github.com/carolynvs">My open-source projects</a> are available on GitHub.
</p>
<div class="projects">
    <div class="project">
        <div class="title">
            <a href="http://bytesforhealth.com">
                <img src="{{root_url}}/images/bytesforhealth.png" alt="Bytes for Health" title="Bytes for Health"/>
                Bytes for Health
            </a>
        </div>
        <div class="technologies">C#, ASP.NET MVC4, Web Api, Azure, Entity Framework, JavaScript, jQuery,
            Knockout</div>
        <p class="description">Customizable nutrition journal. Uses the USDA nutrition database and user submitted
            foods. Allows the user to customize which nutrients and additional statistics they
            wish to track and generate reports.</p>
    </div>
    <div class="project">
        <div class="title">
            <a href="https://github.com/carolynvs/nutritionix">
                <img src="{{root_url}}/images/nutritionix.png" alt="Nutritionix Logo" title="Nutritionix API .NET Client"/>
                Nutritionix API .NET Client
            </a>
        </div>
        <div class="technologies">C#, REST</div>
        <p class="description"><a href="http://nutritionix.com">Nutritionix</a> is one of the nutrition data sources for Bytes for Health. This is the .NET client library I wrote for their API.</p>
    </div>
    <div class="project">
        <div class="title">
            <a href="https://bitbucket.org/carolynvs/reject-merge-commit-hook">
                <img src="{{root_url}}/images/reject-merge-commit-hook.png" alt="Merge Sign" title="Reject Merge Commit Hook"/>
                Reject Merge Commit Hook for Atlassian Stash
            </a>
        </div>
        <div class="technologies">Java, Atlassian Stash, Git</div>
        <div class="description">
            <p>A pre-receive hook plugin for <a href="https://www.atlassian.com/software/stash">Atlassian Stash</a>. It rejects merge commits where all the parents for the commit are from the same branch. Merges which involve multiple branches, e.g. merging a feature branch into master, are allowed.</p>
            <p>The goal is to prevent unnecessary merge commits, e.g. "Merge branch 'master' of mygitserver:owner/repo", from polluting a repository. I developed this because I personally prefer to pull using --rebase and wanted to enforce this policy on my Stash repositories.</p>
            <p class="center"><a href="https://marketplace.atlassian.com/plugins/com.carolynvs.reject-merge-commit-hook">Download the latest version from Atlassian Marketplace</a></p>
        </div>
    </div>
</div>

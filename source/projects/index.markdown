---
layout: page
title: "Projects"
comments: false
sharing: false
sidebar: false
footer: true
---

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
  		
    <a id="atlassian"></a>
    <h2>Open Source Atlassian Plugins</h2>
    <p>I can't stop writing plugins for my favorite Atlassian products. Partly because my favorite projects to work on are dev tools, "Hey I'm my own user!" and partly because Bamboo and Stash are new enough that there is lots of low-hanging fruit.</p>
    
    <div class="project">
        <div class="title">
            <a href="https://bitbucket.org/carolynvs/bamboo-trade-depot">
                <img src="{{root_url}}/images/trade-depot.png" alt="Cargo Ship" title="Trade Depot"/>
                Trade Depot for Bamboo
            </a>
        </div>
        <div class="technologies">Java, Atlassian Bamboo, REST</div>
        <div class="description">
        	<p>Trade Depot is a plugin for Atlassian Bamboo which enables importing and exporting individual plans. It exposes a REST API using straightforward json so that you can create plan templates, automate the creation and maintenance of plans, copy plans to another server, etc.</p>
        	<p>Ideally functionality like this would <a href="https://jira.atlassian.com/browse/BAM-1223">provided directly by Bamboo</a>, however as that feature request was resolved after 7 years with "you will need to write your own", I decided to take them up on their offer.</p>     	
        	<p class="center"><a href="https://marketplace.atlassian.com/plugins/com.carolynvs.trade_depot">Download the beta from Atlassian Marketplace</a></p>
        </div>
    </div>
    
    <div class="project">
        <div class="title">
            <a href="https://bitbucket.org/carolynvs/bamboo-deployment-notifications">
                <img src="{{root_url}}/images/deployment-notifications.png" alt="Cloud Alert!" title="Deployment Notifications"/>
                Deployment Notifications for Bamboo
            </a>
        </div>
        <div class="technologies">Java, Atlassian Bamboo</div>
        <div class="description">
        	<p>As of v5.5, Bamboo only provides two notifications: on start and on completed. This is a plugin for Bamboo which provides additional deployment notifications for when a deployment fails (arguably the most useful notification!). They work exactly the same way as their build notification counterparts.

    <ul><li>Failed Deployments And First Successful</li>
    <li>After X Deployment Failures</li></ul>

	
        	<p class="center"><a href="https://marketplace.atlassian.com/plugins/com.carolynvs.trade_depot">Download the beta from Atlassian Marketplace</a></p>
        </div>
    </div>
    
    <div class="project">
        <div class="title">
            <a href="https://bitbucket.org/carolynvs/reject-merge-commit-hook">
                <img src="{{root_url}}/images/reject-merge-commit-hook.png" alt="Merge Sign" title="Reject Merge Commit Hook"/>
                Reject Merge Commit Hook for Stash
            </a>
        </div>
        <div class="technologies">Java, Atlassian Stash, Git</div>
        <div class="description">
            <p>A pre-receive hook plugin for Atlassian Stash. It rejects merge commits where all the parents for the commit are from the same branch. Merges which involve multiple branches, e.g. merging a feature branch into master, are allowed.</p>
            <p>The goal is to prevent unnecessary merge commits, e.g. "Merge branch 'master' of mygitserver:owner/repo", from polluting a repository. I developed this because I personally prefer to pull using --rebase and wanted to enforce this policy on my Stash repositories.</p>
            <p class="center"><a href="https://marketplace.atlassian.com/plugins/com.carolynvs.reject-merge-commit-hook">Download the latest version from Atlassian Marketplace</a></p>
        </div>
    </div>
    
    <div class="project">
        <div class="title">
            <a href="https://bitbucket.org/carolynvs/stash-force-field">
                <img src="{{root_url}}/images/force-field.png" alt="Force Field" title="Force Field"/>
                Force Field for Atlassian Stash
            </a>
        </div>
        <div class="technologies">Java, Atlassian Stash, Git</div>
        <div class="description">
        	<p>Force Field is a pre-receive hook plugin for Atlassian Stash. It protects specific branches from force pushes, e.g git push --force.     	
        	<p class="center"><a href="https://marketplace.atlassian.com/plugins/com.carolynvs.force-field">Download the latest version from Atlassian Marketplace</a></p>
        </div>
    </div>
</div>

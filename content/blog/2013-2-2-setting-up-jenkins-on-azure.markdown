---
categories: null
comments: true
date: "2013-02-02T00:00:00Z"
title: Setting up Jenkins on Windows Azure
slug: setting-up-jenkins-on-azure
---

<p>I have used a few different continuous integration (ci) servers before and really like Jenkins. So when running my suite of unit and integration tests started taking more than a minute, it was time for a ci server, specifically Jenkins. Originally I installed Jenkins on my dev machine but it required annoying config tweaks to not interfere with my existing IIS configuration and really needed a home of its own. Since I have been happily hosting my website on Windows Azure and an extra-small node is only $9/month... it seemed like a better option than scrounging up physical hardware.</p>

<p>Since I ran into a few unexpected difficulties, like getting mercurial+ssh+jenkins to play nice, here is the full rundown on how I setup my ci server. I know it seems like a lot of steps but I was able to set this up in less than 2 hours. Plus having a CI server is well worth the time investment!</p>

<h2>Provisioning an Azure Virtual Machine</h2>
<ol>
    <li>Create a VM from the gallery, making sure to select the latest platform image. For some reason MS still has old images up with RC builds and other cruft.</li>
    <li>Once your VM is ready, click on the VM and select "Connect", save the RDP file to your drive so that you can easily connect later.</li>
    <li>Right click on the RDP file and select "Edit...", then in the Remote Desktop settings uncheck "Always as for credentials" if you want to be able to save them. Otherwise, even if you check "Remember" when entering your password later, it will continue to prompt you for your password.</li>
    <li>Back in the Azure management portal, go to your VM's Endpoints and add a new endpoint for Jenkins, on TCP port 8080. This will allow you to connect to Jenkins remotely, e.g. mybuildserver.cloudapp.net:8080.<br/><img src="/images/azure_vm_jenkins_endpoint.png" alt="Configure your endpoint to use TCP port 8080"/></li>
</ol>

<h2>Virtual Machine Housekeeping</h2>
<p>Next we need to prep the VM a bit before we can install Jenkins as the VM is pretty bare-bones by default.</p>
<ol>
    <li>Disable Internet Explorer Enhanced Security for administrators so that you can use IE without throwing a chair. You can find it in the properties for your Local Server in Server Manager.<br/><img src="/images/disable_ie_enhanced_security.png" alt="Turn off IE Enhanced Security Configuration in Server Manager"/></li>
    <li>Proceed to download your browser of choice and then our prerequisites:
        <ul>
            <li><a href="http://mercurial.selenic.com/downloads/">Mercurial</a> (you must use x86 in order to work with Jenkins)</li>
            <li><a href="http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html">PuTTY and Plink (x86)</a></li>
            <li><a href="http://jenkins-ci.org/content/thank-you-downloading-windows-installer">Jenkins</a> (beware of v1.500 which has a bug related to windows plug-ins, go for v1.499 or the latest version)</li>
        </ul>
    </li>
    <li>Since my application is a web app, I installed IIS with IIS Management Console. Server Manager &raquo; Local Server &raquo; Roles and Features &raquo; Tasks &raquo; Add Roles and Features.<br/><img src="/images/enable_iis_with_mgmt.png" alt="Add Roles and Features Wizard - Select IIS and IIS Management Console."/></li>
    <li>Jenkins requires .NET 3.5 which is not installed by default and .NET 4.5 will not cut it. The Jenkins installer will fail because the service will be unable to start if you forget this step.<br/><img src="/images/enable_net3_5.png" alt="Add Roles and Features Wizard - Select .NET Framework 3.5 Features"/></li>
</ol>

<h2>Configure Mercurial (Hg) with SSH</h2>
<p>My source code is on BitBucket, more specifically Mercurial. I ran into trouble using SSH when Jenkins would clone my repository and hang. The problem is that when Jenkins is running as a windows service, it will not be able to accept the host's ssh keys and hangs waiting for user input. The workaround is to connect once using the console, and then copy the keys from your user to the default windows service user in the registry. If you are using SSH and git, I believe a similar situation can occur.</p>
<ol>
    <li>Install mercurial.</li>
    <li>Copy the putty and plink executables to C:\Program Files (x86)\Putty.</li>
    <li>Copy your ppk (putty private key) to your VM. This is the key you will use to clone your mercurial repository. As a side note, you may want to use a <a href="https://confluence.atlassian.com/display/BITBUCKET/Using+Deployment+Keys">BitBucket Deployment Key</a>.</li>
    <li>Open a command window and run "C:\Program Files (x86)\Putty\putty" bitbucket.org . When prompted, press Y (yes) to accept the bitbucket SSH host keys.</li>
    <li>Open regedit and navigate to the ssh keys you just accepted. Right click on SshHostKeys and export.<br/> <img src="/images/regedit_export_bitbucket_ssh_keys.png" alt="Regedit - Export HKCU/Software/SimonTatham/PuTTY"/>SshHostKeys></li>
    <li>Now right click on the exported .reg file and select "Edit". Change HKEY_CURRENT_USER to HKEY_USERS\.DEFAULT . Save and import the registry key by double clicking on it.<br/>
<pre><code>Windows Registry Editor Version 5.00

[HKEY_USERS\.DEFAULT\Software\SimonTatham\PuTTY\SshHostKeys]
"rsa2@22:bitbucket.org"="0x23,0xb9b88df3578371a7eb80c78bcda14fb30da436f11ca932a5fd5a8b6adfcc681df7a59cb4cb7ac966d9eac11daa38ebdbc0a6582a210ed4ee95a8d101c4abc925e942ab47535d64f9a5b3b68035c2ea1e900d709a1e8ea938718f532f9805a190446b92bac3040126225ae9d8374bc2008f106979d631734c7453f78c70091f4783b288869cb3c1941a784cd9baad823be27333833dc1f488a45b85952be75cf0a64965662302e3915378dcd5cfcd3ec903d804a29dff2fdf19df5deba4534b09e4dea6e44f152e339b3c43be98ddadfc56533192e216a3d673f00b4aa9cc9e7870acd8b6adb7e0feb77f2292fc2dede94819def3eb1e785541a06ab31ccf725f"
</code></pre>
        <img src="/images/edit_bitbucket_registry_key.png" alt="Notepad - Change HKEY_CURRENT_USER to HKEY_USERS\.DEFAULT"/></li>
    <li>Create a new file, mercurial.ini, in your Mercurial installation directory, e.g. C:\Program Files (x86)\Mercurial. Add the following section so that when mercurial connects via ssh it uses plink and our SSH key.<br/>
<pre><code>[ui]
ssh="C:\Program Files (x86)\Putty\plink.exe" -i "C:\Program Files (x86)\Putty\deployment_key.ppk"</code></pre>
        <img src="/images/edit_mercurial_ini.png" alt="Notepad - mercurial.ini"/></li>
</ol>

<h2>Running Jenkins as a Windows Service</h2>
<p>Onto the easy part! I kind of lied a bit when I hinted that getting Jenkins to run on Azure was the difficult part. Actually the hardest part was getting mercurial to work with SSH when running under the user account of the Jenkins windows server. So now that you have that working the rest is easy sailing!</p>
<ol>
    <li>Install Jenkins. This is automatically create a Jenkins windows service, start it and open a browser to the Jenkins page (http://localhost:8080).</li>
    <li><a href="https://wiki.jenkins-ci.org/display/JENKINS/Securing+Jenkins">Secure Jenkins</a>.</li>
    <li>Install the mercurial plug-in.</li>
    <li>Create a job that checks out your repository. Run it and verify that mercurial doesn't hang.</li>
</ol>

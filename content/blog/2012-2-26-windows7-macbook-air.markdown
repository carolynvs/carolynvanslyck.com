---
categories: null
comments: true
date: "2012-02-26T00:00:00Z"
title: Installing Windows 7 on a MacBook Air
---

<p>"No bootable device -- insert boot disk and press an key"</p>
<p><strong>The most important thing to realize when installing Windows on a
    Mac via USB is that not all USB sticks are bootable.</strong> The error
    message you see will be the same whether you screwed up setting up the files
    on the drive or the USB thumb drive is simply flaky, cheap and doesn't
    support booting. So if you run into this message, try another stick first!
    My SanDisk Cruzer 8GB wasn't bootable however a new PNY 8GB stick worked
    without any problems.</p>
<p>Otherwise the steps are ridiculously simple on the 2011 MacBook Air. Just
    open Boot Camp Assistant and check all 3 boxes. It will:</p>
<ol>
    <li>Format your USB stick and make it bootable.</li>
    <li>Copy your Windows 7 ISO to your USB stick.</li>
    <li>Copy all the necessary hardware drivers. You must still run Windows
        Support\setup.exe from Windows once it is installed. This installs a
        Boot Camp app to manage your setup and the drivers.</li>
    <li>Repartition your drive to make space for Windows. On my 128 GB
        drive, the smallest I could make the Mac partition was 26GB, leaving
        94GB for Windows.</li>
    <li>Restart and automatically boot from the USB stick into the Windows
        installer.</li>
</ol>
<p>This will setup 2 operating systems and by default it will boot into
    Windows. In your Windows system tray, after you have installed run the
    Windows Support installer (a.k.a. Boot Camp), you can open the Boot Camp
    application and change the default OS. Or you can hold down the option key
    while booting and you can select the OS.</p>


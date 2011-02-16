---
date: 2003/06/29 00:00:00
layout: post
title: "me vs. daemontools"
categories: daemontools, sysadmin
---

I have a love/hate relationship with [daemontools](http://cr.yp.to/daemontools.html). It's powerful way to manage services (like web servers and mail servers), but it sometimes doesn't act the way I expect it to. 

Today, I tried to set up [qmail-pop3d](http://cr.yp.to/qmail.html). I set up a directory called `/var/qmail/supervise/qmail-pop3d` and put a file named 'run' inside it. This contained:

    #!/bin/sh
    PATH=/var/qmail/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin
    export PATH

    tcpserver -H -R 0 pop-3 
    /var/qmail/bin/qmail-popup vkurup.acornhosting.net 
    /home/vpopmail/bin/vchkpw /var/qmail/bin/qmail-pop3d Maildir &

Then I connected the run script to my /service directory

    # ln -s /var/qmail/supervise/qmail-pop3d /service

Then I checked to see if it was running:

    # svstat /service/qmail-pop3d
    /service/qmail-pop3d: up (pid 13524) 0 seconds

Hmmm... up 0 seconds. That's not right - it should be at least 5 or 6 seconds (I can't type **that** fast). That usually means that the service is repeatedly failing and restarting itself.

ps shows that qmail-pop3d is running, but trying to connect to port 110 doesn't work:

    $ telnet localhost 110
    Trying 127.0.0.1...
    telnet: Unable to connect to remote host: Connection timed out

And now I'm stuck. Nothing is getting logged to the qmail-pop3d logs. After some headbanging, I do another `ps -ax` and this time notice a process called readproctitle:

    11919 ?        S      0:05 readproctitle service errors: ...lready used?tcpserve
    r: fatal: unable to bind: address already used?tcpserver: fatal: unable to bind:
     address already used?tcpserver: fatal: unable to bind: address already used?tcp
    server: fatal: unable to bind: address already used?tcpserver: fatal: unable to 
    bind: address already used?tcpserver: fatal: unable to bind: address already use
    d?tcpserver: fatal: unable to bind: address already used?

What's that? I look it up and find that [readproctitle](http://cr.yp.to/daemontools/readproctitle.html) is a kind of scrolling-log for daemontools which shows up when you run `ps`. So, it looks like `qmail-pop3d` failing because it's trying to bind port 110 even though it's already been bound. So this makes me thing that `qmail-pop3d` isn't failing, but that it's running over and over again. And then I look back at my run script and look at that pesky little '&' at the end. Doh! That tells the process to detach once it starts. It starts normally, then detaches. Once it detaches, daemontools thinks it's down, so it tries to start it again. (At least that's the way I understand it). Getting rid of the '&' and adding 'exec' to the beginning fixes it and everything works now.

Me: 1 Daemontools: 2123

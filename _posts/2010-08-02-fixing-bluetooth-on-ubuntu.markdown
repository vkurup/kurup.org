---
date: 2010/08/02 21:40:00
layout: post
title: Ubuntu Bluetooth Workaround
categories: ubuntu, linux, bluetooth
---

I use bluetooth to transfer podcasts from my laptop to my Palm Centro. A
Palm Centro is like an iPhone or a Droid, except less **smart**-like and
more **phone**-like. This worked beautifully but broke when I upgraded to
[Ubuntu](http://www.ubuntu.com/desktop/get-ubuntu/download) 10.04 (Lucid
Lynx). There are 2 bugs involved. First, the bluetooth daemon
(`/usr/sbin/bluetoothd`) never gets started. Second, there's no easy way to
start the file transfer daemon automatically (`/usr/bin/dund`). This used
to work automatically, but now it doesn't. I've tried to fiddle with `udev`
rules, but have been unsuccessful. I've reported the 2 bugs, but haven't
had any response
yet. [(bluetoothd bug)](https://bugs.launchpad.net/ubuntu/+source/bluez/+bug/589464)
[(dund bug)](https://bugs.launchpad.net/ubuntu/+source/bluez/+bug/559538)

My workaround is a shell script which starts those those daemons if they
are not running:

#### vk-bluetooth-start.sh

    #!/bin/bash
    
    BLUETOOTH='bluetoothd'
    DUN='dund'
    
    # first start bluetoothd
    if ps ax | grep -v grep | grep $BLUETOOTH > /dev/null
    then
        echo "$BLUETOOTH is running."
    else
        echo -n "Starting $BLUETOOTH..."
        /usr/bin/sudo /usr/sbin/bluetoothd -u &> /dev/null
        echo "done."
    fi
    
    # then start dund
    if ps ax | grep -v grep | grep $DUN > /dev/null
    then
        echo "$DUN is running."
    else
        echo -n "Starting $DUN..."
        /usr/bin/sudo /usr/bin/dund --listen --persist --msdun call centro
        echo "done."
    fi

And here's my script which transfers the files to my phone. It uses
[pilot-link](http://packages.ubuntu.com/lucid/pilot-link), which I had to
compile from source due to a
[bug in the way that the Ubuntu version addresses large SD cards](https://bugs.launchpad.net/ubuntu/+source/pilot-link/+bug/592916). This
should be fixed in the next version of Ubuntu.

#### vk-transfer-podcasts.sh

    #!/bin/bash
    
    output=$(pilot-xfer -p net:any -D /Kingston/AUDIO -i *.mp3 2>&1)
    errors=$(echo $output | grep -c "ERROR:")
    
    if [ $errors -gt 0 ] ; then
        echo "failure (count: $errors)"
        echo $output
    else
        echo -n "success, removing files from laptop..."
        /bin/rm -I $HOME/*.mp3
        echo "done."
    fi

If you're wondering why I use a slow protocol like bluetooth to transfer
large files to an SD card, rather than just ejecting the SD card and
inserting it into the laptop, well... you haven't tried to access the SD
card on a Palm Centro. #paininthe*&^@!

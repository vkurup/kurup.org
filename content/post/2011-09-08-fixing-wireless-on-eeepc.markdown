---
categories:
- linux
- sysadmin
comments: true
date: '2011-09-08T21:58:48'
title: Fixing wireless on eeePC
---


I have an ASUS eeePC 1000, running Ubuntu 10.10. Wireless worked
flawlessly at home, which is where I use it 99% of the time. On our
most recent trip, however, it wasn't working. It couldn't connect to a
WPA-secured network. Here are the relevant error messages:

    NetworkManager[770]: <warn> Activation (wlan0/wireless): association took too long.
    NetworkManager[770]: <warn> (wlan0): link timed out.
    NetworkManager[770]: <warn> Activation (wlan0) failed for access point (linksys)
    NetworkManager[770]: <warn> Activation (wlan0) failed.
    NetworkManager[770]: <info> (wlan0): deactivating device (reason: 0).

After a little googling on my phone, I found out that [others had this problem with the rt2860sta wireless driver](http://www.ctbarker.info/2010/05/ubuntu-1004-wireless-chipsets-and-wpa.html). Fortunately,
there is a solution, which involved downloading the source code for
the latest driver, modifying it a bit and rebuilding the driver. Here
are the instructions:

### Step 1: Download the driver

Download the [latest rt2860sta driver](http://www.ralinktech.com/license_us.php?n=2&p=0&t=U0wyRnpjMlYwY3k4eU1ERXdMekEzTHpFMkwyUnZkMjVzYjJGa05qZ3hPRFUwTmpBd05DNWllakk5UFQweU1ERXdYekEzWHpFMlgxSlVNamcyTUY5TWFXNTFlRjlUVkVGZmRqSXVOQzR3TGpBdWRHRnlD).

### Step 2: Rename and extract the downloaded file

Mine was named `download.php`, but it's really a tar file:

```sh
vinod@ike:~ $ mkdir test
vinod@ike:~ $ mv download.php test/driver.tar
vinod@ike:~ $ cd test/
vinod@ike:~/test $ tar xf driver.tar 
vinod@ike:~/test $ mv 2010_07_16_RT2860_Linux_STA_v2.4.0.0 driver
vinod@ike:~/test $ cd driver
```

### Step 3: Apply patch

{{< gist vkurup 1205291 >}}

### Step 4: Backup old driver

```sh
vinod@ike~/test/driver/ $ sudo ifconfig wlan0 down
vinod@ike~/test/driver/ $ sudo rmmod rt2860sta
vinod@ike~/test/driver/ $ mkdir backup
vinod@ike~/test/driver/ $ sudo mv /etc/Wireless/RT2860STA backup/
vinod@ike~/test/driver/ $ sudo mv /lib/modules/2.6.35-30-generic/kernel/drivers/staging/rt2860/rt2860sta.ko backup/
```

### Step 5: Install and activate new driver

````sh
vinod@ike:~/test/driver $ sudo make install
vinod@ike:~/test/driver $ sudo depmod -a
vinod@ike:~/test/driver $ sudo modprobe rt2860sta
```

### Step 6: Fix problems with hibernation

A separate problem is that wireless has been flaky when the computer
wakes from hibernation, but [it's also fixable](http://www.twentyways.com/2010/11/19/fixing-wireless-issues-with-asus-eeepc-1000he-running-ubuntu-10-10/).

Add the following lines to `/etc/modprobe.d/blacklist.conf`:

    blacklist rt2800pci
    blacklist rt2800lib
    blacklist rt2x00usb
    blacklist rt2x00pci
    blacklist rt2x00lib
 
Create a new file called `/etc/pm/config.d/unload_wireless` with the following line:

    SUSPEND_MODULES="rt2860sta"

Reboot and you should have WPA-compatible, hibernatable wireless.

### References:

1. [rt2860sta driver installation](http://www.ctbarker.info/2010/05/ubuntu-1004-wireless-chipsets-and-wpa.html)
2. [Proper hibernation](http://www.twentyways.com/2010/11/19/fixing-wireless-issues-with-asus-eeepc-1000he-running-ubuntu-10-10/)
3. [Ubuntu Forums thread](http://ubuntuforums.org/showthread.php?t=1476007)

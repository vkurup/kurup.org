---
categories:
- linux
date: '2009-09-21T00:00:00'
title: Speed up Firefox on eeepc
---


I'm too weak to lug around my monstrous 7 pound laptop, so I bought a
[netbook](http://eeepc.asus.com/global/product1000.html). It's an eeepc
1000 and I love it. I use it for everything, except for processing the
kids' videos and photos. I still use the desktop for that.

The major issue that I've had with it is that firefox seemed so slow. I
tried other browsers, some which seemed faster, but I missed my firefox
extensions. I googled and found that [others had the same issue](http://wiki.debian.org/DebianEeePC/TipsAndTricks#SpeedupsluggishIceweasel.2BAC8-Firefox3). There
are 2 flash hard drives in the eeepc. The first is 8GB and contains the
root filesystem. The second is 32GB and contains the `/home`
partition. Apparently the 8GB drive is **significantly** faster than the
32GB one. So the OS performs excellently since it's on the 8GB drive,
anything that requires a lot of disk access from the 32GB drive slows
down. Firefox's `.mozilla` configuration folder is mounted there by
default.

Moving the `.mozilla` folder to the 8GB drive has made web browsing speedy
again. Here's how I did it. I'm the only user on my system, so if you have
multiple users, this will only fix the issue for one user.

    sudo mkdir /usr/local/share/vinod-mozilla
    sudo chown vinod /usr/local/share/vinod-mozilla
    mv /home/vinod/.mozilla /usr/local/share/vinod-mozilla/
    ln -s /usr/local/share/vinod-mozilla/.mozilla /home/vinod/.mozilla

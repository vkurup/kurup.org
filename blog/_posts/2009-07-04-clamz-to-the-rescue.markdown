---
date: 2009/07/04 00:00:00
layout: post
title: "clamz to the rescue"
tags: gpl linux music
---

[Kottke](http://kottke.org/09/05/99-classical-mp3s-for-8) linked to some great deals on [classical music at amazon](http://www.amazon.com/gp/product/B001U1J2S4?ie=UTF8&tag=vinodkurupshomep&linkCode=as2&camp=1789&creative=390957&creativeASIN=B001U1J2S4)<img src="http://www.assoc-amazon.com/e/ir?t=vinodkurupshomep&l=as2&o=1&a=B001U1J2S4" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />. In order to download them, you need to have the amazon mp3 downloader installed. They now offer a Debian (linux) version, but I couldn't get it working. It's meant for an older version of Debian, but it doesn't recognize the newer versions of the libraries installed on my system. I thought about doing some fancy apt-getting to try to get the right versions, but just thinking about that made my head throb. Then I heard about [clamz](http://code.google.com/p/clamz/), an open source project to replicate the amazon mp3 downloader. I installed the library packages they recommended (libgcrypt11-dev, libcurl4-openssl-dev, and libexpat1-dev) and then installed it. 

I'm always a little leary to install packages from source, because then they're not managed by the package manager (apt-get). It becomes more of a tedious process to keep them updated or to uninstall them. To partially workaround that problem, I use a program called [checkinstall](http://www.asic-linux.com.mx/~izto/checkinstall/). It basically creates a package for any program that you want to install from source. So, instead of :

    ./configure
    make
    sudo make install

you do:

    ./configure
    make
    sudo checkinstall

It then creates a .deb and installs it. It asks you for some basic info about the program, but guesses as much as it can and does a decent job. I haven't delved into anything more involved than that, but there are ways to document dependencies which would allow it to be even more integrated into the package management system.

Anyway, it installed perfectly and within seconds I was downloading the music that I had purchased.

    vinod@ike:~/Music $ clamz "Desktop/The 99 Most Essential Mozart Masterpieces.amz"

---
categories:
- linux
- programming
date: '2010-11-05T15:09:06'
title: Autopoint
---


If you get this error message:

    Can't exec "autopoint": No such file or directory at /usr/share/autoconf/Autom4te/FileUtils.pm

Then, you need to install autopoint:

    sudo aptitude install autopoint

I ran into this while building
[ledger](https://github.com/jwiegley/ledger) today and had never
needed to do that before. The error that `acprep` provides is even
more cryptic: 

    Automatically preparing build ... Warning: autoreconf failed

Then, I ran `autogen.sh` and the autpoint error showed up.



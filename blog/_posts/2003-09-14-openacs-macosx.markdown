---
date: 2003/09/14 00:00:00
layout: post
title: Another Mac OS X OpenACS Installation Guide
tags: mac openacs
---

## Another Mac OS X OpenACS Installation Guide

[by Vinod Kurup][1]

----

I installed OpenACS 5.0 on my PowerBook G4. Everyone should read [MarkD's
guide][2] since it's more comprehensive and explains a lot of the changes
that I don't explain. I used some different software versions which made my
experience different enough to document.

This is a quick and dirty document for people who have installed OpenACS
4. If I haven't been clear enough or if I've made mistakes, please let me
know.

Apparently, these instructions may also help you install OpenACS on FreeBSD
- look at [Andrei's instructions][3] if you're doing that.

### Software Versions

All of the AOLserver modules were obtained from CVS (2003-09-14).

- Postgresql 7.3.4
- [AOLserver 4.0b14][4]
   - nscache CVS
   - nsrewrite CVS
   - nssha1 CVS
   - nspostgres CVS
   - [tDom 0.78][5]
- [OpenACS CVS][6]

#### Install Postgresql

1. `./configure` - fails on readline not being installed
1. Install readline: 

        $ fink install readline
1. Configure

        $ ./configure --with-includes=/sw/include --with-libs=/sw/lib
1. Compile

        $ make
        $ sudo make install
1. Create the database directory and give yourself permission over it.

        $ sudo mkdir /usr/local/pgsql/data
        $ sudo chown vinod.staff /usr/local/pgsql/data
1. change `$PATH`. Add `/usr/local/pgsql/bin` to the PATH variable in your `~/.profile`
1. I tried doing an initdb next and it worked, but then I got the following error when starting PG.

        FATAL:  invalid value for option 'LC_TIME': 'en_US'
1. I found [Tom Lane's answer][7]:

        $ /usr/local/pgsql/bin/initdb -D /usr/local/pgsql/data --no-locale
1. Start it.

        $ pg_ctl -D /usr/local/pgsql/data -l /usr/local/pgsql/server.log start
        $ createlang plpgsql template1
        $ createdb openacs
        $ createuser openacs
        (Answer 'Y' twice)

#### Install AOLserver

I'm going to use AOLserver 4. Previous versions of AOLserver came bundled
with a customized version of TCL, but AOLserver 4 can use the standard TCL
releases, as long as TCL was built with thread support. Mac OS X 10.2 comes
with TCL 8.3.x, but without thread support. Fink currently has TCL 8.4.1,
but also without thread support. So, the right solution is to download TCL
and build it manually. But I had already downloaded Fink's version, so I
just manually edited the .info file that specifies how to build TCL and
added `--enable-threads`. Of course, when the next version of TCL gets
uploaded to the Fink repository, I'll be screwed, but I'm too lazy to
compile TCL again right now.

1. Configure and Compile AOLserver

        /usr/local/src/aolserver/aolserver$ ./configure --with-tcl=/sw/lib
        /usr/local/src/aolserver/aolserver$ sudo make install
1. Install nscache and nsrewrite

        /usr/local/src/aolserver/nscache$ sudo make install
        /usr/local/src/aolserver/nsrewrite$ sudo make install
1. nssha1 doesn't compile without editing nssha1.c. Comment out the
following 2 lines (lines 139-140):

        // typedef unsigned int u_int32_t;
        // typedef unsigned char u_int8_t;
1. Compile nssha1

        /usr/local/src/aolserver/nssha1$ sudo make install
1. nspostgres doesn't link outta the box. Add `-lnsdb` to the
MODLIBS var in the Makefile:

        MODLIBS   = -L$(PGLIB) -lpq <b>-lnsdb</b>
1. Compile nspostgres

        /usr/local/src/aolserver/nspostgres$ sudo make install POSTGRES=/usr/local/pgsql ACS=1 

#### Install tDom 0.78

1. Edit `/usr/local/src/tDOM-0.7.8/unix/CONFIG`
1. Uncomment the instructions meant for AOLserver 4, but edit it to look
like this:

        ../configure --enable-threads --disable-tdomalloc \
          --prefix=/usr/local/aolserver --with-tcl=/sw/lib
1. OpenACS 5 will notice that you're using AOLserver 4 and will
automatically call 'package require tdom'. You shouldn't have to do
anything special to get tDOM working with OpenACS 5.

#### Get ready to start

1. Get OpenACS CVS.
1. Edit config.tcl (a.k.a. nsd.tcl).
   1. Change `server` to `openacs`.
   1. Set `serverroot` to wherever you put your OpenACS CVS
   1. The config.tcl file that comes with OpenACS 5 will properly load
   nsdb.so (and ignore libtdom.so) if you're using AOLserver 4. 
   1. Change the `stacksize` to `2048000`. If the number you choose is
   not divisible by 4096, then you get:

            \[15/Sep/2003:19:08:02\]\[1997.2684358124\]\[-main-\] Notice: PostgreSQL loaded.
            nsthreads: pthread_attr_setstacksize failed in NsCreateThread: Invalid argument
            Abort trap
1. Set some permissions:

        chmod 755 /usr/local/aolserver/log
1. Start it!

        $ /usr/local/aolserver/bin/nsd -ft /web/openacs/etc/config.tcl


#### Changelog

- 2004-01-23 - Pointed to Andrei's FreeBSD document. Simplified instructions which are automatically taken care of by OpenACS 5
- 2004-01-05 - Added fixes from [Jeff Davis][8].
- 2003-09-14 - Initial Revision

[1]: http://kurup.org "Vinod Kurup's site"
[2]: http://borkware.com/rants/openacs/ "MarkD's guide"
[3]: http://openacs.org/forums/message-view?message_id=136910 "Andrei's instructions"
[4]: http://sourceforge.net/cvs/?group_id=3152 "Aolserver"
[5]: http://www.tdom.org/#SECTid960 "tDOM"
[6]: http://openacs.org/4/checkout "OpenACS CVS"
[7]: http://archives.postgresql.org/pgsql-novice/2003-01/msg00099.php "Tom Lane's answer"
[8]: http://xarg.net/ "Jeff Davis"

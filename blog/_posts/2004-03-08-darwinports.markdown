---
layout: post
title: "darwinports"
tags: [darwinports, mac]
---

In the process of installing Panther from scratch, I decided to use [DarwinPorts](http://darwinports.opendarwin.org/). It's a packaging system for the abundant UNIX [free software](http://www.fsf.org/) available on Mac OS X. I had previously used [Fink](http://fink.sf.net) which, while being an admirable project, seemed a little opaque to me. I never quite knew where data was being installed and which locations were being searched to see if prerequisites were present. Darwinports seems to be a little better at finding programs/libraries that are already installed. I freely admit my ignorance in this matter, though. It may simply be that I understand Darwinports better than I did Fink, but that, in itself is an important criteria.

Here are the ports that I currently have installed:

    [02:17:13 vinod]:~ $ port installed The following ports are installed:
         gettext-0.10.40
         keychain-2.0.3
         mutt-1.4.2.1
         offlineimap-4.0.0
         readline-4.3
         urlview-0.9
         wget-1.9.1

All of the above ports are available from darwinports except offlineimap. I built that one myself. Here is the Portfile for offlineimap:

    [02:18:42 vinod]:~/dports-dev/mail/offlineimap $ cat Portfile 
    # $Id: $  PortSystem          1.0 
    name                offlineimap 
    version             4.0.0 
    categories          mail 
    maintainers         vinod@kurup.org 
    platforms           darwin 
    homepage            http://gopher.quux.org:70/devel/offlineimap 
    description         IMAP/Maildir synchronization and reader support 
    long_description    OfflineIMAP is a tool to simplify your e-mail reading. With OfflimeIMAP, you can:   
                        * Read the same mailbox from multiple computers, and have your     
                          changes (deletions, etc.) be automatically reflected on     
                          all computers   
                        * Use various mail clients to read a single mail box   
                        * Read mail while offline (on a laptop) and have all changes     
                          synchronized when you get connected again   
                        * Read IMAP mail with mail readers that do not support IMAP   
                        * Use SSL (secure connections) to read IMAP mail even if your reader     
                          doesn't support SSL   
                        * Synchronize your mail using a completely safe and fault-tolerant     
                          algorithm.  (At least I think it is!)   
                        * Customize which mailboxes to synchronize with regular expressions     
                          or lists.   
                        * Synchronize your mail two to four times faster than with other tools     
                          or other mail readers' internal IMAP support.  In short, OfflineIMAP 
                          is a tool to let you read mail how YOU want to.   
    distname            ${name}_${version} 
    master_sites        http://gopher.quux.org:70/devel/offlineimap/ 
    checksums           md5 13e355c8a957dddfe9b7486821d83370  
    depends_lib         bin:python2.3:python23  
    # tarball extracts as offlineimap, not offlineimap-4.0.0 
    worksrcdir          ${name}  
    use_configure       no  
    build.cmd           python setup.py 
    build.target        build  
    destroot.cmd        python setup.py 
    destroot.destdir    --prefix=${destroot}${prefix}  
    post-destroot {         # remind user to define/add installed path to python path         
                            ui_msg " be sure the install path is included in your python path:"
                            # FIXME: hardcoding 2.3 isn't right here         
                            ui_msg "tcsh: setenv PYTHONPATH $PYTHONPATH:${prefix}/lib/python2.3/site-packages"         
                            ui_msg "bash: export PYTHONPATH=$PYTHONPATH:${prefix}/lib/python2.3/site-packages"          
                            xinstall -d -m 755 ${destroot}${prefix}/share/doc/${name}         
                            xinstall -m 644 -W ${worksrcpath} manual.html manual.pdf manual.ps
                                     manual.txt ChangeLog COPYING COPYRIGHT UPGRADING
                                     ${destroot}${prefix}/share/doc/${name}         
                            xinstall -d -m 755 ${destroot}${prefix}/share/doc/${name}/examples
                            xinstall -m 644 -W ${worksrcpath} offlineimap.conf offlineimap.conf.minimal                  
                                     ${destroot}${prefix}/share/doc/${name}/examples
                            install -m 644 -W ${worksrcpath} offlineimap.1
                                    ${destroot}${prefix}/share/man/man1 }

I haven't submitted this to the darwinports project yet because they recommend installing the software on a fresh Mac OS X install to be sure that you've correctly specified any dependencies. I haven't had time to do that yet. I hope to, though, because I find the port system to be very intuitive. Building an OpenACS port on Mac OS X seems doable, but I need to look into how upgrades are handled. [Walter McGinnis](http://without.net/wtem) has sent me his instructions for building an OpenACS installation using darwinports, but I think we can make it easier, by building simple Portfiles for each of the required pieces. Here are Walter's detailed instructions:

    # install darwinports 
    # see instructions on darwinports.com # using openacs-head for server name for convoluted reasons... 
    # i also use ~/Development/web rather than /var/lib/aolserver for my 
    # server source 
    # darwinports working directories under ~/Development/darwinports/ 
    # you need to add /opt/local/bin or something to your path in .bash_profile 
    # for the port command to work 
    # see darwinports install doc for details Delphy:~ walter$ sudo port -v -d install postgresql Password: ... Delphy:~ walter$ pwd /Users/walter Delphy:~ walter$ cd /opt/local/ Delphy:/opt/local walter$ mkdir pgsql Delphy:/opt/local walter$ mkdir pgsql/data Delphy:/opt/local walter$ sudo chown -R walter:staff pgsql Delphy:/opt/local walter$ initdb -D pgsql/data ... Delphy:/opt/local walter$ pg_ctl -D pgsql/data -l logfile start postmaster successfully started Delphy:/opt/local walter$ createlang plpgsql template1 Delphy:/opt/local walter$ createdb openacs-head CREATE DATABASE Delphy:/opt/local walter$ createuser openacs-head Shall the new user be allowed to create databases? (y/n) y Shall the new user be allowed to create more new users? (y/n) y CREATE USER Delphy:/opt/local walter$ sudo port -v -d install aolserver ...  Delphy:/opt/local walter$ cd ~/Development/darwinports/dports/www/aolserver/work/aolserver-4.0/ Delphy:~/Development/darwinports/dports/www/aolserver/work/aolserver-4.0 walter$ sudo port -v -d install wget Password: ...  Delphy:~/Development/darwinports/dports/www/aolserver/work/aolserver-4.0 walter$ sudo wget http://twtelecom.dl.sourceforge.net/sourceforge/aolserver/nscache-1.5.tar.gz Password: ...  Delphy:~/Development/darwinports/dports/www/aolserver/work/aolserver-4.0 walter$ sudo wget http://twtelecom.dl.sourceforge.net/sourceforge/aolserver/nspostgres-4.0.tar.gz ...   Delphy:~/Development/darwinports/dports/www/aolserver/work/aolserver-4.0 walter$ sudo wget http://twtelecom.dl.sourceforge.net/sourceforge/aolserver/nssha1-0.1.tar.gz ...  Delphy:~/Development/darwinports/dports/www/aolserver/work/aolserver-4.0 walter$ sudo cvs -d:pserver:anonymous@cvs.sourceforge.net:/cvsroot/aolserver login Password:  (Logging in to anonymous@cvs.sourceforge.net) CVS password:  Delphy:~/Development/darwinports/dports/www/aolserver/work/aolserver-4.0 walter$ sudo cvs -z3 -d:pserver:anonymous@cvs.sourceforge.net:/cvsroot/aolserver co nsrewrite ...  Delphy:~/Development/darwinports/dports/www/aolserver/work/aolserver-4.0 walter$ sudo tar xvfz nscache-1.5.tar.gz ; sudo tar xvfz nssha1-0.1.tar.gz ; sudo tar xvfz nspostgres-4.0.tar.gz ...  Delphy:~/Development/darwinports/dports/www/aolserver/work/aolserver-4.0 walter$ cd nscache-1.5  Delphy:~/Development/darwinports/dports/www/aolserver/work/aolserver-4.0/nscache-1.5 walter$ NSHOME=..; export NSHOME  Delphy:~/Development/darwinports/dports/www/aolserver/work/aolserver-4.0/nscache-1.5 walter$ sudo make install ...  Delphy:~/Development/darwinports/dports/www/aolserver/work/aolserver-4.0/nscache-1.5 walter$ cd ../nsrewrite/  Delphy:~/Development/darwinports/dports/www/aolserver/work/aolserver-4.0/nsrewrite walter$ sudo make install ...  Delphy:~/Development/darwinports/dports/www/aolserver/work/aolserver-4.0/nsrewrite walter$ cd ..  Delphy:~/Development/darwinports/dports/www/aolserver/work/aolserver-4.0 walter$ cd nssha1-0.1  Delphy:~/Development/darwinports/dports/www/aolserver/work/aolserver-4.0/nssha1-0.1 walter$ sudo make install  Delphy:~/Development/darwinports/dports/www/aolserver/work/aolserver-4.0/nssha1-0.1 walter$ cd ../nspostgres-4.0  # edit the Makefile from: # < MODLIBS   = -L$(PGLIB) -lpq # to # MODLIBS   = -L$(PGLIB) -lpq -lnsdb  Delphy:~/Development/darwinports/dports/www/aolserver/work/aolserver-4.0/nspostgres-4.0 walter$ sudo make install POSTGRES=/opt/local ACS=1 ...  Delphy:/opt/local walter$ cd /opt/local  Delphy:/opt/local walter$ sudo mkdir src Delphy:/opt/local walter$ sudo chmod 775 src   Delphy:/opt/local walter$ wget http://www.tdom.org/tDOM-0.7.8.tar.gz ... Delphy:/opt/local walter$ cd src/ Delphy:/opt/local/src walter$ tar xvfz ../tDOM-0.7.8.tar.gz  Delphy:/opt/local/src walter$ rm ../tDOM-0.7.8.tar.gz Delphy:/opt/local/src walter$ cd tDOM-0.7.8/  Delphy:/opt/local/src/tDOM-0.7.8 walter$ cd unix/ Delphy:/opt/local/src/tDOM-0.7.8/unix walter$ ../configure --enable-threads --disable-tdomalloc --prefix=/opt/local/aolserver  Delphy:/opt/local/src/tDOM-0.7.8/unix walter$ sudo make install ...  Delphy:/opt/local/src/tDOM-0.7.8/unix walter$ cd Delphy:~ walter$ cd Development/ Delphy:~/Development walter$ mkdir web Delphy:~/Development walter$ cd web  Delphy:~/Development/web walter$ cvs -z3 -d walterg@openacs.org:/cvsroot co acs-core password: ...  # i move the openacs code to openacs-head # mv openacs-4 openacs-head # edit openacs-head/etc/config.tcl to be localhost, etc ! set hostname                  localhost ! set address                   127.0.0.1  ! set server                    "openacs-head"   set servername                "New OpenACS Installation - Development"  ! set serverroot                "/Users/walter/Development/web/${server}"  Delphy:~/Development/web/openacs-head walter$ /opt/local/aolserver/bin/nsd -ft ~/Development/web/openacs-head/etc/config.tcl

I think Fink and Darwinports can coexist since Fink is installed in `/sw` and Darwinports in `/opt/local`, but I'm sticking with Darwinports alone, for now.

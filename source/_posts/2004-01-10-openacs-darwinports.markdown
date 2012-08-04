---
date: 2004/01/10 00:00:00
layout: post
title: Installing OpenACS via Darwinports
categories: openacs mac-os-x
---

## Installing OpenACS via Darwinports

[by Vinod Kurup](/)

--------

I've created a Darwinports installation for OpenACS. ([What is
Darwinports?][1]). This will allow you to set up a quick test installation
to try out OpenACS. I wouldn't recommend it for a production (or even a
development) server. For those purposes, I'd strictly follow [the OpenACS
documentation][2].

Download my [OpenACS portfiles][3] and stick them in your local darwinports
repository. If you don't already have a local darwinports repository,
create one and add its location to `/opt/local/etc/ports/sources.conf` (I
use `file:///Users/vinod/dports-dev`). Here's the steps I took to get
everything to work (on Mac OS X Panther).

    :~$ wget http://www.kurup.org/files/openacs-dports.tgz
    :~$ tar xvzf openacs-dports.tgz
    dports-dev/www/
    dports-dev/www/aolserver-nscache/
    dports-dev/www/aolserver-nscache/Portfile
    dports-dev/www/aolserver-nspostgres/
    dports-dev/www/aolserver-nspostgres/files/
    dports-dev/www/aolserver-nspostgres/files/patch-Makefile.diff
    dports-dev/www/aolserver-nspostgres/Portfile
    dports-dev/www/aolserver-nssha1/
    dports-dev/www/aolserver-nssha1/Portfile
    dports-dev/www/openacs/
    dports-dev/www/openacs/files/
    dports-dev/www/openacs/files/patch-config.diff
    dports-dev/www/openacs/files/patch-functions.diff
    dports-dev/www/openacs/files/patch-install-sh.diff
    dports-dev/www/openacs/files/patch-install-tcl.diff
    dports-dev/www/openacs/files/patch-nsd-postgres.diff
    dports-dev/www/openacs/Portfile
    dports-dev/www/tclwebtest/
    dports-dev/www/tclwebtest/Portfile
    dports-dev/textproc/
    dports-dev/textproc/tdom/
    dports-dev/textproc/tdom/Portfile
    -->:~$ cd dports-dev/
    :~/dports-dev$ portindex
    Creating software index in /Users/vinod/dports-dev
    Adding port textproc/tdom
    Adding port www/aolserver-nscache
    Adding port www/aolserver-nspostgres
    Adding port www/aolserver-nssha1
    Adding port www/openacs
    Adding port www/tclwebtest
    
    Total number of ports parsed:	6 
    Ports successfully parsed:	6	 
    Ports failed:			0
    
    :~/dports-dev$ cd
    :~$ sudo port install postgresql +server
    --->  Fetching postgresql
    --->  Attempting to fetch postgresql-7.4.8.tar.bz2 from ftp://ftp2.ch.postgresql.org/mirror/postgresql/source/v7.4.8
    --->  Verifying checksum(s) for postgresql
    --->  Extracting postgresql
    --->  Applying patches to postgresql
    --->  Configuring postgresql
    --->  Building postgresql with target all
    --->  Staging postgresql into destroot
    --->  Packaging tgz archive for postgresql 7.4.8_0+darwin_7+server
    --->  Installing postgresql 7.4.8_0+darwin_7+server
    
    :~$ sudo su postgres -c '/opt/local/bin/initdb -D /opt/local/var/db/pgsql/defaultdb'
    
    The files belonging to this database system will be owned by user "postgres".
    This user must also own the server process.
    
    The database cluster will be initialized with locale C.
    
    creating directory /opt/local/var/db/pgsql/defaultdb... ok
    creating directory /opt/local/var/db/pgsql/defaultdb/base... ok
    creating directory /opt/local/var/db/pgsql/defaultdb/global... ok
    creating directory /opt/local/var/db/pgsql/defaultdb/pg_xlog... ok
    creating directory /opt/local/var/db/pgsql/defaultdb/pg_clog... ok
    selecting default max_connections... 50
    selecting default shared_buffers... 300
    creating configuration files... ok
    creating template1 database in /opt/local/var/db/pgsql/defaultdb/base/1... ok
    initializing pg_shadow... ok
    enabling unlimited row size for system tables... ok
    initializing pg_depend... ok
    creating system views... ok
    loading pg_description... ok
    creating conversions... ok
    setting privileges on built-in objects... ok
    creating information schema... ok
    vacuuming database template1... ok
    copying template1 to template0... ok
    
    Success. You can now start the database server using:
    
        /opt/local/bin/postmaster -D /opt/local/var/db/pgsql/defaultdb
                or
        /opt/local/bin/pg_ctl -D /opt/local/var/db/pgsql/defaultdb -l logfile start

        :~$ sudo su postgres -c '/opt/local/bin/pg_ctl -D /opt/local/var/db/pgsql/defaultdb -l /opt/local/var/log/pgsql/defaultdb.log start'
        postmaster successfully started

        :~$ sudo port install openacs
        
        --->  Fetching aolserver
        --->  Attempting to fetch aolserver-4.0.10-src.tar.gz from http://kent.dl.sourceforge.net/aolserver
        --->  Verifying checksum(s) for aolserver
        --->  Extracting aolserver
        --->  Configuring aolserver
        --->  Building aolserver with target all
        --->  Staging aolserver into destroot
        --->  Packaging tgz archive for aolserver 4.0.10_0
        --->  Installing aolserver 4.0.10_0
        
        AOLserver installed into /opt/local/aolserver
        
        You now need to configure the server to your needs. You 
        might want to create another user (e.g. aolserver) to run 
        the server.
        --->  Activating aolserver 4.0.10_0
        --->  Cleaning aolserver
        --->  Fetching aolserver-nscache
        --->  Attempting to fetch nscache-1.5.tar.gz from http://kent.dl.sourceforge.net/aolserver
        --->  Verifying checksum(s) for aolserver-nscache
        --->  Extracting aolserver-nscache
        --->  Configuring aolserver-nscache
        --->  Building aolserver-nscache with target all
        --->  Staging aolserver-nscache into destroot
        --->  Packaging tgz archive for aolserver-nscache 1.5_0
        --->  Installing aolserver-nscache 1.5_0
        --->  Activating aolserver-nscache 1.5_0
        --->  Cleaning aolserver-nscache
        --->  Fetching aolserver-nspostgres
        --->  Attempting to fetch nspostgres-4.0.tar.gz from http://kent.dl.sourceforge.net/aolserver
        --->  Verifying checksum(s) for aolserver-nspostgres
        --->  Extracting aolserver-nspostgres
        --->  Applying patches to aolserver-nspostgres
        --->  Configuring aolserver-nspostgres
        --->  Building aolserver-nspostgres with target all
        --->  Staging aolserver-nspostgres into destroot
        --->  Packaging tgz archive for aolserver-nspostgres 4.0_0
        --->  Installing aolserver-nspostgres 4.0_0
        --->  Activating aolserver-nspostgres 4.0_0
        --->  Cleaning aolserver-nspostgres
        --->  Fetching aolserver-nssha1
        --->  Attempting to fetch nssha1-0.1.tar.gz from http://kent.dl.sourceforge.net/aolserver
        --->  Verifying checksum(s) for aolserver-nssha1
        --->  Extracting aolserver-nssha1
        --->  Configuring aolserver-nssha1
        --->  Building aolserver-nssha1 with target all
        --->  Staging aolserver-nssha1 into destroot
        --->  Packaging tgz archive for aolserver-nssha1 0.1_0
        --->  Installing aolserver-nssha1 0.1_0
        --->  Activating aolserver-nssha1 0.1_0
        --->  Cleaning aolserver-nssha1
        --->  Fetching tclwebtest
        --->  Verifying checksum(s) for tclwebtest
        --->  Extracting tclwebtest
        --->  Configuring tclwebtest
        --->  Building tclwebtest with target all
        --->  Staging tclwebtest into destroot

        be sure that /opt/local/lib is included in your TCL path:
        tcsh: setenv TCLLIBPATH "$TCLLIBPATH /opt/local/lib"
        bash: export TCLLIBPATH "$TCLLIBPATH /opt/local/lib"
        --->  Packaging tgz archive for tclwebtest 0.9_0
        --->  Installing tclwebtest 0.9_0
        --->  Activating tclwebtest 0.9_0
        --->  Cleaning tclwebtest
        --->  Fetching tdom
        --->  Attempting to fetch tDOM-0.8.0.tar.gz from http://www.tdom.org/files/
        --->  Verifying checksum(s) for tdom
        --->  Extracting tdom
        --->  Configuring tdom
        --->  Building tdom with target all
        --->  Staging tdom into destroot
        
        be sure that /opt/local/lib is included in your TCL path:
        tcsh: setenv TCLLIBPATH "$TCLLIBPATH /opt/local/lib"
        bash: export TCLLIBPATH="$TCLLIBPATH /opt/local/lib"
        --->  Packaging tgz archive for tdom 0.8.0_0
        --->  Installing tdom 0.8.0_0
        --->  Activating tdom 0.8.0_0
        --->  Cleaning tdom
        --->  Fetching openacs
        --->  Attempting to fetch openacs-5.1.5.tar.gz from http://openacs.org/projects/openacs/download/download/
        --->  Verifying checksum(s) for openacs
        --->  Extracting openacs
        --->  Applying patches to openacs
        --->  Configuring openacs
        --->  Building openacs with target all
        --->  Staging openacs into destroot
        --->  Packaging tgz archive for openacs 5.1.5_0
        --->  Installing openacs 5.1.5_0
        --->  Activating openacs 5.1.5_0
        Running the OpenACS install script. (could take 10-15 minutes)
        OpenACS should now be running with the following settings:
        url:          http://127.0.0.1
        serverroot:   /opt/local/openacs/service0
        logs:         /opt/local/openacs/service0/log
        PID files:    /opt/local/aolserver/log
        admin user:   admin@localhost
        admin passwd: 1
        UNIX uid:     service0
        UNIX gid:     web
        
        Adjust AOLserver settings in /opt/local/openacs/service0/etc/config.tcl
        Adjust OpenACS settings through the web interface.
        --->  Cleaning openacs
        :~$ 

Be patient once the install script starts running. It takes a **long**
time. Again, this is just a quick and dirty way of trying out OpenACS. I'd
be happy to hear any comments or questions.

------

[1]: http://en.wikipedia.org/wiki/DarwinPorts "Darwinports on Wikipedia"
[2]: http://openacs.org/doc/openacs-5-1/complete-install.html "OpenACS Documentation"
[3]: /files/openacs-dports.tgz "OpenACS dport"

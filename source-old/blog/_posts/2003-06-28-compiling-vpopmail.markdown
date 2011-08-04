---
date: 2003/06/28 00:00:00
layout: post
title: compiling vpopmail
tags: sysadmin mail
---

I'm setting up [vpopmail](http://inter7.com/vpopmail.html) 5.2.1 - a POP3 email manager for qmail, but it won't compile out of the box.

    gcc -I. -Icdb -g -O2 -Wall -c vconvert.c 
    In file included from vconvert.c:35: vmysql.h:53:22: missing terminating " character 
    vmysql.h:60:35: missing terminating " character 
    make[2]: *** [vconvert.o] Error 1 
    make[2]: Leaving directory `/usr/local/src/vpopmail-5.2.1' 
    make[1]: *** [all-recursive] Error 1 
    make[1]: Leaving directory `/usr/local/src/vpopmail-5.2.1' 
    make: *** [all-recursive-am] Error 2 

Whenever `make` gives you an error, look for the first error you can find. Any errors after that often fix themselves once you fix the first error.  The relevant code is here, (vmysql.h, starting at line 42):

    42: #ifdef CLEAR_PASS 
    43: #define TABLE_LAYOUT "pw_name char(32) not null, \ 
    44: pw_domain char(64) not NULL, \ 
    45: pw_passwd char(40), \ 
    46: pw_uid int, pw_gid int, \ 
    47: pw_gecos char(48), \ 
    48: pw_dir char(160), \ 
    49: pw_shell char(20), \ 
    50: pw_clear_passwd char(16), \ 
    51: primary key (pw_name, pw_domain ) " 
    52: #else 
    53: #define TABLE_LAYOUT "pw_name char(32) not null, \ 
    54: pw_domain char(64) not null, 
    55: pw_passwd char(40), \ 
    56: pw_uid int, pw_gid int, \ 
    57: pw_gecos char(48), \ 
    58: pw_dir char(160), 
    59: pw_shell char(20), \ 
    60: primary key (pw_name, pw_domain ) " 
    61: #endif

Looking around line 53, I see that line 54 and line 58 are missing backslashes - adding 'em back in fixes the error. The interesting thing to me is that version 5.2.1 has been out for over a year and, according to [an email on the vpopmail list](http://www.mail-archive.com/vchkpw@inter7.com/msg12238.html), this error still persists in more recent versions. How come this bug hasn't bitten anyone else? I suppose it's because the install docs recommend setting CLEAR_PASS (see line 42), which would cause the compiler to miss the bug. Or maybe I'm just lucky

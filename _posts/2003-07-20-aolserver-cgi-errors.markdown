---
date: 2003/07/20 00:00:00
layout: post
title: "AOLserver CGI errors"
categories: aolserver, web, programming
---

Scenario: You're trying to run a CGI program under AOLserver and you see this in your error log: 

    19/Jul/2003:00:00:23     Error: exec /home/vinod/cgi-bin/mt: execve() failed: Permission denied
    19/Jul/2003:00:00:23     Error: waitpid(-3) failed: No child processes
    19/Jul/2003:00:00:23     Error: nscgi: wait for /home/vinod/cgi-bin/mt failed: No child processes

I'm trying to run `/home/vinod/cgi-bin/mt/mt.cgi`. Why isn't this working? Because I need to tell AOLserver about each and every directory which might contain CGI programs.

So I need to change my `nsd.tcl` from:

    ns_section "ns/server/${server}/module/nscgi"
    ns_param   map "GET  /cgi-bin /home/${user_account}/cgi-bin/" 
    ns_param   map "POST /cgi-bin /home/${user_account}/cgi-bin/" 
    ns_param   Interps CGIinterps

to

    ns_section "ns/server/${server}/module/nscgi"
    ns_param   map "GET  /cgi-bin /home/${user_account}/cgi-bin/"
    ns_param   map "POST /cgi-bin /home/${user_account}/cgi-bin/"
    ns_param   map "GET  /cgi-bin/mt /home/${user_account}/cgi-bin/mt" 
    ns_param   map "POST /cgi-bin/mt /home/${user_account}/cgi-bin/mt" 
    ns_param   Interps CGIinterps

Problem solved. Further reading: [http://jongriffin.com/static/consultant/nscgi](http://jongriffin.com/static/consultant/nscgi) -  sure wish I had read that before I started messing with ns_cgi.

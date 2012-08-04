---
date: 2006/02/17 00:00:00
layout: post
title: "Pound update kills my website"
categories: linux sysadmin pound debian troubleshooting
---

No one but me noticed, I'm sure, but my website was down for part of yesterday. Don't worry, refunds to paying customers are on their way :-)

What happened? I was doing my regular debian <code>apt-get upgrade</code> and the reverse proxy that I use, [pound](http://www.apsis.ch/pound/), got updated. The upgrade was a pretty significant one. Pound 2.0 changed the way that it expects configuration files to be formatted. Unfortunately, the Debian update didn't mention this, so the new version of pound tried to read my old config file, got confused and shut down. Without a reverse proxy, there's no way to get to my site from the outside.

I thought it would be simple to rewrite the config file to match the new format, but it took longer than I expected. Most of the changes were easy. The new format requires string parameters to be enclosed in double-quotes. Some of the parameters which used to be global (like ExtendedHTTP and WebDAV) were renamed and moved into non-global sections. There were a few other minor changes which make the config file easier to understand.

Unfortunately, fixing all of that still didn't get Pound working. There were still 2 problems. First was that the internal port number was being shown to the web browser. If you typed in "http://kurup.org", the browser would show "http://kurup.org:8001/" in the Location bar. This only occured when the backend server returned 30x redirection status's. Based on my config, Pound was supposed to be rewriting the Location header to avoid this problem. I found the solution to this one [here](http://www.apsis.ch/pound/pound_list/archive/2006/2006-01/1136458627000#1136458627000). Scroll down to Robert Segall's (the author of Pound) second reply. He says:

> The conditions for changing the Location header are: 
> - Change30x is set (value 1) for the Service in question
> - the response is one of 301, 302, 303 or 307
> - a Host header was seen in the original request
> - the Location header, after DNS resolution, points either to the same address as the one Pound is using to accept the request (aka the ListenHTTP/ListenHTTPS), or to the back-end that issued this response

Everything was being fulfilled except the last one, specifically the 'After DNS resolution' part. When I do a <code>nslookup kurup.org</code> on my server, it returns 66.98.222.124. The address I was using in the config file was 127.0.0.1 (localhost). Since these didn't match, Pound was not rewriting the header. I changed my pound config to listen on 66.98.222.124 and that problem was fixed.

The final problem was that pound stopped redirecting requests to the other virtual servers on my machine. Whenever a request would come in, pound would crash with the following message in syslog:

    Feb 17 08:11:10 vkurup pound: MONITOR: worker exited on signal 11, restarting... 

The only difference between the config for kurup.org and the other virtual servers was that I had a SESSION parameter in kurup.org. I introduced a SESSION parameter into the other servers and *surprise*, they started working too. I finally found the reason [here.](http://www.apsis.ch/pound/pound_list/archive/2006/2006-02/1139101111000#1139101111000) I assume that will be fixed in the next release.

---
categories:
- postgresql
- emacs
- programming
date: '2003-06-24T00:00:00'
permalink: /blog/2003/06/24/psql-doesnt-like-tabs
title: psql doesn't like tabs
---


psql doesn't deal well with tabs. If you feed it a function that has tabs  in it, and then call that function, you'll often get this:  `ERROR:  parser: parse error at or near "for" at character 15`.  Thus, if you ever see this in your error log, it's time to `M-x untabify`.

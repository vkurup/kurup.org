---
date: 2003/06/24 00:00:00
layout: post
title: psql doesn't like tabs
permalink: /blog/2003/06/24/psql-doesnt-like-tabs
tags: postgresql emacs programming
---

psql doesn't deal well with tabs. If you feed it a function that has tabs  in it, and then call that function, you'll often get this:  `ERROR:  parser: parse error at or near "for" at character 15`.  Thus, if you ever see this in your error log, it's time to `M-x untabify`.

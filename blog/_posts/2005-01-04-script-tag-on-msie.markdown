---
date: 2005/01/04 00:00:00
layout: post
title: "SCRIPT Tag on MSIE"
tags: web
---

Word to the wise. MSIE5 (Mac) doesn't like:

     &lt;script type="blah" src="blah" /&gt; 

It only likes:

     &lt;script type="blah" src="blah&gt;&lt;/script&gt;

It's quite stubborn. If you try the first example, it will refuse to show any of your page.

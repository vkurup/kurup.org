---
date: 2011/05/16 20:44:12
layout: post
title: Android ResourcesNotFoundException
categories: android programming
---

If you see this error:

    E/AndroidRuntime(  457): android.content.res.Resources$NotFoundException:
    File Yamba1 from xml type layout resource ID #0x7f060000

... try deleting the `bin/` and `gen/` directories in your app. It should
clear the error.

Reference: [http://code.google.com/p/android/issues/detail?id=2726#c6](http://code.google.com/p/android/issues/detail?id=2726#c6)

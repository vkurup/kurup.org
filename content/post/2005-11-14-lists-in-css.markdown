---
categories:
- web
- programming
- design
- css
date: '2005-11-14T00:00:00'
title: Lists in CSS
---


A-ha! This [article by Eric Meyer](http://www.meyerweb.com/eric/css/list-indent.html) explains why &lt;ul> and &lt;ol>'s can appear differently in MSIE and Mozilla browsers. Both indent the list items, but MSIE does so by setting the padding to 2.5 em, while Mozilla does so by setting the margin to 2.5 em. These are on the &lt;ul> and &lt;ol> selectors, not the &lt;li>. So, in order to get consistent display on both browsers, you need to set both padding-left and margin-left to whatever you want.

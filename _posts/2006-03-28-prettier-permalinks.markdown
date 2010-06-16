---
date: 2006/03/28 00:00:00
layout: post
title: "Prettier permalinks"
categories: blog, web, permalink, openacs
---

Permalink stands for 'permanent link'. When you create a blog post, it gets added to the top of your blog, pushing older entries down. Eventually, posts get pushed off the front page, so it's important that you have a way to refer to old blog posts. A permalink is the link that will always point to a specific post.

OpenACS (lars-blogger) permalinks look like this:

    http://kurup.org/blog/one-entry?entry_id=58950

This works and it's really easy to code, but it doesn't give much information about the content or date of the post.

A lot of other blog packages use permalinks which look like this:

    http://kurup.org/blog/2006/03/01/tag-cloud

It's easy to tell how old the post is, and what it might be about. More importantly, it seems that search engines give URLs like this more weight. So, I've gone ahead and made the changes on my blog. Enjoy!

For the OpenACS geeks, here's [the changes that I made](http://kurup.org/acs/blog_permalink). It won't necessarily apply cleanly against OpenACS, but it will give you an idea of what to change. It includes an automated test to assure you that both the old and new permalinks work.


---
date: 2011/05/20 20:58:06
layout: post
title: gitignore
tags: programming
---

I found this great github project. It's just a [list of .gitignore
files](https://github.com/github/gitignore) for various languages and
platforms, but it's nice to have them all in one place. The
`.gitignore` file is, like it sounds, a list of files or directories
that you don't want to be included in version control. For Android,
for example, the `bin/` and `gen/` directories are generated each time
you compile, so you don't want to include that. Especially, as [I
learned](/blog/2011/05/16/android-resourcesnotfoundexception/),
because it will give you errors when you run a project created on one
computer, on a different computer. The Android `.gitignore` from
github unfortunately didn't have `bin/` or `gen/` (or
`local.properties`) in there, so I put them in and was about to send
them a pull request, when I found someone else had made the same
changes a few days ago already. Which makes me feel better that I was
on the right path. Go Open Source!


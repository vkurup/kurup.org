---
date: 2020-12-10T16:48:35
title: Disk Space Hogs
categories:
- cheatsheet
- ubuntu
- linux
---

Find disk space hogs:
```
sudo du -h -d 3 / | grep "^[0-9.]*G"
```

... which helped me find the command in
[yesterday's post](/blog/2020/12/09/deleting-old-snaps/). You can add directories
after the slash to drill down to your heart's content.

---
date: 2020-12-09T16:41:00
title: Deleting old snaps
categories:
- cheatsheet
- ubuntu
- linux
---

Copy this script into `~/bin/`:
```
#!/bin/bash
# Removes old revisions of snaps
# CLOSE ALL SNAPS BEFORE RUNNING THIS
set -ex

LANG=en_US.UTF-8 snap list --all | awk '/disabled/{print $1, $3}' |
    while read snapname revision; do
        sudo snap remove "$snapname" --revision="$revision"
    done
```

Found on
https://www.linuxuprising.com/2019/04/how-to-remove-old-snap-versions-to-free.html and
slightly edited.

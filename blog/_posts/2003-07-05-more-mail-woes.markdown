---
layout: post
title: "More Mail Woes"
tags: [sysadmin, mail]
---

I spent most of this afternoon struggling with a mail issue and I didn't find it documented well anywhere else, so I'm going to write about it here in the hopes that it might help someone else.

**What I was trying to do:** Setup qmail + vpopmail + courier imap for imap and pop3d

**Problem I was having:** For some users, checking POP3 mail would work for a while (about 5 minutes), but then would fail: 

          Jul  5 00:30:34 vkurup pop3d: LOGIN FAILED, ip=[::ffff:68.173.27.35]
          Jul  5 00:30:34 vkurup pop3d: Disconnected, ip=[::ffff:68.173.27.35]

The failure would only happen for users who had vpopmail accounts **and** shell accounts. Users who have only vpopmail accounts were fine.

Eventually, after much searching, I found this [message](http://bluedot.net/mail/archive/read.php?f=2&amp;i=10881&amp;t=10880) which advised to configure courier-imap with `--without-authdaemon`. This solved my problem.

According to the author of courier-imap, [this problem is solved in newer versions of vpopmail](http://sourceforge.net/mailarchive/forum.php?thread_id=2388144&amp;forum_id=33081), but he mentions version 5.3.38 and I could only find version 5.3.20, so I didn't try that fix.

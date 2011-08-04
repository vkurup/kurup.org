---
date: 2004/03/08 00:00:00
layout: post
title: "Don't use \"Archive and Install\""
categories: mac-os-x installation
---

Thanks to the fine folks at [badgertronics](http://badgertronics.com/blog), I was able to upgrade my Powerbook to Panther free-of-charge. I initially did an "Archive and Install" upgrade, as recommended by the upgrade guide at [TidBITS](http://www.tidbits.com/takecontrol/#upgrading) (easily worth the measly $5, IMHO). But soon after the install, I noticed that my system seemed a lot slower. I couldn't pinpoint a specific problem, but things just seemed sluggish. I definitely noticed that DNS seemed to be broken. I was moved to act when I noticed that my IMAP client ([offlineimap](http://gopher.quux.org:70/devel/offlineimap)) took 15 minutes to sync 48 IMAP Maildirs between my Mac and my server. According to the offlineimap docs, syncing 50 Maildir folders should take around 3 seconds. Hmmm.... that seems a little wrong.

I searched the Internet but was unable to find a specific fix for this problem. A few posters intimated that doing a fresh "Erase and Install" of Mac OS X 10.3 was better than using the "Archive and Install" option. So, this weekend, I backed up my HD using [Carbon Copy Cloner](http://www.bombich.com/software/ccc.html), erased my HD, and did a fresh install of Mac OS X Panther.

As expected, everything is quick and zippy again. A sync of my IMAP folders takes 15 seconds now, as opposed to 15 *minutes*. While I'm happy with the result, I wish I could figure out why the "Archive and Install" option resulted in such a poor outcome.

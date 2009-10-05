---
layout: post
title: "Backup strategy"
tags: [rsync, backup, strategy]
---

[Badgertronics.com](http://badgertronics.com), [borkware.com](http://borkware.com), and company went through the same ordeal that [kurup.org](http://kurup.org/blog/one-entry?entry%5fid=9660) did and MarkD has promptly published his [new backup strategy](http://borkware.com/rants/rsync-backups/). He uses [rsync](http://rsync.samba.org/) over [SSH](http://www.openssh.com/) which, interestingly enough, is the same strategy that I came up with. Great minds must think alike.

The canonical standard for doing backups on UNIX systems is tar (short for **t**ape **ar**chive). tar converts directories of files into a single tar archive file which you would then spit to an attached tape drive. To be up-to-date, you need to do this on a regular basis - perhaps daily. So each day, you'd tar up all your important files and send them off to the tape drive. To recover your files, you'd need to read the whole tar archive file back from the tape and then extract the specific files or directories that you want from the tar archive. This works fine if you're backing up to a tape drive, because you don't care about network bandwidth. If you're backing up over the network to another machine's hard drive, then each daily archive file has to be sent over the network to your backup machine. Even if you don't change any files from one day to the next, the entire set of files gets archived and sent across the network. Bye bye precious bandwidth!

rsync is a **r**emote **sync**hronization tool. The first time, rsync sends all the data over the network to your backup machine. Just like tar. The benefit comes the next time you backup. Instead of sending all the files again, rsync only transfers files that have been changed. If no files were changed, no files get transferred. And when you want to recover data, you transfer just the specific files that you want back to your machine (using rsync or scp or telnet or whatever).

Note that rsync also works better than an incremental backup strategy using tar. You can use tar to do a full backup weekly and incremental backups daily. Incremental backups backup just files which have changed since yesterday's backup. This will improve bandwidth usage, but makes recovery more complex. You have to extract the latest full backup, then extract any more recent incremental backups over your full backup and then extract the specific files that you need. On the other hand, the backup produced with rsync is always up-to-date (as of the last time you ran rsync).

There are lots of backup tools that use rsync as their workhorse and add features on top of it. [rdiff-backup](http://rdiff-backup.stanford.edu/) makes regularly scheduled backups, but each time it runs, it keeps a copy of the changes to any files which have changed (i.e. the diff's) as well as the date and time of those changes. So, while the backup filesystem is a perfect mirror of your system, a few extra commands can give you a copy of your filesystem as it was, say, 5 days ago. rdiff-backup takes the backup filesystem and applies any diffs that occurred over the past five days. Diff files only record changes from one version of a file to another, so they are very small (in proportion to the entire backup). This allows rdiff-backup to provide snapshots of your system at almost any time without using a significant amount of disk space.

I tried rdiff-backup and it works great for Linux to Linux backups, but it gave me trouble when I tried to backup Linux to Mac OS X. Linux uses a case-sensitive filesystem (ext2). You can have the files `foo` and `FOO` in the same directory and Linux treats them as different files. Mac OS X's file system is case-insensitive, so if you make a file `FOO`, it will overwrite a file `foo` in the same directory. rdiff-backup tries to take this into account by quoting any filename with capital letters in it. Unfortunately, the most recent version from CVS (as of 2004-01-01) [doesn't properly unquote them](http://lists.gnu.org/archive/html/rdiff-backup-users/2003-12/msg00045.html). Even if it did work properly, it ruins one of the main benefits of using rsync - having a true mirror of your system. Now instead of having a file `README` in your backup, you have a file `;082;069;065;068;077;069` (that's `README` quoted). I can no longer just scp a directory from my Mac backup machine to my linux server. I have to use rdiff-backup to do the transfer so that it gets properly unquoted. I would prefer to be able to turn the quoting stuff off completely. If you're crazy enough to have 2 files in a Linux directory with the same name, but just capitalized differently, you're just asking for trouble.

I also realized that rdiff-backup is overkill for what I need. If I really want to be able to recover a file that I deleted 5 days ago, I should be using CVS for that data. My backups are there simply for unexpected data loss.

So, I'm currently using plain rsync over SSH. I do 2 things to prepare my system before running rsync. First, I run `dpkg --get-selections` to dump a list of my installed Debian packages. When recovering my system, I can feed that file to `dpkg --set-selections` and then run `apt-get dselect-upgrade` to get all my packages set up as I had before. So, I put this in my crontab:

     # save apt selections 00 20 * * *  /usr/bin/dpkg --get-selections > /home/vinod/apt-settings/dpkg-selections

The other thing I need to do is to dump my Postgres databasse. I currently do this from a scheduled procedure in AOLserver as documented at the bottom of the [OpenACS 4.6.3 documentation](http://openacs.org/doc/openacs-4-6-3/backup-recovery.html).

Finally, we get to rsync. Like MarkD, I'm going to run rsync from my Mac and pull the data from the Linux server over to the Mac. Unlike MarkD, I'm going to run rsync as my root user so that I can preserve users and groups of my `/etc` files. Here's my root crontab entry on my Mac (split into multiple lines for reading convenience):

    00 21 * * * rsync -av --numeric-ids --delete --delete-excluded
       --exclude-from=/Users/vinod/backup/acorn_exclude -e ssh acorn:/
       /Users/vinod/backup/acorn/latest >> /Users/vinod/backup/backup.log

The `'v'` option is for verbose, which I'll turn off eventually once I know things are working well. The `--numeric-ids` option preserves the user and group ids as numeric ids rather than trying to use user/group names from my Mac. the `--delete` and `--delete-excluded` make sure that files deleted on the Linux server are also deleted in the backup. The `--exclude-from` reads `/Users/vinod/backup/acorn_exclude` and follows its instructions as to which files to backup. I'll talk about that next. The `-e` option says to use SSH to transfer the data. Finally the last two options say to get the data from host acorn (set to vkurup.acornhosting.net in `/etc/hosts`) and rsync it to `/Users/vinod/backup/acorn/latest`. To see exactly what files rsync is excluding or including, add another `-v` option to rsync. Also useful is the `-n` option, which tells rsync to show you what it would do without actually transferring anything.

Here's what my exclude file looks like:

    - *~
    + /etc 
    - /home/vinod/web/kurup/log 
    + /home 
    + /root 
    + /usr 
    + /usr/local 
    - /usr/* 
    - /var/lib/courier 
    - /var/lib/postgres/data 
    + /var 
    + /var/lib 
    - /var/* 
    - /*

The rsync exclude syntax allows you to backup just the files you want. I'll just discuss a couple examples, so you should see the manpage for more details. Line 1 says to ignore any emacs backup files. Line 3 says to ignore `/home/vinod/web/kurup/log` while Line 4 says to include everything else in the `/home` directory. Conversely, line 7 says to include `/usr/local` (and everything in it), while Line 8 says to ignore anything else in the `/usr` directory. Line 6 is important. If you didn't include it, nothing in `/usr/local` would get included. Each filename is checked against this list, but in a recursive fashion. So if rsync is working on the file `/usr/local/foo`, it first looks for a pattern that matches `/usr`, then for a pattern that matches `/usr/local`, then finally for a pattern that matches `/usr/local/foo`. It uses the first pattern that matches. So, if you didn't include line 6, the search for `/usr` would fine line 8 and stop, thus excluding everything in `/usr/local`. Not what you want. I know that was confusing - recursion always makes my head spin...

OK, the final thing is to set up SSH properly. I basically set it up like MarkD did, but since I need to login as root, I wanted to add a few more constraints. You can set up SSH to restrict a specific key to only run a certain command. So if someone somehow gets access to my key, they'll only be able to run rsync. If you don't put the command restriction in, they'll be able to login to your server as root. To add restraints to a key, add some statements to the beginning of the key in authorized_keys2. Here's my `/root/.ssh/authorized_keys2` (split onto multiple lines):

    command="rsync --server --sender -vlogDtpr --delete-excluded --numeric-ids . /"  
    ssh-rsa AAAAB....<snip> ...t8= root@Vinod-Kurups-Computer.local. 

To get the proper command to put in your command="" statement, run your rsync command with an unrestricted SSH key first (i.e. just copy the id_rsa.pub to authorized_keys2). When you run the rsync command on your Mac, do a `ps auxw | grep rsync` on the server machine. The command that you see listed is the command that goes in the key.

After reading MarkD's article, the one thing I might change is to tar up the data on the Linux server that needs its user/group info preserved (`/etc`, `/root`, and `/usr/local`) and then store that on the server in my user's home directory. I then wouldn't have to rsync as root, so it would simplify things. The drawback is that anytime anything changed in any of those directories, I'd be backing up the entire directories again. Hopefully this would be mitigated by the fact that they wouldn't change often and since they're mostly text files, they compress well.

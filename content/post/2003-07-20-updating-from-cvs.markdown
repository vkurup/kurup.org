---
categories:
- openacs
- version-control
- programming
date: '2003-07-20T00:00:00'
title: Updating from CVS
---


Here's the steps I take in order to update my site from the latest OpenACS CVS. All of this info comes from [Andrew Piskorski's great CVS page](http://piskorski.com/docs/cvs-conventions.html) or from pages listed in his document.

1. Make sure that I've committed all the local changes that I've made. 

    vinod:~$ cd web/kurup 
    vinod:~/web/kurup$ cvs commit -m "Fixed foo, bar and blah" 

2. Go into the directory containing my OpenACS CVS checkout and grab the latest sources. I'm using the `oacs-4-6` branch. 

    vinod:~/web/kurup$ cd ~/web/openacs-4 
    vinod:~/web/openacs-4$ cvs update -r oacs-4-6 

3. Import the code into a vendor branch. My repository name is `kurup`. `OpenACS` is the vendor tag.

    vinod:~/web/openacs-4$ cvs -d /var/lib/cvs \ 
         import -m "importing latest OpenACS 4.6 branch" \
         kurup OpenACS openacs-4-6-3-20030719 

4. This produces the usual CVS scroll and then a message like this: 

    7 conflicts created by this import. Use the following command to help the merge:
    cvs -d /var/lib/cvs checkout -j&lt;prev_rel_tag&gt; \ 
    jopenacs-4-6-3-20030719 kurup 

5. Follow the instructions just given above. This will checkout a full set of code into the `kurup` directory, while simultaneously merging the new imported code in. 

    vinod@vkurup:~/web/openacs-4$ cd 
    vinod@vkurup:~$ mkdir tmp 
    vinod@vkurup:~$ cd tmp 
    vinod@vkurup:~/tmp$ cvs -d /var/lib/cvs checkout \ 
         -jOpenACS:yesterday \
         jopenacs-4-6-3-20030719 kurup 

6. Go through and fix all the conflicts. This is the part that I sometimes find confusing. How to find the files that have conflicts? The command in instruction #3 above will list conflict files with a C in front of the filename. Check each file that has a C in front of it. This is why I like to do this process inside an emacs shell, so that I can look over the output as needed. For example, one piece of my listing looked like this: 

    U kurup/packages/lars-blogger/www/blog-oracle.xql 
    U kurup/packages/lars-blogger/www/blog.adp 
    C kurup/packages/lars-blogger/www/blog.tcl 
    U kurup/packages/lars-blogger/www/calendar-oracle.xql 

So, I need to check ~/tmp/kurup/packages/lars-blogger/www/blog.tcl, look for conflict markers and resolve any conflicts. Do this for every file marked 'C' in your listing. 

7. Commit my work. 
   
    vinod:~/tmp$ cd kurup 
    vinod:~/tmp/kurup$ cvs commit \
         -m "merged with openacs-4-6-3-20030719, conflicts resolved" 

8. Blow away that tmp checkout 

    vinod:~/tmp/kurup$ cd 
    vinod:~$ rm -r tmp 

9. Update my local checkout 

    vinod:~$ cd web/kurup 
    vinod:~/web/kurup$ cvs update 

10. Restart my server. 

    vinod:~$ svc -t /service/master 

11. Once the server is back up, I visit `http://kurup.org/acs-admin/apm` with my broswer and click on 'Install Packages'. I look for any packages that are listed as 'Upgrade'. Click on these packages and follow the instructions to perform any needed upgrades. This is always a touchy process because if the upgrade script errors out, your server may be left in an in-between state. Hope and pray liberally. 

12. Repeat as needed, maybe monthly, or whenever there's a new feature/bugfix available that you need.


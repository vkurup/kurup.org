What is this?
-------------

This is the source code for my website at [https://www.kurup.org/](https://www.kurup.org). It is a
Hugo generated site, using the [Hugo-Octopress](https://themes.gohugo.io/hugo-octopress/) theme. (It
used to be an Octopress site).

Local Setup
===========

#. [Install hugo](https://gohugo.io/getting-started/installing/)


Dokku setup
===========

#. Make sure that your SSH config for dokku is set up:

     Host dokku
       Hostname git.drkurup.com
       User dokku
       RequestTTY yes

#. create the app:

     ssh dokku apps:create 0www  # named this way so it is alpha first, therefore default for dokku
     ssh dokku apps:create kurup-staging
     ssh dokku git:set kurup-staging deploy-branch develop

#. add the dokku git remote for production:

     git remote add prod dokku@git.drkurup.com:0www
     git push prod master

#. add the dokku git remote for staging:

     git remote add staging dokku@git.drkurup.com:kurup-staging
     git push staging develop

#. add domains:

     ssh dokku domains:add 0www www.kurup.org
     ssh dokku domains:add 0www kurup.org


Site changes
============

#. Make the changes in the `content` directory. Build the site and view it at localhost:1313:

     hugo server -D

#. Fully build the site:

     hugo

#. When you're satisfied, commit to develop and push develop to staging:

     git push staging develop

#. When you're satisfied with staging, merge develop to master and push master to prod:

     git push prod master

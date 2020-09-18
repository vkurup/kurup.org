What is this?
-------------

This is the source code for my website at [https://www.kurup.org/](https://www.kurup.org). It is a
Hugo generated site, using the [Hugo-Octopress](https://themes.gohugo.io/hugo-octopress/) theme. (It
used to be an Octopress site).

Local Setup
===========

#. [Install hugo](https://gohugo.io/getting-started/installing/)


Github pages setup
==================

Followed this: https://gohugo.io/hosting-and-deployment/hosting-on-github/

TODO: remove git remotes that I am not using

Site changes
============

#. Make the changes in the `content` directory. Build the site and view it at localhost:1313:

     hugo server -D

#. Fully build the site:

     hugo

#. When you're satisfied, push to github pages:

     ./deploy.sh

#. Commit and push the source chnages

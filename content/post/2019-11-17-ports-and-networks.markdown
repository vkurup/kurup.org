---
title: "Ports and networks"
date: 2019-11-17T18:48:24-05:00
categories:
- family
- programming
---

Kavi was looking over my shoulder as I tried to get my blog working in a local Docker container.
I've gotten to the point that the site seems to be up and running in the container, but I can't seem
to get to it from my laptop. So, he wondered why I was putting port 1313 in my URL bar
("localhost:1313") and then I showed the results of `netstat -ant` to prove that something should be
listening on that port. And we got the IP address for google.com and then put that in Chrome's URL
bar with `:80` at the end of it, and magically, it worked. (Other websites did not work, and I
explained that most sites will not allow their sites to be accessed via IP address).

I still haven't figured out why I can't access the blog running in my container, but I think Kavi's
learning more about networking than I ever did (and I'm hoping that he'll be able to debug these
issues for me... soon enough)

<img src="https://media.giphy.com/media/YcVwQaBOtGGAw/giphy.gif">

UPDATE: I figured it out. Hugo's server was listening on localhost inside the container, when it
needed to be listening on 0.0.0.0. Adding that as a `--bind` parameter fixed the issue (though I had
to also add `--baseURL` and `--appendPort=false` params, which saddened me.)

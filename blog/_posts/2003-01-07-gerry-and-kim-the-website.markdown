---
layout: post
title: "Gerry and Kim - the website"
tags: [gerry, friends, wedding, web]
---

I finally finished [Gerry and Kim's wedding site](http://cherayil.kurup.org). The HTTP address is temporary. I had made a promise to Kim back in September that I would finish it, but that I needed a deadline. My brain seems to refuse to work without a deadline. Anyway, she said, "end of the year" and sure enough, it went live on 12/31/2002. It's running on [OpenACS 4](http://openacs.org) (CVS HEAD 12/25/2002), using an Open Source CSS stylesheet from [http://w3.org](http://www.w3.org). All comments welcome.

Developing this site using a comprehensive framework like OpenACS was certainly overkill. I started by using [PHPNuke](http://www.phpnuke.org/), [phpwebsite](http://phpwebsite.appstate.edu/) and then [MovableType](http://www.movabletype.org/). All of them would have been fine (as would my old favorite, Frontier). The thing is, none of these worked exactly as I want them out-of-the-box and I'd much rather customize OpenACS for my needs than wade through PHP or Perl. MovableType was the exception in this group as it worked exactly as advertised, but it's advertised as weblog software, which is not what I was building. I also wanted to test out OpenACS 4 since I've spent so much of my free time working on it. Like [Jeff said](http://xarg.net/blog/one-entry?entry%5fid=19296), you actually gotta _use_ the software before you figure out where it needs fixin'.

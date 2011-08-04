---
date: 2003/09/29 00:00:00
layout: post
title: "Why OpenACS?"
tags: openacs programming web
---

[Bhavesh](http://www.veshman.com/mt/index.php) responded to my [seemingly irrational exuberance about OpenACS](http://kurup.org/blog/one-entry?entry%5fid=9513) asking, "What's the excitement about OpenACS?"

There are much better answers to this question, starting with [Why OpenACS?](http://www.acornhosting.com/whyoacs), by my web host [Cathy Sarisky](http://www.acornhosting.com/), but here's my super brief answer.

OpenACS is a toolkit to build online communities, that is, sites which value  users and their contributions. OpenACS provides applications which allow users to create and manage content - applications like forums, photo albums, blogs, calendars, wikis, and file storage areas. Users can obviously create content in these areas, but they can also be given extra privileges to moderate the content or grant privileges to others. So, administrators can delegate the management of the site to those who are most invested in it - the community. Currently, OpenACS's main focus has been at [educational  institutions](http://dotlrn.org/) ([MIT](http://web.mit.edu/), [the University of Heidelberg](http://www.uni-heidelberg.de/index_e.html), and many others) where it's ideally suited for course management. It's currently not polished enough to be used out-of-the-box unless you're comfortable with Linux system adminstration, but [improvements are being made in that area](http://openacs.org/forums/message-view?message_id=117914).

[This site is built on OpenACS](http://kurup.org/content/site-info), but I barely scratch the surface of the features available. I plan to add more stuff soon, but [OpenACS is in the midst of releasing its next version](http://openacs.org/forums/message-view?message_id=125253), so I'm concentrating my extensive free time in that endeavor. Once OpenACS 5 is out, I'll upgrade this site and then add some of the bells and whistles.

To be honest, I'm not sure that OpenACS is the right application if you're just looking to build a personal website. [Movable Type](http://movabletype.org/) is much more suited to that purpose. OpenACS is useful when you want to allow a **bunch of users** to each have **complete control** over their own personal websites, yet also allow those users to interact with each other, perhaps even aggregating content from multiple users in one place. So, if you wanted to create a service that competed with [TypePad](http://blogs.com/), you could use OpenACS to do that. 

OpenACS's main power lies in the fine-grained control that it gives you. Every object and area can be controlled the way you want, so the level of control that users have is up to you. The database API is clean and gives you full access to the database of your choice - Oracle or PostgreSQL. Your hands aren't tied. The templating system is intuitive yet offers a lot of features for more complex, specific cases if needed. A lot of work is currently going into building and improving an automated testing framework. There are plenty of other reasons why I love OpenACS and I'll write about them some more as examples of them come up.

In short, OpenACS is the way for me to get things done on the web.

<div id="comment-box">
<h2>Comments from old site</h2>

<div class="one-comment">
<p><b>A unified package</b></p>
<p>
What I really like about it is that it has the common data model.  The
same user features, the same content features, are available
everywhere.  Try to glue together a PHP forum and a PHP shopping cart
made by two different groups and you're in for a good deal of work.

I'm also a fan of esoteric technologies.  I like using tools that work
well (Macs, postgresql, aolserver, qmail) rather than the tools
everyone uses, since the popular tools are usually extremely
feature-rich, but ugly as sin on the inside (Windows, Apache,
sendmail)
</p>
<address class="signature">
<span class="author">Mark Dalrymple</span>
<span class="date">2003-10-03 17:58:20</span>
</address>
</div>

<div class="my-comment">
<p><b>Can't believe I forgot to mention that!</b></p>
<p>
The consistent user-centered datamodel is key. I think some joker
wrote an <a
href="http://macedition.com/bolts/bolts_20030207.php">excellent
article about OpenACS and its strong points.</a> I really meant to
point to that article in my post, since it succintly describes
everything that I was trying to say. :-)
</p>
<address class="signature">
<span class="author">Vinod Kurup</span>
<span class="date">2003-10-06 13:48:18</span>
</address>
</div>

<div class="one-comment">
<p><b>oh yeah</b></p>
<p>
you can ignore that thing.  the guy that wrote it is a big jerk.  And
he looks funny.  And he drools.
</p>
<address class="signature">
<span class="author">Mark Dalrymple</span>
<span class="date">2003-10-07 22:39:46</span>
</address>
</div>

</div>

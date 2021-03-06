---
categories:
- blog
- web
- permalink
- openacs
- programming
date: '2006-03-28T00:00:00'
title: Prettier permalinks
---


Permalink stands for 'permanent link'. When you create a blog post, it gets added to the top of your blog, pushing older entries down. Eventually, posts get pushed off the front page, so it's important that you have a way to refer to old blog posts. A permalink is the link that will always point to a specific post.

OpenACS (lars-blogger) permalinks look like this:

    http://kurup.org/blog/one-entry?entry_id=58950

This works and it's really easy to code, but it doesn't give much information about the content or date of the post.

A lot of other blog packages use permalinks which look like this:

    http://kurup.org/blog/2006/03/01/tag-cloud

It's easy to tell how old the post is, and what it might be about. More importantly, it seems that search engines give URLs like this more weight. So, I've gone ahead and made the changes on my blog. Enjoy!

For the OpenACS geeks, here's [the changes that I made](http://kurup.org/acs/blog_permalink). It won't necessarily apply cleanly against OpenACS, but it will give you an idea of what to change. It includes an automated test to assure you that both the old and new permalinks work.

<div id="comment-box">
<h2>Comments from old site</h2>

<div class="one-comment">
<p><b>Just don't use the same title twice in one day</b></p>
<p>
You'll end up with ambiguous urls. The util_text_to_url proc can
disambiguate a list of urls for you, and then you'd need to store the
new url in the db.
</p>
<p>
That would also avoid the whole list/loop shenanegins. It would also
be easy to write a little script to go through your existing db and
create the urls for existing blog entries.
</p>
<p>
But that might be considered hard work ;)
</p>
<address class="signature">
<span class="author">Mark Aufflick</span>
<span class="date">2006-05-05 07:11:24</span>
</address>
</div>

<div class="my-comment">
<p><b>Excellent point</b></p>
<p>
I thought about that briefly while I wrote this, but figured, "What
are the chances that I'd write 2 posts in the same day with the same
title?" In other words, I took the easy way out.
</p>
<p>
But adding the permalink to the DB does sound like the right thing to
do, so I'll work on it or head over to <a
href="http://mark.aufflick.com/blog/2006/05/05/friendly-blog-links">your
blog</a> and beg for your code :-)
</p>
<address class="signature">
<span class="author">Vinod Kurup</span>
<span class="date">2006-05-05 16:35:41</span>
</address>
</div>

</div>

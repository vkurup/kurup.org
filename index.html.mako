<%inherit file="_templates/site.mako" />

<p>
Welcome to my home page! (Yes, I know it's 2010, but I still call it my
home page). I'm probably the luckiest guy in the world, with a <a href="/wedding">beautiful
wife</a> and 2 sweet, life-loving kids to prove it. I am a
hospitalist working at a community hospital in North Carolina. I am also a
(free software) programmer, writer, runner, foodie, new homeowner, reader,
investor, in addition to about a hundred other things. I'm basically a
wannabee Renaissance Man. On these pages, you can find out more about those
interests.
</p>

<div class="section">

<h1><a href="/blog">Blog</a></h1>

I have been irregularly blogging for over ten years. A good percentage of
my posts seem to be apologies for not posting more often. Still, you may
find something interesting on my <a href="/blog">blog</a>. Recent posts include:
<ul class="compact recent">
% for post in bf.config.blog.posts[:5]:
    <li><a href="${post.path}" title="${post.excerpt}">${post.title}</a>
	<span class="date">${ post.date }</span> </li>
% endfor
</ul>

</div>

<div class="section">
<h1><a href="http://twitter.com/vkurup">Twitter</a></h1>

Contacting Twitter... 
{:#twitter_update_list }

</div>

<div class="section">
<h1><a href="http://picasaweb.google.com/vvkurup">Picasa</a></h1>

<embed type="application/x-shockwave-flash" src="http://picasaweb.google.com/s/c/bin/slideshow.swf" width="320" height="212" flashvars="host=picasaweb.google.com&captions=1&hl=en_US&feat=flashalbum&RGB=0x000000&feed=http%3A%2F%2Fpicasaweb.google.com%2Fdata%2Ffeed%2Fapi%2Fuser%2Fvvkurup%3Falt%3Drss%26kind%3Dphoto%26access%3Dpublic%26psc%3DF%26q%26uname%3Dvvkurup" pluginspage="http://www.macromedia.com/go/getflashplayer"></embed>

</div>

<div class="section">
<h1><a href="http://www.youtube.com/vkurup1">YouTube</a></h1>

<script src="http://www.gmodules.com/ig/ifr?url=http://www.google.com/ig/modules/youtube.xml&amp;up_channel=vkurup1&amp;synd=open&amp;w=320&amp;h=390&amp;title=&amp;border=%23ffffff%7C3px%2C1px+solid+%23999999&amp;output=js"> </script>

</div>

<div class="section">
<h1><a href="http://www.delicious.com/vkurup">Delicious</a></h1>

<script type="text/javascript" src="http://feeds.delicious.com/v2/js/vkurup?title=&count=5&sort=date&tags&extended"> </script>

</div>

<div class="section">
<h1>Interweb</h1>

<ul>
<li><a href="http://facebook.com/vvkurup">Facebook</a></li>
<li><a href="http://friendfeed.com/vkurup">FriendFeed</a></li>
<li><a href="http://openacs.org/forums/user-history?user_id=7027">OpenACS</a> - The bulk
of my open source contributions</li>
<li><a href="http://github.com/vkurup">GitHub</a></li>
</ul>

</div>

<!-- Twitter js -->
<script type="text/javascript" src="http://twitter.com/javascripts/blogger.js"> </script>
<script type="text/javascript" src="http://twitter.com/statuses/user_timeline/vkurup.json?callback=twitterCallback2&count=1"> </script>

<%def name="head()">
  <meta charset=utf-8> 
  <title>${bf.config.blog.name}</title>
  <link rel="alternate" type="application/rss+xml" title="RSS 2.0" href="${bf.util.site_path_helper(bf.config.blog.path,'/feed')}" />
  <link rel="alternate" type="application/atom+xml" title="Atom 1.0"
href="${bf.util.site_path_helper(bf.config.blog.path,'/feed/atom')}" />
  <link rel='stylesheet' href='${bf.config.filters.syntax_highlight.css_dir}/pygments_${bf.config.filters.syntax_highlight.style}.css' type='text/css' />
  <link rel="stylesheet" href="/css/screen.css" type="text/css" />
  <meta name="author" content="Vinod Kurup" />
  <meta name="verify-v1" content="7VLvj7jbZMA24/73SZ9uUEq3SeBuiX3+aSIBRtgH4jQ=" />
  <link rel="openid.server" href="http://www.myopenid.com/server" />
  <link rel="openid.delegate" href="http://vkurup.myopenid.com/" />
  <link rel="openid2.local_id" href="http://vkurup.myopenid.com/" />
  <link rel="openid2.provider" href="http://www.myopenid.com/server" />
  <meta http-equiv="X-XRDS-Location" content="http://www.myopenid.com/xrds?username=vkurup.myopenid.com" />
</%def>

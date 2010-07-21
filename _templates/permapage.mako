<%inherit file="site.mako" />
<%include file="post.mako" args="post=post" />

% if bf.config.blog.disqus.enabled:
<div id="disqus_thread"></div>
<script type="text/javascript">
  var disqus_developer = "0";
  var disqus_title = "${ post.title }";
</script>
<script type="text/javascript" src="http://disqus.com/forums/${bf.config.blog.disqus.name}/embed.js"></script>
<noscript><a href="http://${bf.config.blog.disqus.name}.disqus.com/?url=ref">View the discussion thread.</a></noscript>

% endif

<%def name="head()">
  <%include file="head.mako" args="title=post.title+' : '+bf.config.blog.name" />
</%def>

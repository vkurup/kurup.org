<%inherit file="site.mako" />
% for post in posts[:bf.config.blog.posts_per_page]:
  <%include file="post.mako" args="post=post" />
% if bf.config.blog.disqus.enabled:
  <div class="after_post"><a href="${post.permalink}#disqus_thread">Read and Post Comments</a></div>
% endif
  <hr class="interblog" />
% endfor

<h1>Older Posts</h1>
% for post in posts[bf.config.blog.posts_per_page:]:
<div class="section list">
  <h5> ${post.date.strftime("%d %b %Y")}</h5>
  <p class="line">
  <a class="title" href="${post.permapath()}">${post.title}</a>
  <a class="comments" href="${post.permalink}#disqus_thread">View Comments</a>
  </p>
</div>
%endfor

<%def name="head()">
  <%include file="head.mako" args="title='Blog Posts : '+bf.config.blog.name" />
</%def>

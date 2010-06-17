<%inherit file="site.mako" />
% for post in posts[:bf.config.blog.posts_per_page]:
<div class="section list">
  <h1>${ post.date.strftime("%d %b %Y") }</h1>
  <p class="line">
  <a class="title" href="${ post.permapath() }">${ post.title }</a>
%if bf.config.blog.disqus.enabled:
  <a class="comments" href="${ post.permalink }/#disqus_thread">View Comments</a>
%endif
  </p>
${ post.content }
<!-- Feedburner Flare -->
<script src="http://feeds.feedburner.com/~s/vkurup?i=${post.permalink}" type="text/javascript"> </script>
<p class="tags"><% 
    category_links = []
    for category in post.categories:
      if post.draft:
        #For drafts, we don't write to the category dirs, so just write the categories as text
        category_links.append(category.name)
      else:
        category_links.append("<a href='%s'>%s</a>" % (category.path, category.name))
  %>
  ${"| ".join(category_links)}
</p>

</div>
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

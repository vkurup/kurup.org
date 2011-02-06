<%page args="post"/>

<h1 class="emphnext"><a href="${post.permapath()}" rel="bookmark" title="Permanent Link to ${post.title}">${post.title}</a></h1>

${post.content}

<address class="signature">
<span class="author">&nbsp;</span>
<span class="date">${ post.date.strftime("%d %B %Y")}</span>
<span class="tags"><% 
    category_links = []
    for category in post.categories:
      if post.draft:
        #For drafts, we don't write to the category dirs, so just write the categories as text
        category_links.append(category.name)
      else:
        category_links.append("<a href='%s'>%s</a>" % (category.path, category.name))
  %>
  ${"| ".join(category_links)}
</span>
</address>

<%include file="adsense.mako" />


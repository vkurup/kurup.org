<%page args="post"/>

<h1 class="emphnext"><a href="${post.permapath()}" rel="bookmark" title="Permanent Link to ${post.title}">${post.title}</a></h1>

${post.content}

<script type="text/javascript"><!--
google_ad_client = "ca-pub-4972120581861523";
/* Main */
google_ad_slot = "9048599036";
google_ad_width = 728;
google_ad_height = 90;
//-->
</script>
<script type="text/javascript"
src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>

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

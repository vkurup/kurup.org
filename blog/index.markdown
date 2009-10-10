---
layout: default
title: Blog

keywords: programming, medicine, free software
feed: atom.xml
---

{% for post in site.posts limit:5 %}
<div class="section list">
  <h1>{{ post.date | date_to_string }}</h1>
  <p class="line">
  <a class="title" href="{{ post.url }}">{{ post.title }}</a>
  <a class="comments" href="{{ post.url }}#disqus_thread">View Comments</a>
  </p>
{{ post.content }}
<!-- Feedburner Flare -->
<script src="http://feeds.feedburner.com/~s/vkurup?i=http://www.kurup.org{{ post.url }}" type="text/javascript"> </script>
<p class="tags">{% for tag in post.tags %}<a href="http://www.google.com/search?q={{ tag }}+site:www.kurup.org" rel="tag">{{ tag }}</a> {% if forloop.last %} {% else %} | {% endif %}{% endfor %}</p>
</div>

{% endfor %}

<h1>Older Posts</h1>
{% for post in site.posts %}
<div class="section list">
  <h5>{{ post.date | date_to_string }}</h5>
  <p class="line">
  <a class="title" href="{{ post.url }}">{{ post.title }}</a>
  <a class="comments" href="{{ post.url }}#disqus_thread">View Comments</a>
  </p>
</div>
{% endfor %}

<?xml version="1.0" encoding="UTF-8"?><% from datetime import datetime %>
<feed
  xmlns="http://www.w3.org/2005/Atom"
  xmlns:thr="http://purl.org/syndication/thread/1.0"
  xml:lang="en"
   >
  <title type="text">${bf.config.blog.name}</title>
  <subtitle type="text">${bf.config.blog.description}</subtitle>
  <author>
    <name>Vinod Kurup</name>
    <email>vinod@kurup.com</email>
    <uri>${bf.config.site.url}</uri>
  </author>
  <updated>${datetime.utcnow().strftime("%Y-%m-%dT%H:%M:%SZ")}</updated>
  <generator uri="http://blogofile.com/">Blogofile</generator>

  <link rel="alternate" type="text/html" href="${bf.config.blog.url}" />
  <id>${bf.config.blog.url}/feed/atom/</id>
  <link rel="self" type="application/atom+xml" href="${bf.config.blog.url}/feed/atom/" />
% for post in posts[:10]:
  <entry>
    <title type="html"><![CDATA[${post.title}]]></title>
    <link rel="alternate" type="text/html" href="${post.permalink}" />
    <id>${post.permalink}</id>
    <updated>${post.updated.strftime("%Y-%m-%dT%H:%M:%SZ")}</updated>
    <published>${post.date.strftime("%Y-%m-%dT%H:%M:%SZ")}</published>
% for category in post.categories:
    <category scheme="${bf.config.blog.url}" term="${category}" />
% endfor
    <summary type="html"><![CDATA[${post.title}]]></summary>
    <content type="html" xml:base="${post.permalink}"><![CDATA[${post.content}]]></content>
  </entry>
% endfor
</feed>

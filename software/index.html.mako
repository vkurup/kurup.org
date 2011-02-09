<%inherit file="site.mako" />
<%self:filter chain="markdown">

Placeholder for software I've developed. For now, go look at my
[github](http://github.com/vkurup) account.

</%self:filter>

<%def name="head()">
  <%include file="head.mako" args="title='Software : '+bf.config.blog.name" />
</%def>

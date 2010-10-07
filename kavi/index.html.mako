<%inherit file="site.mako" />
<%self:filter chain="markdown">

Placeholder for Kavi's page. Until his dad gets his act together, go
look at some [photos](http://picasaweb.google.com/vvkurup) or watch
some [videos](http://youtube.com/vkurup1)

</%self:filter>

<%def name="head()">
  <%include file="head.mako" args="title='Kavi : '+bf.config.blog.name" />
</%def>

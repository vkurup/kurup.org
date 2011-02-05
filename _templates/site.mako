<%!
   from datetime import datetime
%>
<%inherit file="base.mako" />
<!DOCTYPE html>
<html lang="en">
  <head>
    ${self.head()}
  </head>
  <body>
    <div id="site">
      <header>
        ${self.header()}
      </header>

      <div id="page">
        ${next.body()}
      </div>

      <div id="footer">
        ${self.footer()}
      </div>
    </div>

    <ul class="fixedmenu"> 
      <li><a href="/about">About</a></li> 
      <li><a href="/">Blog</a></li> 
      <li><a href="/software">Software</a></li> 
      <li><a class="medicine" href="/medicine">Medicine</a></li> 
      <li><a class="feed" href="/blog/feed/atom/index.xml">Feed <img src="/images/rss.jpg"></a></li> 
    </ul>

    <!-- Last modified at ${datetime.today().strftime('%c')} -->
    <%include file="google-analytics.mako" />
  </body>
</html>
<%def name="head()">
  <%include file="head.mako" args="title=bf.config.blog.name" />
</%def>
<%def name="header()">
  <%include file="header.mako" />
</%def>
<%def name="footer()">
  <%include file="footer.mako" />
</%def>

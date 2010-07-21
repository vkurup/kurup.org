<%!
   from datetime import datetime
%>
<%inherit file="base.mako" />
<html>
  <head>
    ${self.head()}
  </head>
  <body>
    <div id="site">
      <div id="header">
        ${self.header()}
      </div>

      <div id="page">
        ${next.body()}
      </div>

      <div id="footer">
        ${self.footer()}
      </div>
    </div>

    <!-- Last modified at ${datetime.today().strftime('%c')} -->
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

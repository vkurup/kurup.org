<%page args="title" />
  <meta charset="utf-8"> 
  <title>${title}</title>
  <!--[if lt IE 9]>
  <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
  <link rel="alternate" type="application/atom+xml" title="Atom 1.0" href="${bf.util.site_path_helper(bf.config.blog.path,'/feed/atom')}" />
  <link rel="stylesheet" href="${bf.config.filters.syntax_highlight.css_dir}/pygments_${bf.config.filters.syntax_highlight.style}.css" />
  <link rel="stylesheet" href="/css/screen.css" />
  <link rel="shortcut icon" href="/favicon.ico" />
  <meta name="author" content="Vinod Kurup" />

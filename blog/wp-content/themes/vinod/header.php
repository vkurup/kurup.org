<!DOCTYPE HTML>
<html lang=en>
<head>
<meta charset=<?php bloginfo('charset'); ?>>
<title><?php if ( is_single() ) { ?><?php single_post_title(); ?><?php } else { ?> <?php wp_title(); ?><?php } ?> [<?php bloginfo('name'); ?>]</title>
<link rel=alternate type=application/atom+xml href="<?php bloginfo('atom_url'); ?>">
<link rel="shortcut icon" href="/favicon.ico">

<style type=text/css>
body{font:normal medium 'Gill Sans','Gill Sans MT','Ikarius ADF','Nimbus Sans L',Corbel,Verdana,sans-serif;margin:1.75em auto;width:40em;line-height:1.5;word-spacing:0.1em}
a{background:transparent}
a:link{color:blue}
a:visited{color:purple}
h1 a,h2 a,h3 a,#nav a,.punch a{color:inherit !important}
acronym,abbr{border:0;letter-spacing:0.1em;text-transform:lowercase;font-variant:small-caps}
h1,h2,h3,p,ul,ol,#nav{margin:1.75em 0}
h1,h2,h3{font-size:medium}
h1,h2{display:inline}
h1{font-weight:normal}
pre,tt{white-space:pre-wrap;font-size:medium;line-height:2.154}
cite{font-style:normal}
img{border:0}
.framed{border:1px solid}
.cl,#arc th,#arc td,.punch p{list-style:none;margin:0;padding:0}
.cl li{margin-bottom:-1px;border-bottom:1px dotted}
.sig,.tb,.pb,blockquote{font-size:small;line-height:2.154;margin:2.154em 0;padding:0}
blockquote{font-style:oblique;border-left:1px dotted;margin-left:2.154em;padding-left:2.154em}
blockquote p{margin:2.154em 0}
.tb,.pb{margin-top:0;padding:2.154em 0}
.sig,.punch,#arc th{text-align:right}
.f,.c{text-align:center;clear:both}
#comment,#arc{width:100%}
#comment{height:14.6em;margin:0;line-height:2.154}
.me{background:papayawhip;color:black;padding:1.75em 1.75em 0 1.75em;border-top:1px dotted;margin-top:-2px}
.me>p:first-child{margin-top:0}
.punch{float:right;font-size:x-small;margin:0 0 1.75em 1.75em;line-height:1.75}
#nav + .punch + p:first-letter{float:left;color:gainsboro;padding:0.11em 4px 0 0;font:normal 4em/0.68 serif}
#arc th{padding:0 1.75em 0 0;vertical-align:baseline}
#arc{border-collapse:collapse}
.post {padding-top:30px; padding-bottom:30px}
p.postmetadata {font-size:small; text-align:right;}
</style>

<?php wp_head(); ?>
</head>
<body>
<div id="page">


<div id="header">
	<div id="headerimg">
		<h1><a href="<?php echo get_option('home'); ?>/"><?php bloginfo('name'); ?></a></h1>
		<div class="description"><?php bloginfo('description'); ?></div>
	</div>
</div>

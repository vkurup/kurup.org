	<address>
		<span class="copyright">
			Design by 
			<a href="http://mark.reid.name">Mark Reid</a>, Content
			by <a href="mailto:&#118;&#105;&#110;&#111;&#100;&#064;&#107;&#117;&#114;&#117;&#112;&#046;&#099;&#111;&#109;" title="Send me email">Vinod Kurup</a>
			<br/>
			(<a rel="licence" href="http://creativecommons.org/licenses/by-nc-sa/3.0/">Some rights reserved</a>)			
		</span>
		<span class="engine">
			Powered by 
			<a href="http://www.blogofile.com">Blogofile</a>
		</span>
	</address>

% if bf.config.blog.disqus.enabled:
<script type="text/javascript">
//<![CDATA[
(function() {
	var links = document.getElementsByTagName('a');
	var query = '?';
	for(var i = 0; i < links.length; i++) {
	if(links[i].href.indexOf('#disqus_thread') >= 0) {
		query += 'url' + i + '=' + encodeURIComponent(links[i].href) + '&';
	}
	}
	document.write('<script charset="utf-8" type="text/javascript" src="http://disqus.com/forums/${bf.config.blog.disqus.name}/get_num_replies.js' + query + '"></' + 'script>');
})();
//]]>
</script>
% endif

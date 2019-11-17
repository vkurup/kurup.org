---
categories:
- programming
comments: true
date: '2014-07-22T21:16:00'
title: Pygments on Arch Linux
---

I wrote my first blog post in a little while (ok, ok... 18 months) yesterday and when I tried to
generate the post, it failed. Silently failed, which is the worst kind of failure. I'm still not
sure why it was silent, but I eventually was able to force it to show me an error message:

```ruby
/home/vinod/.rbenv/versions/1.9.3-p286/lib/ruby/gems/1.9.1/gems/pygments.rb-0.3.4/lib/pygments/popen.rb:354:in `rescue in get_header': Failed to get header. (MentosError)
	from /home/vinod/.rbenv/versions/1.9.3-p286/lib/ruby/gems/1.9.1/gems/pygments.rb-0.3.4/lib/pygments/popen.rb:335:in `get_header'
	from /home/vinod/.rbenv/versions/1.9.3-p286/lib/ruby/gems/1.9.1/gems/pygments.rb-0.3.4/lib/pygments/popen.rb:232:in `block in mentos'
	from /home/vinod/.rbenv/versions/1.9.3-p286/lib/ruby/1.9.1/timeout.rb:68:in `timeout'
	from /home/vinod/.rbenv/versions/1.9.3-p286/lib/ruby/gems/1.9.1/gems/pygments.rb-0.3.4/lib/pygments/popen.rb:206:in `mentos'
	from /home/vinod/.rbenv/versions/1.9.3-p286/lib/ruby/gems/1.9.1/gems/pygments.rb-0.3.4/lib/pygments/popen.rb:189:in `highlight'
	from /home/vinod/dev/kurup.org/plugins/pygments_code.rb:24:in `pygments'
	from /home/vinod/dev/kurup.org/plugins/pygments_code.rb:14:in `highlight'
	from /home/vinod/dev/kurup.org/plugins/backtick_code_block.rb:37:in `block in render_code_block'
	from /home/vinod/dev/kurup.org/plugins/backtick_code_block.rb:13:in `gsub'
	from /home/vinod/dev/kurup.org/plugins/backtick_code_block.rb:13:in `render_code_block'
	from /home/vinod/dev/kurup.org/plugins/octopress_filters.rb:12:in `pre_filter'
	from /home/vinod/dev/kurup.org/plugins/octopress_filters.rb:28:in `pre_render'
	from /home/vinod/dev/kurup.org/plugins/post_filters.rb:112:in `block in pre_render'
	from /home/vinod/dev/kurup.org/plugins/post_filters.rb:111:in `each'
	from /home/vinod/dev/kurup.org/plugins/post_filters.rb:111:in `pre_render'
	from /home/vinod/dev/kurup.org/plugins/post_filters.rb:166:in `do_layout'
	from /home/vinod/.rbenv/versions/1.9.3-p286/lib/ruby/gems/1.9.1/gems/jekyll-0.12.0/lib/jekyll/post.rb:195:in `render'
	from /home/vinod/.rbenv/versions/1.9.3-p286/lib/ruby/gems/1.9.1/gems/jekyll-0.12.0/lib/jekyll/site.rb:200:in `block in render'
	from /home/vinod/.rbenv/versions/1.9.3-p286/lib/ruby/gems/1.9.1/gems/jekyll-0.12.0/lib/jekyll/site.rb:199:in `each'
	from /home/vinod/.rbenv/versions/1.9.3-p286/lib/ruby/gems/1.9.1/gems/jekyll-0.12.0/lib/jekyll/site.rb:199:in `render'
	from /home/vinod/.rbenv/versions/1.9.3-p286/lib/ruby/gems/1.9.1/gems/jekyll-0.12.0/lib/jekyll/site.rb:41:in `process'
	from /home/vinod/.rbenv/versions/1.9.3-p286/lib/ruby/gems/1.9.1/gems/jekyll-0.12.0/bin/jekyll:264:in `<top (required)>'
	from /home/vinod/.rbenv/versions/1.9.3-p286/bin/jekyll:23:in `load'
	from /home/vinod/.rbenv/versions/1.9.3-p286/bin/jekyll:23:in `<main>'
```

Professor Google tells me that this happens when you try to
[run the pygments.rb library in a Python 3 environment](https://github.com/tmm1/pygments.rb/issues/45).
(pygments.rb is a Ruby wrapper around the Python Pygments library). The fix is to run the code in a
Python2 virtualenv. I guess the last time I updated my blog, Arch still had Python2 as the system
default. No, I don't want to check how long ago that was.

```bash
$ mkvirtualenv -p `which python2` my_blog
(my_blog)$ bundle exec rake generate
```

So now I'm running a Ruby command in a Ruby environment (rbenv) inside a Python 2 virtualenv. Maybe
it's time to switch blog tools again...

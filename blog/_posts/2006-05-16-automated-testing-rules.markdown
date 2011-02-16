---
date: 2006/05/16 00:00:00
layout: post
title: "Automated Testing Rules"
categories: programming, tcl, testing, openacs
---

Automated testing is a good thing. For my running log application, I have a proc that creates a new log for a user, called rl::runner::new. If you happen to call it for a user who already has a log, it returns the already created log. When I created the proc way back when, I also created an automated test to make sure that creation worked and that redundant calls returned the orignal log.

Over time, I added some code to make sure that users are given proper permissions on their log. Anytime you make a change, you should run your tests, but of course, I didn't :-) Well, today I did and my test now failed.

Here is the relevant (edited) code:

{% highlight tcl %}
set runner_id [db_nextval acs_object_id_seq] 
set ret_val [db_exec_plsql new_runner {}]
permission::grant -party_id $user_id -object_id $runner_id -privilege admin
permission::grant -party_id $user_id -object_id $runner_id -privilege write
{% endhighlight %}

The error was happening in `permission::grant`. It was complaining that `$runner_id` wasn't a valid acs_object. What's going on? It looks like it should work. The problem is that I should be granting the permission on `ret_val`, not on `runner_id`. (Probably a bad choice of variable names). The first time a log is created, `db_exec_plsql` returns a value which happens to be the same as `runner_id`. The second time it's called, it returns a value which is **different** and `permission::grant` fails.

I would never have caught this error until I tried to call `rl::runner::new` the second time on the same user. Which would make it one of those very difficult to track bugs. Automated testing saved me a lot of annoying debugging.

That said, I wish OpenACS's testing facilities were better. I worked on a couple other bugs today and I'm trying really hard to write tests to expose bugs before fixing them, but it's really a strain. Especially when you need to do a combination of black box and white box testing. I'd like to make testing easier in OpenACS, but I'm not sure if I have the brainpower :-)

<div id="comment-box">
<h2>Comments from old site</h2>

<div class="one-comment">
<p><b>Improving Testing</b></p>
<p>
Vinod,
</p>
<p>
There is definitely room for improvement. You can specify test
dependency, I think, so you can create a test package environment,
then run several tests using that setup. I haven't tried that yet, but
it should help.
</p>
<p>
Anothing thing to keep in mind is that testing can expose places in
your code that might need to be decoupled. That is one of the
advantages of testing, by thinking of how to run the code is isolation
in the test, you can discover a better design :)
</p>
<address class="signature">
<span class="author">Dave Bauer</span>
<span class="date">2006-05-17 07:27:51</span>
</address>
</div>

</div>

---
layout: post
title: "Automated Testing Rules"
tags: [programming, tcl, testing, openacs]
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

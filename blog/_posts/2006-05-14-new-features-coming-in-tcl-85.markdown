---
layout: post
title: "New Features coming in Tcl 8.5"
tags: [tcl, programming]
---

I was looking at the [Tcl 8.4 man page for 'split'](http://www.tcl.tk/man/tcl8.4/TclCmd/split.htm) and saw this example code:

{% highlight tcl %}
## Split into fields on colons
set fields [split $rec ":"]
## Assign fields to variables and print some out...
lassign $fields \
    userName password uid grp longName homeDir shell
{% endhighlight %}

It shows how to split a string using ':' as the delimiter. The interesting part is the 'lassign' statement. I'd never seen that before. I've always done something annoying like this:

{% highlight tcl %}
set fields [split $rec ":"]
set userName [lindex $fields 0]
set password [lindex $fields 1]
set uid [lindex $fields 2]
set grp [lindex $fields 3]
set longName [lindex $fields 4]
set homeDir [lindex $fields 5]
set shell [lindex $fields 6]
{% endhighlight %}

How could I have overlooked 'lassign' all these years? After berating my idiocy for a few minutes, I tried 'lassign' out and Tcl replied 'invalid command name' . Turns out I'm not as stupid as I thought. :-) 'lassign' is new in Tcl 8.5 (but seems to have snuck in the backdoor of the 8.4 docs). I decided to see what else was [coming in 8.5](http://www.tcl.tk/software/tcltk/8.5.html).

- Dictionaries. These are associative arrays which reportedly are better than Tcl arrays, but I'm not sure why.
- ** as an exponentiation operator
- Instead of doing: <code>if {[lsearch -exact $list $item] != -1}</code>, the new 'in' operator lets you do <code>if {$item in $list}</code>. There's also a 'ni' operator for 'not in'.
- Plenty of other stuff, none of which really caught my eye.

Tcl 8.5 is still alpha, so I'm sticking with 8.4 (and my annoying code) for the moment.
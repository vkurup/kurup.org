---
categories:
- tcl
- programming
date: '2006-05-14T00:00:00'
title: New Features coming in Tcl 8.5
---


I was looking at the [Tcl 8.4 man page for 'split'](http://www.tcl.tk/man/tcl8.4/TclCmd/split.htm) and saw this example code:

```tcl
## Split into fields on colons
set fields [split $rec ":"]
## Assign fields to variables and print some out...
lassign $fields userName password uid grp longName homeDir shell
```

It shows how to split a string using ':' as the delimiter. The interesting part is the 'lassign' statement. I'd never seen that before. I've always done something annoying like this:

```tcl
set fields [split $rec ":"]
set userName [lindex $fields 0]
set password [lindex $fields 1]
set uid [lindex $fields 2]
set grp [lindex $fields 3]
set longName [lindex $fields 4]
set homeDir [lindex $fields 5]
set shell [lindex $fields 6]
```

How could I have overlooked 'lassign' all these years? After berating my idiocy for a few minutes, I tried 'lassign' out and Tcl replied 'invalid command name' . Turns out I'm not as stupid as I thought. :-) 'lassign' is new in Tcl 8.5 (but seems to have snuck in the backdoor of the 8.4 docs). I decided to see what else was [coming in 8.5](http://www.tcl.tk/software/tcltk/8.5.html).

- Dictionaries. These are associative arrays which reportedly are better than Tcl arrays, but I'm not sure why.
- ** as an exponentiation operator
- Instead of doing: <code>if {[lsearch -exact $list $item] != -1}</code>, the new 'in' operator lets you do <code>if {$item in $list}</code>. There's also a 'ni' operator for 'not in'.
- Plenty of other stuff, none of which really caught my eye.

Tcl 8.5 is still alpha, so I'm sticking with 8.4 (and my annoying
code) for the moment.

<div id="comment-box">
<h2>Comments from old site</h2>

<div class="one-comment">
<p><b>What about this</b></p>
<p>
Or just do
</p>

<pre><code>foreach {userName password uid grp longName homeDir shell} [lrange fields 0 6] {break}
# We do an lrange here, otherwise values would be set wrong
# in case someone accidentally supplies a list with too many elements,
# because then the foreach loop would run more than once
</code></pre>
<p>
I just learned the lrange trick yesterday :)
</p>
<p>
I got caught by the over-optimistic 8.4 docs as well. lassign remove
the risk where you need to use the lrange call.
</p>
<address class="signature">
<span class="author">Dave Bauer</span>
<span class="date">2006-05-14 19:56:49</span>
</address>
</div>

<div class="my-comment">
<p><b>Much better</b></p>
<p>
The lrange trick is cleaner than my code. Thanks Dave!
</p>
<address class="signature">
<span class="author">Vinod Kurup</span>
<span class="date">2006-05-15 20:42:37</span>
</address>
</div>

<div class="one-comment">
<p><b>Look also at OpenACS API</b></p>
<p>
The 'util_unlist' API is the exact equivalent of 'lassign'.
</p>
<address class="signature">
<span class="author">Anonymous</span>
<span class="date">2006-07-05 02:30:37</span>
</address>
</div>

<div class="my-comment">
<p><b>Thanks</b></p>
<p>
Thanks - I didn't know about util_unlist. There are so many cool
little-known functions in the OpenACS API
</p>
<address class="signature">
<span class="author">Vinod Kurup</span>
<span class="date">2006-07-05 14:42:46</span>
</address>
</div>

</div>

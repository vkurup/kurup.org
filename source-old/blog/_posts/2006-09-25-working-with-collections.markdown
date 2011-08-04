---
date: 2006/09/25 00:00:00
layout: post
title: "Working with collections"
categories: tcl programming
---

Steve Yegge wrote about the [expressiveness of
Ruby](http://steve.yegge.googlepages.com/ruby-tour) as compared to
Java. He used this simple problem as an example:

> How about if we write a program that will print out all the words in the dictionary starting with the letter 'Q' (case-insensitive), grouped by increasing length, and sorted alphabetically within each group.

The Ruby version was about 12 lines of code and Java version about
43. Of course, the point of the exercise wasn't simply the difference
in LOCs, but in the overall simplicity of dealing with collections of
data. Still, I wanted to see how Tcl would deal with the same
problem. Here's the simplest version I could come up with:

{% highlight tcl %}
set f [open /usr/share/dict/words r]
set words [read -nonewline $f]
close $f
set qwords [lsearch -all -inline [split $words \n] {[Qq]*}]

proc compare_length {a b} {
    if { [string length $a] <= [string length $b] } {
        return -1
    } else {
        return 1 
    } 
}

set sorted_qwords [lsort -command compare_length [lsort $qwords]]
set max -1 foreach qword $sorted_qwords {
    if { [string length $qword] > $max } {
        set max [string length $qword]
        puts "Words of length $max:"
    }
    puts "  $qword"
}
{% endhighlight %}

About 19 lines and pretty simple to write and read. Can this be
improved?

<div id="comment-box">

<h2>Comments from old site</h2>

<div class="one-comment">

<p><b>Meditations on programming languages</b></p>

<p>
I like Paul Graham's essays on this subject.
</p>

<p>Have you seen this http://paulgraham.com/fix.html or this http://paulgraham.com/icad.html?
</p>

<address class="signature">
<span class="author">Prem Thomas</span>
<span class="date">2006-10-03 14:13:23</span>
</address>
</div>

<div class="one-comment">

<p><b>Tcl functional programming (And the example in Perl)</b></p>

<p>
I don't do as much tcl programming as I used to, but I do do a lot of
Perl and some Ruby.
</p>

<p>
One thing I have really picked up from the Perl community is a love of
using functional programming when it makes sense (which is quite a
bit). If you want to get into functional programming in tcl there are
quite a few good resources on the tcl.tk wiki, but there's also a
fantastic functional tcl package in openacs that every openacs
programmer should make themselves familiar with:
</p>

<p>
<a href ="http://openacs.org/api-doc/procs-file-view?version_id=358343&path=packages/acs-tcl/tcl/ad-functional-procs.tcl">[ACS Tcl 5.2.0 : ad-functional-procs.tcl</a> - full lambda functions (with no memory leaks, although a bit of memory usage)
</p>

<p>
Now, onto the fun part! I thought I'd take on the Q word example in
Perl. Here's a reasonable way to do it in Perl:
</p>

<pre>
use strict;
open W, '/usr/share/dict/words' or die $!;
my @words = &lt;W&gt;;
chomp @words;
close W;

my $max = 0;
for my $word (sort {length $a &lt;=> length $b} sort grep { /^q/i } @words) {
    if (length $word > $max) {
        $max = length $word;
        print "Words of length $max:\n"
    }

    print "$word\n";
}
</pre>

<p>
And here's the pathological way :)
</p>

<pre>
open W, '/usr/share/dict/words';
    
length > $max ? print 'Words of length ' . (($max = length) -1) . ":\n$_" : print

for sort {length $a &lt;=&gt; length $b} sort grep { /^q/i } &lt;W&gt;;
</pre>

<address class="signature">
<span class="author">Mark Aufflick</span>
<span class="date">2006-11-26 21:49:24</span>
</address>
</div>

<div class="my-comment">

<p><b>More stuff to learn</b></p>

<p>
Thanks Prem for the amusing comments about languages. I still have the
"Revenge of the Nerds" on my to-read list.
</p>

<p>
Mark, that is one scary looking snippet of Perl. :) Thanks for the
links to the functional programming procs in OpenACS. I had never seen
those. Do you know of any code that uses them?
</p>

<p>
I've been meaning to learn some more about functional programming, but
the going has been difficult. It's definitely a different mindset.
</p>

<address class="signature">
<span class="author">Vinod Kurup</span>
<span class="date">2006-12-14 16:34:02</span>
</address>
</div>

</div>

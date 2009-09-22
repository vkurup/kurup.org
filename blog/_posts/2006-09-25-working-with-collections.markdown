---
layout: post
title: "Working with collections"
tags: [tcl, programming]
---

Steve Yegge wrote about the [expressiveness of Ruby](http://steve.yegge.googlepages.com/ruby-tour) as compared to Java. He used this simple problem as an example:

> How about if we write a program that will print out all the words in the dictionary starting with the letter 'Q' (case-insensitive), grouped by increasing length, and sorted alphabetically within each group.

The Ruby version was about 12 lines of code and Java version about 43. Of course, the point of the exercise wasn't simply the difference in LOCs, but in the overall simplicity of dealing with collections of data. Still, I wanted to see how Tcl would deal with the same problem. Here's the simplest version I could come up with:

{% highlight tcl%}
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

About 19 lines and pretty simple to write and read. Can this be improved?
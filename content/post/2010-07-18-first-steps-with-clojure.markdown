---
categories:
- programming
- clojure
date: '2010-07-18T16:29:00'
title: First Steps with Clojure
---

As mentioned yesterday, I'm teaching myself clojure. I started by trying to
install it. 

    vinod@ike$ aptitude install clojure

Ubuntu has packaged version 1.0.0 of clojure. I always default to the
OS-installed version of programs, just for ease of maintenance. The current
stable version of clojure is 1.1 and it appears that 1.2 is in beta. I have
no idea what has been changed in 1.1 or 1.2, but I'm going to try to get
along using 1.0.0 and update only if I need to for a specific reason.

I then read through the
[tutorial for non-lisp programmers](http://www.moxleystratton.com/article/clojure/for-non-lisp-programmers),
which succinctly describes the basics of the language.[^1] Everything in
lisp is either an atom or a list. Atoms include numbers, booleans, strings,
symbols, keywords and the nil value. Lists (delimited by parentheses `()`)
are the basic data structure, but include representations such as vectors
(delimited by square brackets `[]`) and maps (delimited by curly brackets
`{}`). Clojure programs are themselves simply lists, which leads to the
power of lisp-like languages because code and data are interchangeable.

You use `def` to create variables and `defn` to create functions. The
language includes loops and conditional statements, just like any other
useful language. Only `false` and `nil` are *false* in clojure; zero (0),
and the empty string ("") are *true*, unlike a lot of languages. 

The interesting part is the integration with Java. To instantiate a java
object, simply call `new`:

    user=> (new java.util.Date)
    #<Date Sun Jul 18 16:20:54 EDT 2010>

To call object methods or get instance/class variables, use the dot "."
method.

    user=> (. (new java.util.Date) (toString))
    "Sun Jul 18 16:24:09 EDT 2010"

    user=> (. Integer MAX_VALUE)
    2147483647

The article contains this interesting quote:

> Sequences are in a sense, the core of idiomatic Clojure
> programming. Understand sequences and the forms that work with them, and
> you will have cleared one of the biggest hurdles in writing significant
> Clojure programs.

So, add that to my to-do list. Where to go next? A
[StackOverflow thread](http://stackoverflow.com/questions/599519/which-tutorial-on-clojure-is-best)
has pointed to me to a few options. I'll probably read one of these next:

 - [http://en.wikibooks.org/wiki/Learning_Clojure](http://en.wikibooks.org/wiki/Learning_Clojure)
 - [http://github.com/relevance/labrepl](http://github.com/relevance/labrepl)
 - [http://java.ociweb.com/mark/clojure/article.html](http://java.ociweb.com/mark/clojure/article.html)

[^1]: I later read that this tutorial is out of date, so I may have to "unlearn" things later. It still comes up as the first hit on [Google for "clojure tutorial"](http://www.google.com/search?q=clojure+tutorial)

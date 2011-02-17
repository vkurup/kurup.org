---
date: 2010/08/05 15:16:00
layout: post
title: Maps are functions, too
tags: programming clojure
---

Braindump time. Here's what I've read about clojure in the past few days. I don't understand what this means yet, but maybe someday I will:

> Clojure provides easy access to the Java frameworks, with optional type hints and type inference, to ensure
that calls to Java can avoid reflection.

There are multiple languages that target the JVM (besides Java, of
course). It seems that there are 2 classes of languages. Ported languages
such as JRuby and Jython aim to be identical to their base languages
(Ruby & Python). Native languages such as Clojure and Groovy are meant to
target the JVM natively without satisfying any desire to be identical to
another language. Native languages have the advantage that they only have 1
set of libraries to use, so you don't get stuck between two languages.

I installed clojure 1.0 from the ubuntu repositories, but promptly
uninstalled it once I found
[leiningen](http://github.com/technomancy/leiningen). Leiningen is a build
tool for clojure. You can easily create a new project and specify its
dependencies and leiningen will download those dependencies, including a
full version of clojure for each project. You can have 1 project using
leiningen 1.0 and another using version 1.2 sitting right next to it. That
seems smart!

I installed [clojure-mode on
emacs](http://www.assembla.com/wiki/show/clojure/Getting_Started_with_Emacs).

Right now, I'm working my way through the
[labrepl](http://github.com/relevance/labrepl) project. It's an interactive
tutorial and REPL (read-eval-print-loop) where you can run the examples in
the tutotial.

It's always important to know how to find help:

- `(doc blah)` gives documentation about blah.
- `(find-doc "blah")` searches for documentation.
- `(javadoc blah)` opens Java docs in your browser
- `(show java.util.Date)` shows method signatures

Here's something cool: Maps are associative arrays. Here's a simple one:

    (def me {:first-name "Vinod", :last-name "Kurup"})

To get the data, you use the `get` function, like you would in other languages:

    (get me :first-name) -> "Vinod"

But, maps and keywords are functions as well, so you can do:

    (me :first-name) -> "Vinod"
    (:last-name me) -> "Kurup"


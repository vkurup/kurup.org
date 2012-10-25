---
layout: post
date: 2012/10/15 13:02:18
title: Emacs Autocomplete stumbles on yasnippet
comments: true
categories: programming emacs
---

[Autocomplete Mode](http://cx4a.org/software/auto-complete/) is an
Emacs mode that tries to guess what word you're typing and provide
auto-completion. Recently, it started failing in simple scenarios.

It can use various 'sources' to try to figure out what you're about to
type. The simplest source is `ac-source-dictionary` which is a simple
list of words. If you start typing any of those words, it will try to
autocomplete them for you. Normally, you'd put those words in a file,
with each word on a separate line, but for testing purposes, you can
also add them manually using an elisp function. Here's the test that
failed for me:

    (add-to-list 'ac-user-dictionary "foobar@example.com")

That adds the email address to the dictionary. Then, typing 'foo' in
any buffer, should offer to autocomplete the entire email address.
Unfortunately, it wasn't working.

To debug, I typed 'foo' and then did `M-x auto-complete`, which forces
auto-complete to look for a completion. This resulted in an error in
the Minibuffer:

    ac-yasnippet-candidates: Symbol's function definition is void: yas/current-snippet-table

This led me to check which 'sources' autocomplete was trying to use:
`C-h v ac-sources`

    (ac-source-features ac-source-functions ac-source-yasnippet
     ac-source-variables ac-source-symbols ac-source-abbrev
     ac-source-dictionary ac-source-words-in-same-mode-buffers)

So, autocomplete is looking through each one of those sources, trying
to find possible words I might be typing. The third one is called
`ac-source-yasnippet`, which seems to be where my error is coming
from.

So, I looked into the yasnippet source code and found that, indeed,
there was no function named `yas/current-snippet-table`. That function
has been renamed to `yas--get-snippets-table` in version 0.8.0, but
autocomplete is still relying on the old function name. (RANT: Don't
rename functions that others might be using without providing some
kind of alias, at least temporarily) I looked at the code for
[autosnippet on github](https://github.com/auto-complete/auto-complete)
and noted that the latest version has been fixed to use the new code,
but it hasn't yet been released on MELPA. Until it is, the quick
solution is to remove `ac-source-yasnippet` from `ac-sources`.

    (delq 'ac-source-yasnippet ac-sources)

Then typing 'foo' autocompletes to 'foobar@example.com'.

It seems that autocomplete should be more forgiving of errors in any
specific 'source', passing it up to use other sources. Alternatively,
it should fail loudly when there's an error, so that I can know to fix
or remove the offending 'source'.

---
date: 2010-11-05 07:45:32
layout: post
title: Making blog posting easier
categories: elisp, programming
---

Another piece of advice that I've heard over and over again is to make
things easier. [Automate!](http://sachachua.com/blog/2010/09/how-to-be-dispensable-and-why-you-should-document-and-automate-yourself-out-of-a-job/)
In that vein, I learned a little elisp in order to make it easier to
create a new blog post. I create my posts in emacs, but I often cut
and paste the YAML header from a previous post, which is tedious and
time-consuming. Here is my new posting function:

    (defun vk-blogpost (title)
      "Create a new blog post."
      (interactive "sPost Title: ")
      (let ((slug (replace-regexp-in-string " " "-" (downcase title))))
        (find-file (concat "~/web/kurup.org/_posts/"
                           (format-time-string "%Y-%m-%d")
                           "-" slug ".markdown"))
        (insert "---\n")
        (insert "date: " (format-time-string "%Y-%m-%d %H:%M:%S") "\n")
        (insert "layout: post\n")
        (insert "title: " title "\n")
        (insert "categories: \n")
        (insert "---\n\n")))

After asking me for a title, it creates a new file and massages the
title to create a
[slug](http://en.wikipedia.org/wiki/Slug_(web_publishing)). It
automatically enters the date of the post, both in the filename and
in the YAML header. This took me about an hour to write, mostly in
googling elisp commands. Hopefully, it will save time in the long run,
but even if it doesn't, it was fun to write :-)

Any feedback on my primitive elisp would be appreciated!

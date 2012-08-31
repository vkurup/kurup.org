---
date: 2011/05/08 22:10:19
layout: post
title: Learning Android Review
categories: android book-review programming
---

<a href="http://amzn.to/m8SK61"><img class="inset right" src="/images/learning-android.jpg" /></a>

I recently finished reading [Learning
Android](http://amzn.to/m8SK61). I have a Droid X, Mala has a Droid
Eris, and I just bought a Viewsonic g-tablet, so I have plenty of
Android devices. While I still have trouble with the idea of typing on
a touchscreen, I know that we are moving towards a future where mobile
devices are our primary computers. This is not earth
shattering. [Philip Greenspun mentioned it 5 years
ago](http://philip.greenspun.com/business/mobile-phone-as-home-computer). Android
will be [one of the more prominent mobile
OS's](http://www.tbray.org/ongoing/When/201x/2011/04/25/Mobility)
along with iOS, so I want to learn how to program it. 


I came into this book having browsed some of the example code on the
[developer.android.com](http://developer.android.com/) website. It is
great for an overview, and there is a lot of in-depth information on
APIs, etc., but I still didn't quite understand how to go about
starting an app.

In March, O'Reilly had a sale on e-books, so I bought [Learning
Android](http://amzn.to/m8SK61). It is a reasonable introduction to
Android programming. It's beings gently, explaining the history of
Android and providing a general overview of how the Android stack
works. It's explains how to use the Eclipse IDE, but as a fervent
emacs fan, I was easily able to adjust to using emacs (with
[android-mode.el](https://github.com/remvee/android-mode)) for all of
my development. There were typos and minor errors, but fortunately
[O'Reilly has an errata
page](http://oreilly.com/catalog/errataunconfirmed.csp?isbn=0636920010883)
where people can post fixes and suggestions. Keep that page open while
you're reading this book. There were a couple areas where the ordering
of the discussion could have been improved. If I didn't have that
errata page at hand, I would have been completely
frustrated. Especially at the beginning, the instructions were not
detailed enough. For example, we are instructed on how to create a
program and how to start the emulator, but there is no clear
explanation on how to run the program on the emulator. A little more
step-by-step hand-holding would have been nice.

In case you ignored my advice to check out that errata page, at least
make sure that you have the updated version of the [jTwitter
library](http://examples.oreilly.com/0636920010883/README-JTwitter-Library.txt),
or else you'll never get the sample programs to run without errors.

I haven't used Java in a while, so I forgot how verbose Java
is. Writing Tcl, Ruby and Python has spoiled me. It takes so long to
do something simple in Java. I know that this is usually offset by
code generators and IDEs, but it still just seems so clunky to read
and write. There is a [scripting language project for Android
(SL4A)](http://code.google.com/p/android-scripting/). I haven't tried
it, but it involves bundling the scripting environment with your app
if you want to distribute it to others. I'm also not certain that it
provides access to all of the functionality provided in the Java SDK.
Someday, I hope that a scripting language SDK is provided. It seems
like a natural progression.

All in all, I think Learning Android is perfect for someone who wants
to get started in Android programming. It gives a nice gentle
introduction to all of the basics of how the platform works. Most of
this information is available on the web in various places, but it's
nice to have it all in one place, and I still think there's value to
having one book that takes you from step zero to a working app. I
think I'll now be able to use the online docs to get me moving. I was
often frustrated by the typos, minor technical errors and
inconsistencies, but I suspect the book was under a lot of time
pressure, given how hot mobile programming is these days. It just felt
like it was written on a rushed deadline. It's also not the most
entertaining book in the world, which is OK for a technical book. I'd
always rather have a boring technical book, than an *attempt* at an
entertaining one.

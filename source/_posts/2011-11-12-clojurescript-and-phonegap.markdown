---
layout: post
date: 2011/11/12 21:39:34
title: ClojureScript and PhoneGap
comments: true
categories: clojure, programming, android
---

[Phonegap](http://phonegap.com) is a tool that allows you to develop
apps in HTML5 + javascript and makes it easy to deploy them to
multiple mobile platforms, including Android and iOS.

[ClojureScript](https://github.com/clojure/clojurescript) is a dialect
of the awesome language, [Clojure](http://clojure.org), that compiles to
Javascript (after a pass through the [Google
Closure](http://code.google.com/closure/) optimizer). Because Clojure,
ClojureScript and Google Closure can be confusing terms, I'll use CLJS
instead of ClojureScript for the remainder of this post.

What I wanted to do: Write a simple CLJS app that runs on my Android
phone using these tools.

### Get HelloWorld working with PhoneGap

Following [these instructions](http://phonegap.com/start#android) will
get the Android SDK, Eclipse plugin and PhoneGap working. If you
already have the Android SDK, you'll be able to skip most of it. I'm
most comfortable in Emacs, so I'll be using that instead of
Eclipse. Here is the command-line command for creating your project
(the `-t` refers to your android target which you can find by doing
`android list avds`):

    $ android create project -n HelloPhoneGap -t 2 -p HelloPhoneGap -k com.phonegap.helloworld -a App

By the end of these instructions, you should have a copy of an app
called HelloPhoneGap on your phone which, when clicked, shows a
'Hello World' screen.

### Setup CLJS

Follow the [simple
instructions](https://github.com/clojure/clojurescript/wiki/Quick-Start),
recreated here because they're just so simple.

    $ git clone git://github.com/clojure/clojurescript.git
    $ cd clojurescript
    $ ./script/bootstrap

That's it. The CLJS compiler and REPL are ready to work.

### Get HelloWorld working via HTML

Follow the
[instructions](https://github.com/clojure/clojurescript/wiki/Quick-Start)
under the heading *Using ClojureScript on a Web Page* to build a
Javascript file and associated HTML file for testing.

### Put CLJS and PhoneGap together

OK, let's make something a little interactive on the phone. I'm going
to build a BMI calculator that takes a person's height and weight in
Imperial (i.e. American) units and calculates a Body Mass Index. BMI
is simply weight divided by the square of height, with units of
kg/m<super>2</super>.

Here's the CLJS file:

    (ns bmi)
    
    (defn height [feet inches]
      (-> feet (* 12) (+ inches) (* 2.54) (/ 100)))
    
    (defn weight [lbs]
      (/ lbs 2.2))
    
    (defn bmi [h w]
      (js/Math.round (/ w (* h h))))
    
    (defn ^:export alertDismissed []
      nil)
    
    (defn ^:export displaybmi [form]
      (let [h (height (js/parseInt form.f.value) (js/parseInt form.i.value))
            w (weight (js/parseInt form.l.value))]
        (js/navigator.notification.alert (bmi h w) hello.alertDismissed)))
    
Basically, we create simple functions to convert Imperial heights and
weights to metric values, calculate a BMI and then use `displaybmi` to
parse form parameters, calculate the BMI and show that result in an
Android notification popup. `alertDismissed` is a callback that gets
called when the user dismisses the notification. (I'm just discarding
the information here). Those are the only 2 functions that are needed
by the HTML file, so those are the only 2 that need the `:export`
metadata tag. `navigator.notification.alert` is a PhoneGap API call
that does the actual notification.

The calls prefixed by `js/` are understood by the CLJS compiler to
refer to the global JavaScript namespace. If you didn't include that
prefix, the compiler would assume you meant a call in the local
`bmi` namespace, which would obviously fail.

Here's the HTML file (in `HelloPhoneGap/assets/www/`):

    <!DOCTYPE HTML>
    <html>
      <head>
        <title>BMI calculator</title>
        <script type="text/javascript" charset="utf-8" src="phonegap-1.0.0.js"></script>
        <script type="text/javascript" charset="utf-8" src="bmi.js"></script>
      </head>
      <body>
        <h1>BMI calculator</h1>
    
        <form>
          Height: <input name="f" size="2"> ft. <input name="i" size="2"> in. <br>
          Weight: <input name="l" size="2"> lbs.<br>
          <input type="button" value="Calculate BMI" onclick="bmi.displaybmi(this.form)">
        </form>

      </body>
    </html>

Now compile the CLJS and move the compiled JS file to
`HelloPhoneGap/assets/www/`

    $ ./bin/cljsc bmi.cljs '{:optimizations :simple :pretty-print true}' > bmi.js
    $ cp bmi.js ~/dev/HelloPhoneGap/assets/www/

The `:simple` value for optimizations and the `true` value for
pretty-print make it so that we can read the resulting JS file, but
can be changed to `:advanced` and `false` respectively when ready for
production.

Now, go back into the HelloPhoneGap Android project and compile it and
send it to the emulator (`C-c C-c i` in emacs). You should now have a
simple BMI calculator working on Android.

{% img /images/bmi.png BMI Android Screenshot %}

### Next steps

The promise of PhoneGap is that you could use similar HTML/Javascript
to create iOS versions as well, but I haven't done that yet. There are
tons of API calls available on both platforms which are supposed to
give you the same access that native apps have. Using ClojureScript
means you get to use a modern functional language to create your app,
while getting access to the features that only JavaScript APIs
provide.


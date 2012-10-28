---
layout: post
date: 2012/10/24 16:45:49
title: Emacs for Python Programming
comments: true
categories: programming emacs python
---

(Note: See the bottom of this post for updates)

I was honored to to give my "Emacs for Python Programming" talk at the
inaugural [PyCarolinas](http://pycarolinas.org) conference. The
conference was a huge success in every way, thanks to the efforts of
[Calvin Spealman](http://www.ironfroggy.com/), et. al. I promised that
I would post my Emacs setup, so here it is.

- Slides: [https://speakerdeck.com/vkurup/emacs-for-python-programming](https://speakerdeck.com/vkurup/emacs-for-python-programming)
- Video: [Will be posted once posted]

## Step 0: Prerequisites ##

This may work with other setups, but here's what I tested:

- Linux
- Emacs version 24
- python 2.7 or 3.3
- [pip](http://pypi.python.org/pypi/pip)
- [virtualenv](http://www.virtualenv.org/)
- [virtualenvwrapper](http://virtualenvwrapper.readthedocs.org/)
- git

## Step 1: Clear out any previous customization ##

As evidenced by the numerous blog posts documenting how to set this
up, it's not straightforward. I recommend starting from scratch to
make sure everything is set up properly. Once you have it working,
then you can customize it. Make sure to start these commands in your
home directory.

{% codeblock lang:bash %}
vinod:~$ mkdir old-emacs
vinod:~$ mv .emacs .emacs.d old-emacs/
{% endcodeblock %}

## Step 2: Set up initial Emacs configuration ##

Create an empty `.emacs.d` directory and a subdirectory named with your
username. My username is `vinod`, so we'll create a directory
structure called `.emacs.d/vinod/`. The emacs-starter-kit tells emacs
to automatically load any elisp files from that special directory, so
you'll always have a place to drop custom elisp files.

{% codeblock lang:bash %}
vinod:~$ mkdir -p ~/.emacs.d/$USER
{% endcodeblock %}

Create a file named `.emacs.d/init.el` with the following contents:

{% gist 3948955 .emacs.d/init.el %}

## Step 3: Create a python virtualenv ##

We'll keep all the python-side customization in a virtualenv named
`default`. It's important that the name you choose is the same as the
name in the `(virtualenv-workon)` command in line 49 of Step 2.

{% codeblock lang:bash %}
vinod:~$ mkvirtualenv -p python2 default
{% endcodeblock %}

After it does its thing, your shell prompt should change, indicating
that your new virtualenv is activated

{% codeblock lang:bash %}
(default)vinod:~$
{% endcodeblock %}

## Step 4: Install Pymacs ##

[Pymacs](http://pymacs.progiciels-bpi.ca/index.html) is a really cool
piece of software that sets up a 2 way communication between Emacs and
Python, allowing you to control Emacs with python commands rather than
elisp commands. It requires a python piece (`Pymacs.py`) and an Emacs
piece (`pymacs.el`). Unfortunately, they're not installable via `pip`
or `package.el`, but installation is easy enough.

{% codeblock lang:bash %}
(default)vinod:~$ mkdir src
(default)vinod:~/src$ cd src
(default)vinod:~/src$ git clone git://github.com/pinard/Pymacs.git
(default)vinod:~/src$ cd Pymacs

# check to make sure tests pass
(default)vinod:~/src/Pymacs$ make check

# install it (Be sure you're inside your virtualenv!)
(default)vinod:~/src/Pymacs$ make install

# install the emacs extension
(default)vinod:~/src/Pymacs$ cp pymacs.el ~/.emacs.d/$USER/
{% endcodeblock %}

## Step 5: Install other python packages ##

These helper packages are easier to install:

{% codeblock lang:bash %}
(default)vinod:~$ pip install pyflakes pep8
{% endcodeblock %}

The pyflakes and pep8 packages check your code as you type using
Emacs' flymake mode. Now, deactivate your virtualenv.

{% codeblock lang:bash %}
(default)vinod:~$ deactivate
vinod:~$
{% endcodeblock %}

## Step 6: Install pycheckers ##

Flymake is the part of Emacs that checks your code for errors on the
fly. It calls a shell script called `pycheckers`, so you need to have
a script by that name in your shell's `PATH`. Here's mine
(`~/bin/pycheckers`):

{% gist 3948973 pycheckers %}

## Step 7: Install python-mode.el ##

As I mentioned in my talk, there are multiple Python modes available,
but I recommend using the one named python-mode.el, which is developed
at
[http://launchpad.net/python-mode](http://launchpad.net/python-mode).
It does periodically get uploaded to
[Marmalade](http://marmalade-repo.org/packages/python-mode), but the
auto-completion using pycomplete doesn't work well on the version that
is there now (6.0.10), so I recommend that you manually download and
install the latest stable version (6.0.12). I'll update this post once
a stable working version gets uploaded to
[Marmalade](http://marmalade-repo.org/) or
[Melpa](http://melpa.milkbox.net/).

{% codeblock lang:bash %}
vinod:~$ cd ~/.emacs.d/$USER
vinod:~/.emacs.d/vinod$ curl -L https://launchpad.net/python-mode/trunk/6.0.12/+download/python-mode.el-6.0.12.tar.gz | tar xz
{% endcodeblock %}

## Step 8: Test it all out ##

Launch emacs and open a python file named `test.py`. Type the following:

    import os
    os.path.jo

Wait at this point. You should see auto-completion of `os.path.join`
followed shortly by a yellow popup showing documentation of that method.
Hitting return should accept the completion. Then type `(` and you
should see the method signature in the minibuffer.

Move the cursor over any letter in `join`. Hit 'F1'. A window should
popup with the docstring for `os.path.join`. Hit 'F2'. A new window
should be opened with the code for `os.path.join`. Hit 'F3'. You'll be
prompted to enter the name of any python command, and Emacs will show
you the docstring.

Type the string 'blah' and hit return. The string should be
highlighted in pink and if you mouseover it, the minibuffer will say
`undefined name 'blah'`. That's flymake working for you.

Hit `C-c C-c` and the buffer should be sent to a Python interpreter and
you'll be dropped in the REPL after the code has been loaded. Any
errors in the code will be reported.

If all of this works, then CONGRATULATIONS!!! If not, let me know and
I'll see if I can help debug.

## Step 9: Customize ##
All of this is customizable in hundreds of ways. Try `M-x
customize-group RET python-mode RET` to see how.

## Step 10: How to create a new python project ##

Whenever you want to create a new Python project, you have do the
following:

### Create a new virtualenv ###

{% codeblock lang:bash %}
vinod:~$ mkvirtualenv newproject
{% endcodeblock %}

### Install pymacs into that virtualenv ###

{% codeblock lang:bash %}
(newproject)vinod:~$ cd ~/src/Pymacs
(newproject)vinod:~/src/Pymacs$ make install
{% endcodeblock %}

### Install the other pip modules ###

{% codeblock lang:bash %}
(newproject)vinod:~/src/Pymacs$ pip install pyflakes pep8
{% endcodeblock %}

### Switch to that virtualenv in emacs ###

    M-x virtualenv-workon RET newproject/ RET

## Issues ##

### Changing virtualenvs doesn't restart Pymacs ###

For the most part, this won't affect much, but if you move from a
Python2 project to a Python3 project, you may have problems. The
workaround is to call `M-x pymacs-terminate-services`, then `M-x
virtualenv-workon` to change your virtualenv, and then finally
`M-x py-load-pymacs` to restart pymacs

### Latest stable version of python-mode.el isn't on Melpa ###

I'd much prefer to just load python-mode using the built-in Emacs
package manager.

### Pymacs installation is harder than it needs to be ###

I wish Pymacs could be installed by a 2 step process

1. pip install Pymacs
2. M-x package-install RET pymacs RET

### Which pycheckers to use? ###

My script uses pep8 and pyflakes. There are a lot of other options out
there and I do not know which is best. See
[this post](http://stackoverflow.com/questions/1428872/pylint-pychecker-or-pyflakes)
for more details.

### Not using ropemacs any more ###

In my talk, I used ropemacs. In this setup, I have decided against it.
I was mostly using it for code-completion and documentation lookup,
but I like pycomplete.el better for those purposes. It's included in
python-mode and it shows method signatures as you type. Ropemacs does
have other features such as project management (easily jumping to
files in the same project), and refactoring (changing variable names
throughout project). I haven't used those, so I decided not to install
ropemacs.

### Project management not included ###

I haven't yet decided which package to use for this. I'll probably try
projectile, but there are many other options, some lightweight
(ropemacs, eproject, pony-mode) and some heavyweight (ecb, CEDET).


## References ###

I gleaned knowledge from all of the following, in no particular order.

- [Using Pymacs and virtualenv together (slacy.com)](http://slacy.com/blog/2011/03/pymacs-ropemacs-and-virtualenv-all-at-the-same-time/)
- [Using Ropemacs for autocompletion (yilmazhuseyin.com)](http://www.yilmazhuseyin.com/blog/dev/emacs-setup-python-development/)
- [How to use Rope to automatically change virtualenv for you](http://stackoverflow.com/questions/2855378/ropemacs-usage-tutorial/2858148#2858148)
- [Ropemacs and virtualenv (almostobsolete.net)](http://almostobsolete.net/rope-and-virtualenv.html)
- [The post that turned me on to pycomplete.el (rwdev.eu)](http://www.rwdev.eu/articles/emacspyeng)
- [Perfect Python Environment (2009)](http://hide1713.wordpress.com/2009/01/30/setup-perfect-python-environment-in-emacs/)
- [Lot's of great 'advanced-beginner' emacs tips](http://www.masteringemacs.org/articles/2010/10/04/beginners-guide-to-emacs/)
- [Using python.el rather than python-mode.el](http://blog.cou929.nu/setting-up-python-environment-on-emacs)
- [Using IPython, pylookup and more (pedrokroger.net)](http://pedrokroger.net/2010/07/configuring-emacs-as-a-python-ide-2/) - I need to look into this post some more.
- [EmacsWiki Python Page](http://emacswiki.org/emacs/PythonProgrammingInEmacs)
- [Python.el, ropemacs, and a little django tip at the end](http://www.saltycrane.com/blog/2010/05/my-emacs-python-environment/)
- [Virtualenv.el (something similar is included in python-mode.el](https://github.com/aculich/virtualenv.el)
- [Python Development Environment](https://github.com/pdee/pdee) -
  Looks promising, just wish there was some documentation on how to
  use it.
- [Emacs for Cocoa Development](http://borkware.com/rants/emacs-dev/) - OK, not at all related to python, but some great insight from an Emacs (and all-around) wizard. Don't miss the ranting at the end of the page.
- [Python.el basics](http://jesselegg.com/archives/2010/02/25/emacs-python-programmers-part-1/)
- [Using PDB in Emacs](http://sunnyeves.blogspot.com/2011/04/debugging-python-on-emacs-ide.html)
- [Ryan McGuire's .emacs.d](https://github.com/EnigmaCurry/emacs)
- [AutoComplete for Python (enigmacurry.com)](http://www.enigmacurry.com/2009/01/21/autocompleteel-python-code-completion-in-emacs/)
- [The original Python IDE post (enigmacurry.com)](http://www.enigmacurry.com/2008/05/09/emacs-as-a-powerful-python-ide/)

## Updates ##

#### 2012-10-27 ####

Thanks to [@danpoirier](https://twitter.com/danpoirier) and
[@gregnewman](http://twitter.com/gregnewman) for testing. I initially
recommended using the master branch of python-mode.el, but now I
recommend using the latest stable release (as of now) which is version
6.0.12 to avoid problems loading Pymacs. There's a bug on 6.0.12 with
`virtualenv-workon` that requires you to put a trailing slash after
the name of your virtualenv, so I've updated the `init.el` file above
to account for those changes.

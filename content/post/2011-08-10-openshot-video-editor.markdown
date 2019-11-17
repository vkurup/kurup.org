---
categories:
- linux
- video
- mac
comments: true
date: '2011-08-10T15:30:08'
title: Openshot Video Editor
---


Ever since my Dad brought home an Apple IIe back in 1980, I've been a
huge Apple fan. The design of my website back in the mid 90's was a
ripoff of the Mac OS 9 System menu. (I found a [later version on the Wayback Machine](http://web.archive.org/web/20011110214204/http://kurup.com/index.phtml). I
had swapped out the Apple icon for the icon of the startup I was
working with at the time.) I loved OS X for a while, especially on my
12" Aluminum powerbook. But over time, I got more and more frustrated
by it. I wanted to be able to configure more. When the hard drive on
that Powerbook died, I decided to move to all linux.

{{< tweet 1207289044 >}}

I am happy and productive, but I am occasionally jealous of Mac OS X. I set
up a Mac Airbook for my mother-in-law a few months ago and ... can I
just drool for a minute about that computer? But, I was able to set it
up, wipe up my drool, and then return to my Ubuntu machines without
too many pangs of jealousy. For the stuff that I do, Linux works
perfectly.

The one pain point that I've been having over the past few years is
video editing. I take a lot of movies of the kids and I like to do
some very simple editing of them before uploading them to
youtube. This was super easy in
[iMovie](http://www.apple.com/ilife/imovie/) back in 2007. I haven't
found a similar experience on Linux. It's reassured me a little to
hear that iMovie has gotten weaker and weaker over the years, so I
didn't feel any need to go back to Mac for this one function.

I had been using [Kino](http://www.kinodv.org/), but the developer
stopped working on it and it had some minor bugs. It doesn't play well
with PulseAudio, the overarching audio system in linux. So I had to
start it with the command `padsp kino` which allows kino to bypass
PulseAudio. That then makes all other sound on the computer stop until
I quit Kino. And with every OS update, there would be minor changes
that would require me to fiddle with the audio settings
again. Finally, I didn't really understand the Export settings, so my
videos were never as optimized as they could be. There were tabs for
DVD and MPEG output, but there was also one for Other and there were
MPEG options in there too. I was thoroughly confused and was hoping
for something to come along that would be better. Mark Pilgrim
mentioned OpenShot once and I looked at it back then, but I couldn't
figure it out. I tried valiantly for a day and then returned to
hacking on Kino.

Fast forward about a year and after a little more frustration with how
my videos looked on youtube, I gave
[OpenShot](http://www.openshotvideo.com/) another try. Version 1.2 is
packaged in Ubuntu 10.10, but 1.3 offered some other nice features,
like exporting directly to Youtube, so I downloaded the
[PPA](http://www.openshot.org/ppa/) and installed 1.3.

{{< imgcap src="/images/openshot.png" title="Openshot Main Window" >}}

What a breath of fresh air! It was so easy to import clips. It was so
easy to place clips on the timeline. It was easy to splice and add
transitions. It was easy to add titles. Most importantly it was easy
to export to HD video format so now the videos look better on Youtube.

I don't use Linux for its video editing capabilities. I use it because
I believe in the idea of free software and because for my purposes,
emacs and a web browser are all that I really need. But I am
pleasantly surprised when I see something like OpenShot evolve and
improve to the point that it solves my problem exactly. I will be
donating some dollars over there.

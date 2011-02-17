---
date: 2010/09/16 09:09:00
layout: post
title: Rotating videos
tags: video linux
---

I found out how to rotate video today. I often take video with my
Canon SD870, but I mistakenly take it in portrait mode. I don't
realize this until I'm editing the video and then I have to decide if
I want to subject my adoring youtube fans to the torture of having to
turn their heads sideways to see how cute Kavi and Anika are. 

I found [this
link](http://www.hanselman.com/blog/HowToRotateAnAVIOrMPEGFileTakenInPortrait.aspx)
which gives the `mencoder` command to rotate the video. Unfortunately,
it didn't work with the AVI files that my Canon SD870 create. I think
this camera creates slightly corrupt AVI files. I say "slightly"
because they're still viewable, but mplayer always reports the total
time as "0:00", even while the elapsed time marches along
correctly. Well, today, I found a way to fix the AVI files.

    mencoder -ovc copy -oac copy input.avi -o output.avi

This just creates a new AVI, copying the video and audio from the
original. Now, mplayer reports the correct total time. Then, to rotate
the video:

    mencoder -ovc lavc -lavcopts vcodec=mjpeg -vf rotate=1 \
             -oac copy output.avi -o rotated.avi

And here's your reward for reading along:

<object width="480" height="385"><param name="movie"
value="http://www.youtube.com/v/QIC21_XaAJ0?fs=1&amp;hl=en_US"></param><param
name="allowFullScreen" value="true"></param><param
name="allowscriptaccess" value="always"></param><embed
src="http://www.youtube.com/v/QIC21_XaAJ0?fs=1&amp;hl=en_US"
type="application/x-shockwave-flash" allowscriptaccess="always"
allowfullscreen="true" width="480" height="385"></embed></object>

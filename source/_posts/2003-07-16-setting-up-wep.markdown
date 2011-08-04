---
date: 2003/07/16 00:00:00
layout: post
title: Setting up WEP
categories: sysadmin wireless
---

How to set up WEP encryption:

- SMC Barricade Basestation
- Airport Extreme Wireless Card
- Mac OS X 10.2.6

Note that if things don't go 100% right, you may lock yourself out of your wireless network. Be sure you know how to get back in before you follow any of these instructions.

1. Set up non-encrypted transmission first. Make sure you can connect to your basestation and surf on the internet. 
1. Visit your basestation's URL - default is http://198.168.123.254 
1. Log in (You **have** changed the password so it's not 'admin', right?) 
1. Click on Wireless.  
1. Create a Network ID (SSID). I've read that [leaving it at 'default' sometimes causes problems](http://www.whiterabbits.com/MacNetJournal/stories/2002/03/20/aWeekofWireless.html), so change it. 
1. Check the 'Enable IEEE 128 bit Shared Key security' radio button 
1. Now we need to enter a key. This should be a 26 digit Hex code. Simply go to the [magic WEP Strong Key Generator](http://www.warewolflabs.com/portfolio/programming/wepskg/wepskg.html). Click on 'generate 128 bit key' and scroll down to see your new key. Pick the one labeled HEX. Enter this value as 'WEP Key 1'. Keep this key visible somewhere, since you'll need to feed it to your Mac so you can login.  
1. Click 'Save' and then 'Reboot' your wireless router. 
1. OK, now you're locked out of your basestation. Let's get back in. 
1. Click on the Airport Icon in the menubar. Choose 'Turn Airport Off'. Wait a few seconds and then click 'Turn Airport On'. 
1. Wait a few seconds for your Mac to recognize your network. Then, click on the Airport icon again and choose your Network-ID. A password box should pop up. 
1. Click the drop-down menu and choose '128 bit Key' and then re-enter your 26-digit HEX key. And no, copy and paste won't work - you need to enter it digit by digit. Check the 'Keychain' box so that you don't have to re-enter that hideous key each time.

Enjoy your new encrypted network!

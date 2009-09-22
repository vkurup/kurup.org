---
layout: post
title: "Compiling OpenFTS on Mac OS X"
tags: [mac, compiling, openacs, software]
---

It wasn't easy, but I finally got OpenFTS-0.3.2-tcl to compile on Mac OS X (10.2.8). I started by reading the excellent Mac OS X porting guides from [Fink](http://fink.sourceforge.net/doc/porting/basics.php) and [Apple](http://developer.apple.com/documentation/Porting/Conceptual/PortingUnix/intro/chapter_1_section_1.html). Unfortunately, the OpenFTS Makefile and configure scripts aren't standard, so I had to muck around with things alot. Here's the diff:  

    diff -U 2 -rbB Search-OpenFTS-tcl-0.3.2/aolserver/Makefile  Search-OpenFTS-tcl-0.3.2-vk/aolserver/Makefile 
    --- Search-OpenFTS-tcl-0.3.2/aolserver/Makefile	Tue Nov 19 14:24:44 2002 
    +++ Search-OpenFTS-tcl-0.3.2-vk/aolserver/Makefile	Wed Jan 14 23:23:13 2004 
    @@ -13,6 +13,6 @@  
    OBJ       = $(SOBJ) $(POBJ) $(OOBJ) nsfts.o  NSFTSLIB  = nsfts.so -LDSO      
    = gcc -shared  INC       = -I../include -I$(NS_HOME)/include -I$(NS_HOME)/nsd +MODLIBS += -L/sw/lib -L/usr/local/aolserver/lib -ltcl8.4 -lnsd    .SUFFIXES: .c .h .so .l @@ -26,5 +26,5 @@    $(NSFTSLIB): $(OBJ) -	$(LDSO) $(OBJ) $(LIBS) -o $(NSFTSLIB) +	$(LDSO) $(OBJ) $(LIBS) -o $(NSFTSLIB) $(MODLIBS)    clean: diff -U 2 -rbB Search-OpenFTS-tcl-0.3.2/configure Search-OpenFTS-tcl-0.3.2-vk/configure --- Search-OpenFTS-tcl-0.3.2/configure	Tue Nov 19 14:24:44 2002 +++ Search-OpenFTS-tcl-0.3.2-vk/configure	Wed Jan 14 22:36:44 2004 @@ -2771,4 +2771,16 @@  fi   +# +# Mac OS X 10.2 +# +# vinodk: not sure if all of this is needed/accurate +if test `uname` = "Darwin"; then +    PLATFORM="osx" +    CC="cc" +    LD="cc" +    CFLAGS="$CFLAGS -no-cpp-precomp" +    LDSO="$LD -flat_namespace -bundle" +fi +  if test $PLATFORM = "unknown"; then          { { echo "$as_me:2774: error: unknown platform" >&amp;5 

Then, follow the instructions in AOLSERVER.INSTALL. I'm not too handy with this Makefile/configure stuff, so I'd appreciate any guidance on how to do this properly :-).

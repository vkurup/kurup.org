---
date: 2004/01/15 00:00:00
layout: post
title: "Compiling OpenFTS on Mac OS X"
tags: mac compiling openacs software
---

It wasn't easy, but I finally got OpenFTS-0.3.2-tcl to compile on Mac OS X (10.2.8). I started by reading the excellent Mac OS X porting guides from [Fink](http://fink.sourceforge.net/doc/porting/basics.php) and [Apple](http://developer.apple.com/documentation/Porting/Conceptual/PortingUnix/intro/chapter_1_section_1.html). Unfortunately, the OpenFTS Makefile and configure scripts aren't standard, so I had to muck around with things alot. Here's the diff:  

    diff -U 2 -rbB Search-OpenFTS-tcl-0.3.2/aolserver/Makefile  Search-OpenFTS-tcl-0.3.2-vk/aolserver/Makefile 
    --- Search-OpenFTS-tcl-0.3.2/aolserver/Makefile	Tue Nov 19 14:24:44 2002 
    +++ Search-OpenFTS-tcl-0.3.2-vk/aolserver/Makefile	Wed Jan 14 23:23:13 2004 
    @@ -13,6 +13,6 @@  
    OBJ       = $(SOBJ) $(POBJ) $(OOBJ) nsfts.o  NSFTSLIB  = nsfts.so -LDSO      
    = gcc -shared  INC       = -I../include -I$(NS_HOME)/include -I$(NS_HOME)/nsd +MODLIBS += -L/sw/lib -L/usr/local/aolserver/lib -ltcl8.4 -lnsd    .SUFFIXES: .c .h .so .l @@ -26,5 +26,5 @@    $(NSFTSLIB): $(OBJ) -	$(LDSO) $(OBJ) $(LIBS) -o $(NSFTSLIB) +	$(LDSO) $(OBJ) $(LIBS) -o $(NSFTSLIB) $(MODLIBS)    clean: diff -U 2 -rbB Search-OpenFTS-tcl-0.3.2/configure Search-OpenFTS-tcl-0.3.2-vk/configure --- Search-OpenFTS-tcl-0.3.2/configure	Tue Nov 19 14:24:44 2002 +++ Search-OpenFTS-tcl-0.3.2-vk/configure	Wed Jan 14 22:36:44 2004 @@ -2771,4 +2771,16 @@  fi   +# +# Mac OS X 10.2 +# +# vinodk: not sure if all of this is needed/accurate +if test `uname` = "Darwin"; then +    PLATFORM="osx" +    CC="cc" +    LD="cc" +    CFLAGS="$CFLAGS -no-cpp-precomp" +    LDSO="$LD -flat_namespace -bundle" +fi +  if test $PLATFORM = "unknown"; then          { { echo "$as_me:2774: error: unknown platform" >&amp;5 

Then, follow the instructions in AOLSERVER.INSTALL. I'm not too handy with this Makefile/configure stuff, so I'd appreciate any guidance on how to do this properly :-).

<div id="comment-box">
<h2>Comments from old site</h2>

<div class="one-comment">
<p><b>Doesn't compile on Panther</b></p>
<p>
Hi Vinod,
</p>
<p>
Your fix for makefile doesn't seem to be working on Panther. Configure
script goes through but when compiling I get the following error:
</p>
<pre>
cc -o Parser.so -shared Parser.o deflex.o flexparser.o
cc: unrecognized option `-shared'
ld: Undefined symbols:
_main
_Tcl_AppendElement
_Tcl_AppendResult
_Tcl_CreateObjCommand
_Tcl_GetIntFromObj
_Tcl_GetStringFromObj
_Tcl_NewIntObj
_Tcl_NewStringObj
_Tcl_ObjSetVar2
_Tcl_PkgProvide
_Tcl_SetObjResult
make[1]: *** [Parser.so] Error 1
make: *** [parser] Error 2
</pre>
<p>
I'll keep on searching for what should be changed and will keep you
posted. Otherwise thanks for spending your time on OS X issues.
</p>

<address class="signature">
<span class="author">Jarkko Laine</span>
<span class="date">2004-02-19 02:31:53</span>
</address>
</div>

<div class="one-comment">
<p><b>-shared option not supported</b></p>
<p>
OK, from apple dev docs:
</p>

<dl>
<dt><code>-shared</code></dt>
<dd>In GCC 2, generates shared liibraries. In GCC 3, this
option is not supported, so you should use libtool (or use ld
directly) instead. Shared libraries in Mac OS X may be different from
those you are accustomed to on other platforms. See <a
href="http://developer.apple.com/documentation/Porting/Conceptual/PortingUnix/compiling/chapter_4_section_7.html#//apple_ref/doc/uid/TP30001003-CH206-TPXREF103">&#8220;Dynamic
Libraries and Plug-ins&#8221;</a>.</dd>
</dl>
<p>Don't know how to fix this in this case, though.</p>
<address class="signature">
<span class="author">Jarkko Laine</span>
<span class="date">2004-02-19 02:57:33</span>
</address>
</div>

<div class="my-comment">
<p><b>untitled</b></p>
<p>
Hey Jarkko,
</p>
<p>
I think you're trying to compile all of OpenFTS and that doesn't work
(at least I haven't tried to get it to work). I just wanted to compile
the nsfts.so module, which is all that you need for OpenACS. So,
instead of doing <code>make</code> in the Search-OpenFTS-tcl-0.3.2
directory, <code>cd aolserver</code> and do the <code>make</code>
there.
</p>
<p>
I think if you follow the directions in the AOLSERVER.INSTALL file,
it'll work.
</p>
<address class="signature">
<span class="author">Vinod Kurup</span>
<span class="date">2004-02-19 23:50:27</span>
</address>
</div>

<div class="one-comment">
<p><b>untitled</b></p>
<p>
Thanks, Vinod,
</p>
<p>
You're right. I actually thought I was running the make in aolserver
dir, but now that I retried it there, it went through smoothly :o)
</p>
<address class="signature">
<span class="author">Jarkko Laine</span>
<span class="date">2004-02-20 01:42:53</span>
</address>
</div>

</div>

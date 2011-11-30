---
layout: post
date: 2011/11/29 21:59:20
title: On Factoring Large Numbers
comments: true
categories: clojure math
---

I wonder how many of my blog posts are based on stories from [This
American Life](http://www.thisamericanlife.org). Probably not
enough. Every time I start to listen to a show, I'm certain that I'm
not going to be interested and within a minute I'm trapped and can't
stop listening. It's that good. A [recent show was about people who
people who pursued crazy
ideas](http://www.thisamericanlife.org/radio-archives/episode/450/so-crazy-it-just-might-work).
The first story was about a mathematician named [Frank Nelson
Cole](http://en.wikipedia.org/wiki/Frank_Nelson_Cole). [Marin
Mersenne](http://en.wikipedia.org/wiki/Mersenne_prime#History) had
claimed in the 17th century that 2<sup>67</sup>-1 was a prime
number. He was prominent enough that the claim was felt to be accepted
wisdom and there was certainly no way to test the claim in the days
before computers. That's a big honking number:
147,573,952,589,676,412,927. 

In 1903, Frank Nelson Cole walked into a meeting of mathematicians to
present his talk. The title was boring, something like "On the
factoring of large numbers". Without speaking a word, he walked up to
the chalkboard and started to write a large number, followed by
another large number and then started to multiply them together. It
took a while, but by the time he started to get towards the solution,
the crowd of mathematicians understood that he was proving that he had
found two numbers whose product was the famous "prime" number
2<sup>67</sup>-1. As he came close to finishing, the anticipation
peaked and cheering began. He finished the calculation and sat down,
never speaking a word.

Stories like that give me the chills. Can you imagine how excited he
must have been when he found those 2 roots? I get that sensation every
once in a while when I make a programming breakthrough, solving a
problem which I had been banging my head on for a while. It's nowhere as
profound as what he did, but I think I can understand the exhilaration
he must have felt.

I decided to see what those 2 roots are, using my new favorite
language, Clojure. I'm by no means an expert in anything, let alone
programming and especially functional programming, but here's how I
went about it. The REPL is such a fun way to explore things like this:

1. I need a range of numbers which I'll then test one-by-one to see if
   they divide into 2<sup>67</sup>-1 evenly.

        user=> (def n 18)
        #'user/n
        user=> (range 2 n)
        (2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17)

1. I need a way to take a square root.  (There's no need to check
   numbers higher than the square root of 2<sup>67</sup>-1)

        user=> (Math/sqrt n)
        4.242640687119285

1. So the numbers I need to test are:

        user=> (range 2 (inc (int (Math/sqrt n))))
        (2 3 4)

1. I need to find the remainder of a division (Of note, `mod` also does
   the same thing, but `rem` is a lot faster)

        user=> (rem 9 2)
        1

1. Can I find all the lower roots of a number? The `#(...)` syntax is
   syntactic sugar for an anonymous function. The `%` is a placeholder
   for the value which is being iterated over. So the following
   function takes each value in the list returned by `range` and
   supplies it to `rem`. If that `rem` function is equal to
   zero, then the `#(...)` anonymous function returns true and `filter`
   keeps the value.

        user=> (def n 100)
        #'user/n
        user=> (filter #(= (rem n %) 0) (range 2 (inc (int (Math/sqrt n)))))
        (2 4 5 10)

1. Now let's map over each of those values, finding the corresponding
   higher root for each value. `vector` creates a vector (think list)
   with the first value being the supplied value and the second value
   being the other root `(/ n %)`:

        user=> (map #(vector % (/ n %)) (filter #(= (rem n %) 0) (range 2 (inc (int (Math/sqrt n))))))
        ([2 50] [4 25] [5 20] [10 10])

1. Based on that experimentation, here's my first stab at the
   function:

        user=> (defn roots [n]
                 (let [lower-factors (range 2 (inc (int (Math/sqrt n))))
                       is-factor? (fn [a] (= (rem n a) 0))]
                   (map  #(vector % (/ n %)) (filter is-factor? lower-factors))))
        #'user/roots
        user=> (roots 294)
        ([2 147] [3 98] [6 49] [7 42] [14 21])
   
1. Now let's get our big number (2<sup>67</sup>-1)

        user=> (dec (Math/pow 2 67))
        1.4757395258967641E20

1. Hmmm... that looks like it might not be a precise value. Oh well,
   let's try it:

        user=> (roots (dec (Math/pow 2 67)))
        ([2 7.378697629483821E19] [3 4.9191317529892135E19] [4
        3.6893488147419103E19] [5 2.9514790517935284E19] [6
        2.4595658764946067E19] [7 2.108199322709663E19] [8
        1.8446744073709552E19] [9 1.6397105843297378E19] [10
        1.4757395258967642E19] [11 1.3415813871788765E19] [12
        1.2297829382473034E19] [13 1.1351842506898186E19] [14
        1.0540996613548315E19] [15 9.838263505978427E18] [16
        9.223372036854776E18] [17 8.6808207405692006E18] [18
        8.1985529216486892E18] [19 7.7670501362987581E18] [20
        7.3786976294838211E18.....
        C-c C-c (ABORT, ABORT!!!)

1. OK, that didn't work. It clearly found way too many roots, because
   2<sup>67</sup>-1 was an approximation. We have to use BigIntegers which have
   appropriate precision even with large numbers.

        user=> (def two67minus1 (dec (.pow (BigInteger. "2") 67)))
        #'user/two67minus1
        user=> two67minus1
        147573952589676412927

1. Cool, that looks more precise than our previous value. To see the
   difference, check their type.

        user=> (type (dec (Math/pow 2 67)))
        java.lang.Double
        user=> (type (dec (.pow (BigInteger. "2") 67)))
        java.math.BigInteger

1. OK, Time for the big test:

        user=> (roots two67minus1)
        ([193707721 761838257287])

1. Cool!!! It works! Those are the roots of 2<sup>67</sup>-1. How long did that
   take to compute? (We need `doall` to make the `time` command wait
   for all of the values to be calculated, otherwise it will return
   after the first value is calculated. This has something to do with
   the laziness of clojure sequences)

        user=> (time (doall (roots two67minus1)))
        "Elapsed time: 2.2697318183297E7 msecs"
        ([193707721 761838257287])

6 hours 18 minutes. I'm sure there's a quicker way to do this. I do a
lot of redundant testing. For example, once we know that 2 is not a
factor, we shouldn't check any more even factors. I'd be interested in
any advice to make it run faster.

I can't even fathom how you'd go about doing this without a
computer. Can you imagine how frustrating it must've been any time you
had a simple error? Just amazing...

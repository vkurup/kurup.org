---
date: 2010/07/19 16:08:00
layout: post
title: Stock Market Timing
tags: investing programming python
---

If you asked me a few years ago, I would have said you absolutely can't
time the stock market. The 2008 crash hurt enough to make me review my
convictions a little. I still believe that accurate market timing is
somewhere between difficult and impossible. Trying to analyze stock charts
to figure out what will happen in the short term is mostly a crap
shoot. The way to win in the stock market is to buy value stocks,
especially when everyone else is selling.

I do, however, now believe that there is a place for market timing in
deciding when to be in the stock market, in the first place. I think there
are some trends that have repeatedly predicted poor stock
performance. There are some super smart people that have analyzed these
trends over at the [Motley Fool message
boards](http://boards.fool.com). They've come up with many indicators that
supposedly tell you when to get in and out of the stock market, but my
favorite is the [99 day
rule](http://boards.fool.com/Message.asp?mid=27442724) [^1].

The basic premise of the 99 day rule is that when the
[S&P 500 Index](http://finance.yahoo.com/q?s=^GSPC) stops making new highs,
investors get pessimistic and stocks fall. When it starts making new highs
again, optimism takes over and bull markets start. The 99 day rule has 2
parts and coincidentally uses 99 days as the cut-off for both parts. It
looks at whether a new high has been made recently. It defines "high" as a
99-day high. It defines "recently" as 99 days. So, it looks for a new
99-day high within the last 99 days. The number is arbitrary. Hop over the
the
[Motley Fool boards](http://boards.fool.com/mechanical-investing-100093.aspx)
to see how the dates have been tuned and pick different ones, if you like.

I like this rule, because it's simple, easy to calculate and doesn't have
many "signals", so you're not constantly buying and selling. Of course,
it's not perfect, but it would have gotten you out of most of the major
bear markets.

Here is how the rule has done over time:

    Period        S&P 500   Switching   Improvement 
    ---------     -------   ---------   -----------
    1930-1935     -12.2%       4.3%       16.4% 
    1935-1940      10.3%      16.2%        6.0% 
    1940-1945       7.4%       5.6%       -1.8% 
    1945-1950      10.2%       7.4%       -2.8% 
    1950-1955      23.6%      22.5%       -1.1% 
    1955-1960      15.2%      13.8%       -1.4% 
    1960-1965      10.7%      11.7%        1.0% 
    1965-1970       5.0%       7.1%        2.2% 
    1970-1975      -2.4%       6.8%        9.2% 
    1975-1980      14.8%      12.0%       -2.8% 
    1980-1985      14.8%      20.1%        5.2% 
    1985-1990      20.4%      18.8%       -1.7% 
    1990-1995       8.7%       6.7%       -2.0% 
    1995-2000      28.6%      27.9%       -0.7% 
    2000-2005      -2.3%       4.3%        6.6% 
    2005-early2008  2.0%       4.5%        2.5%

You may have gotten to this point and are now wondering why it's worth
following this rule. In at least 3 of the past 5 periods, this signal would
have lost money versus staying in the market. That is true. The key is to
understand that there is no free lunch. Any rule that tries to get you out
of major bear markets will be imperfect and will often leave you with less
money than if you had chosen to act on a different date (or not act at
all). The overall goal is not to increase your returns, but to decrease
your risk without sacrificing your returns. This signal does that. Overall,
it does actually increase your returns by about 2% annually since 1930.

The other nice feature is that it doesn't have a "slam-dunk" feel to it. My
experience is that things that work in the stock market have to have a
little of a "gut wrenching" feel to them. If it sounds too good to be true,
it is. This rule feels correct, improves returns over the long run, is
backtested well, but does so at the risk of some lower performing
years. That feels a little gut-wrenching to me.

Here is the author's ([mungofitch](http://www.stonewellfunds.com/)) description:

> By using the rule that I described above, you would have had
> a total return of 11.80%, with a total risk of 6.71%. So, you
> would have had 2.3% per year higher returns on average,
> while experiencing only about 56.9% of the risk. 
> Higher returns, lower risk. That sounds good, right?
> 
> But, is this one of those iffy timing systems that really only works
> because it managed to avoid the crash of 1987 of something?
> No, actually it has you in the market in the 1987 crash: it's
> not perfect. But does it really add value on average through the years?
> Not always, but pretty darned well. Sometimes you do a little worse,
> but never a lot worse. And when you do better, you do a LOT better.
> So, overall, it's worth it. 

In order to keep track of the signal, I wrote a [little python
program](http://github.com/vkurup/ninety-nine) to calculate whether we are
in buy mode or sell mode. It uses the excellent [ystockquote
module](http://www.goldb.org/ystockquote.html) written by Corey Goldberg.

[^1]: A much more [detailed description of the rule and its background](http://boards.fool.com/Message.asp?mid=27035352).

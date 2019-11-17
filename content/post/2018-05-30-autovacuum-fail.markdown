---
categories:
- programming
- postgresql
comments: true
date: 2018-05-30T21:26:00
title: Autovacuum not running
---


OK, this is a debug session in progress, so don't expect a nice solution at the end. We're working
on a project that does analysis of some public voter registration data. The DB is hosted on Amazon
RDS and I've been perplexed by how poorly queries are performing there, despite the tables only have
about 10 million rows. Simple queries are taking many minutes, which is orders of magnitude slower
than my laptop.

[Mark](http://mlavin.org/) suggested running 'VACUUM ANALYZE', which I didn't think would help
because my understanding was that the autovacuum process in PostgreSQL would be taking care of that
on a regular basis. These queries had been slow for days with no recent inserts or updates, so
certainly autovacuum should have caught up to them by now. But, I tried it anyway and lo and behold:

```sql
db=> select count(*) from voter_ncvoter;
  count
----------
 12336571
(1 row)
Time: 315777.051 ms
db=> vacuum analyze;
VACUUM
Time: 11377035.096 ms
db=> select count(*) from voter_ncvoter;
  count
----------
 12336571
(1 row)
Time: 4300.107 ms
```

Woah, that worked! Sure, it took 3+ hours to run ANALYZE, but wow. So, why isn't autovacuum
automatically doing this for us. (I mean it has the phrase 'auto' in its name!!!)

I've found this great article on 
[autovacuum basics](https://blog.2ndquadrant.com/autovacuum-tuning-basics/) which led me to do this query:

```sql
db=> select relname, n_live_tup, last_autoanalyze from pg_stat_all_tables where relname like 'voter_%';
       relname       | n_live_tup |       last_autoanalyze
---------------------+------------+------------+-------------------------------
 voter_changetracker |  306689271 | 2018-05-05 04:59:08.503876+00
 voter_filetracker   |         41 | 2018-05-13 02:00:47.802633+00
 voter_ncvhis        |          0 |
 voter_ncvoter       |   12336616 | 2018-05-06 13:20:30.073426+00
 voter_badlinerange  |        404 | 2018-04-10 05:44:39.949193+00
(5 rows)
```

So those 2 large tables haven't been ANALYZEd in weeks, despite the fact that we import a 10 million
row CSV once every week. This is the end of my debugging road, for now. Hopefully, I'll figure out
what's going on.

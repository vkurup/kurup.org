---
categories:
- django
- programming
date: 2014-07-28T22:08:00
title: Using dynamic queries in a CBV
---


Let's play 'Spot the bug'. We're building a simple system that shows photos. Each photo has a
`publish_date` and we should only show photos that have been published (i.e. their `publish_date` is
in the past).

``` python models.py
class PhotoManager(models.Manager):
    def live(self, as_of=None):
        if as_of is None:
            as_of = timezone.now()
        return super().get_query_set().filter(publish_date__lte=as_of)
```

And the view to show those photos:

``` python views.py
class ShowPhotosView(ListView):
    queryset = Hero.objects.live()
```

Can you spot the bug? I sure didn't... until the client complained that newly published photos never
showed up on the site. Restarting the server fixed the problem temporarily. The newly published
photos would show up, but then any photos published after the server restart again failed to
display.

The problem is that the `ShowPhotosView` class is instantiated when the server starts.
`ShowPhotosView.queryset` gets set to the value returned by `Hero.objects.live()`. That, in turn, is a
`QuerySet`, but it's a `QuerySet` with `as_of` set to `timezone.now()` *WHEN THE SERVER STARTS UP*. That
`as_of` value never gets updated, so newer photos never get captured in the query.

There's probably multiple ways to fix this, but an easy one is:

``` python views.py
class ShowPhotosView(ListView):
    def get_queryset(self):
        return Hero.objects.live()
```

Now, instead of the queryset being instantiated at server start-up, it's instantiated only when
`ShowPhotosView.get_queryset()` is called, which is when a request is made.

---
categories:
- django
- programming
comments: true
date: '2014-07-21T20:44:00'
title: How to create test models in Django
---


It's occasionally useful to be able to create a Django model class in your unit test suite. Let's
say you're building a library which creates an
[abstract model](https://docs.djangoproject.com/en/dev/topics/db/models/#abstract-base-classes)
which your users will want to subclass. There's no need for your library to subclass it, but your
library should still test that you can create a subclass and test out its features. If you create
that model in your `models.py` file, then Django will think that it is a real part of your library and
load it whenever you (or your users) call `syncdb`. That's bad.

The [solution](https://code.djangoproject.com/ticket/7835#comment:24) is to create it in a `tests.py`
file within your Django app. If it's not in `models.py`, Django won't load it during `syncdb`.

``` python tests.py
from django.db import models
from django.test import TestCase

from .models import MyAbstractModel

class MyTestModel(MyAbstractModel):
    name = models.CharField(max_length=20)

class AbstractTest(TestCase):
    def test_my_test_model(self):
        self.assertTrue(MyTestModel.objects.create(name='foo'))

```

A problem with this solution is that I rarely use a single `tests.py` file. Instead we use multiple
test files collected in a tests package. If you try to create a model in `tests/test_foo.py`, then
this approach fails because Django tries to create the model in an application named `tests`, but
there is no such app in INSTALLED_APPS. The solution is to set `app_label` to the name of your app
in an inner Meta class.

```python tests/test_foo.py
from django.db import models
from django.test import TestCase

from ..models import MyAbstractModel

class MyTestModel(MyAbstractModel):
    name = models.CharField(max_length=20)

    class Meta:
        app_label = 'myappname'

class AbstractTest(TestCase):
    def test_my_test_model(self):
        self.assertTrue(MyTestModel.objects.create(name='foo'))

```

Oh, and I almost forgot... if you use [South](http://south.readthedocs.org/en/latest/index.html),
this might not work, unless you set `SOUTH_TESTS_MIGRATE` to `False` in your settings file.

Comments and corrections welcome!

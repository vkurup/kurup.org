---
date: 2020-08-17T16:30:00
title: Django forms have 2 modes
categories:
- django
- programming
---

I worked on adding tests to some Django forms today and I was reminded that Django forms
operate in two *modes*. I think of them as the GET mode and the POST mode. The GET mode
displays the form and the POST mode processes the data that you supply to the form. I
don't know why, but I often forget that. Instead, I sometimes treat them as a normal
Python class, especially when I'm creating automated tests for them. I instantiate
the class (`form = MyForm()`) and then just call any of its methods and make sure they
return the right values or achieve the correct side effects. The form that I was working
with today had a couple features. The first was that it provided some helper functions
to the template so that the template could display the form properly. Those are in the
GET mode. So I did something like:

```
user = create_my_special_user()
form = MyForm(user=user)
self.assertTrue(form.is_user_special())
```

And that worked as I expected. The second feature of my custom form was that it cleaned
the data in a particular way. So I did:

```
form = MyForm(user=user)
cleaned_data = form.clean()
self.assertEqual(cleaned_data, expected_data)
```

Instead of passing, the test blew up:

```
AttributeError: 'MyForm' object has no attribute 'cleaned_data'
```

Why? Because the `clean()` method is called when you provide it with POST data
(normally... there are also other ways to populate forms). If you don't supply it data,
then `cleaned_data` doesn't get populated. The answer is to provide data to the form:

```
form = MyForm(user=user, data={})
cleaned_data = form.clean()
self.assertEqual(cleaned_data, expected_data)
```

And that works as expected. The reminder to myself is to always identify which mode of
the form you are testing, GET or POST.

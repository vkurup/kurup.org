---
date: 2020-12-11T20:57:39
title: Install multiple python versions using pyenv
categories:
- cheatsheet
- python
- linux
- bash
---

[pyenv](https://github.com/pyenv/pyenv) is awesome and has changed the way that I manage
my Python environments. One tiny annoyance is that it takes a looong time to install
each Python version, which of course makes sense, since it has to download and compile
each version on your machine. But it's not a big deal, since you generally just do this
once and then not again until you really need to upgrade to a different Python version.

Recently, though, I was working on a project that uses tox to make sure that the project
runs on multiple Python versions, in this case 3.6, 3.7, 3.8, 3.9. The specific versions
were included in the `.python-version` file, which looked like this:

```
3.9.0
3.8.6
3.7.9
3.6.12
```

I didn't have all of these installed, so rather than doing `pyenv install 3.9.0` and
then waiting a few minutes, and then repeating the process for each version, I wrote up
this little script, which I named `pyinstall.sh`:

```bash
#!/bin/bash
# Install all versions specified in .python-version
set -ex

while read version; do
    pyenv install -s "$version"
done <.python-version
```

Since `pyenv` is nice enough to include the `-s` flag which means "skip if already
installed", this can be run as many times as you want and it will only install the
version if it's not already installed

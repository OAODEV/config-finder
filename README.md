# config-finder

[![Circle CI](https://circleci.com/gh/OAODEV/config-finder.svg?style=svg)](https://circleci.com/gh/OAODEV/config-finder)

Python library that knows how to scare up some config.

# Installation

* Install git & pip in your container by including the following in your Dockerfile:
 * `RUN apt-get update && apt-get install -y git python-pip`

* Install via pip by including the following in your Dockerfile:
 * `RUN pip install git+https://github.com/OAODEV/config-finder.git`

# How It Works

config-finder checks three spots for configuration in the following order:

* environment variables
* the contents of a file at `/secret/<key>`
* the first line containing `<key>=<value>\n` in a file at `/env`

The first location containing a result will be returned and the remaining locations will be ignored.


# Usage

The `cfg` function returns a value for the given key, or the specified default. If key is not available and no default is set, then `cfg` raises a `KeyError`.

```
from config_finder import cfg
print "The value for myKey is '{}'".format(cfg("mykey", None))
```

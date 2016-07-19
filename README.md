# config-finder

[![Circle CI](https://circleci.com/gh/OAODEV/config-finder.svg?style=svg)](https://circleci.com/gh/OAODEV/config-finder)

Python library that knows how to scare up some config.

# Installation

* Install git & pip in your container by including the following in your Dockerfile:
 * `RUN apt-get update && apt-get install -y git python-pip`

* Install via pip by including the following in your Dockerfile:
 * `RUN pip install git+https://github.com/OAODEV/config-finder.git`

# useage

Import `cfg` and it will find your config if it's in any of the right places.

    >>> from config_finder import cfg
    >>> cfg("key")
    "value"

config-finder checks three spots for configuration in the following order:

* environment variables
* the contents of a file at `/secret/<key>`
* the first line containing `<key>=<value>\n` in a file at `/env`

The first location containing a result will be returned and the remaining
locations will be ignored. If it's not in any of these places it will throw a
`KeyError`.

## default values

If you would prefer to provide a default value rather than handle an error on a
key miss, just pass it in.

    >>> cfg("missingKey", "default")
    "default"

## Extending the search spots

You may extend the search for config by importing `check_first` and giving it
a list of check functions.

A check function must take a key and return a value or raise an error.

    >>> from config_finder improt check_first
    >>> local_config = {"keyX": "valueX"}
    >>> check_local = lambda x: local_config[x]
    >>> extended_cfg = check_first([check_local])
    >>> extended_cfg("keyX", "default")
    "valueX"

The extended function will fall back to `cfg` itself.

    >>> extended_cfg("key", "default")
    "value"
    >>> extended_cfg("missingKey", "default")
    "default"
=======
# How It Works




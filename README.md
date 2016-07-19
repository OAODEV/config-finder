# config-finder

[![Circle CI](https://circleci.com/gh/OAODEV/config-finder.svg?style=svg)](https://circleci.com/gh/OAODEV/config-finder)

Python library that knows how to scare up some config.

# useage

Import `cfg` and it will find your config if it's in any of the right places.

    >>> from config_finder import cfg
    >>> cfg("key")
    "value"

If it's not in the right place it will throw a `KeyError`.

By default it checks 3 places, the environment, a file with the name
`/secret/<key>` and contents of `<value>` and a line in a file at `/env` of the
form `<key>=<value>`.

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

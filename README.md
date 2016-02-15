# config-finder

[![Circle CI](https://circleci.com/gh/OAODEV/config-finder.svg?style=svg)](https://circleci.com/gh/OAODEV/config-finder)

Python library that knows how to scare up some config.

it checks three spots.

first:  `os.environ[key]`

second: The contents of a file at `/secret/<key>`

third: The first line containing `<key>=<value>\n` in a file at `/env`

# config-finder

[![Circle CI](https://circleci.com/gh/OAODEV/config-finder.svg?style=svg)](https://circleci.com/gh/OAODEV/config-finder)

Python library that knows how to scare up some config.

# Checks three spots for configuration.

## first

The environment

## second

The contents of a file at `/secret/<key>`

## third

The first line containing `<key>=<value>\n` in a file at `/env`

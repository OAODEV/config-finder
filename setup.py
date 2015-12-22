from setuptools import setup
from os import path

here = path.abspath(path.dirname(__file__))

setup(
    name='config_finder',
    version='1.0.0',
    description='Python library that knows how to scare up some config.',
    url='https://github.com/OAODEV/config-finder',
    author="Jesse B. Miller",
    author_email="jesse.miller@adops.com",
    packages=['config_finder'],
    classifiers=[],
)

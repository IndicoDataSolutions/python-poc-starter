#!/usr/bin/env python
from setuptools import setup

setup(
    name="{{package}}",
    version="0.1",
    description="{{description}}",
    author="{{author}}",
    author_email="{{email}}",
    packages=["{{package}}"],
    install_requires=[],
    extras_require={"test": ["pytest"]},
)

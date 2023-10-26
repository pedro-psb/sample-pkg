from __future__ import annotations

import os

from setuptools import find_packages
from setuptools import setup


def read(*names, **kwargs):
    """Read a file."""
    content = ""
    with open(
        os.path.join(os.path.dirname(__file__), *names),
        encoding=kwargs.get("encoding", "utf8"),
    ) as open_file:
        content = open_file.read().strip()
    return content


setup(
    name="pedropsb_samplepkg",
    version=read("samplepkg", "VERSION"),
    license="MIT",
    license_files=["LICENSE"],
    author="Pedro Brochado",
    description="A sample package project for personal testing purposes.",
    long_description=read("README.md"),
    long_description_content_type="text/markdown",
    packages=find_packages(
        exclude=[
            "tests",
            "tests.*",
            "docs",
            "docs.*",
            "build",
            "build.*",
        ]
    ),
    include_package_data=True,
    zip_safe=False,
    platforms="any",
    tests_require=["pytest"],
    python_requires=">=3.8",
    setup_requires=["setuptools>=38.6.0"],
)

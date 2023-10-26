SHELL := /bin/bash
.PHONY: all citest clean dist install test help

help:
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'

all: clean install test 

test:
	py.test -v -l --tb=short --maxfail=1 tests/

citest:
	py.test -v -l tests/

ciinstall:
	python -m pip install --upgrade pip
	python -m pip install -r requirements_ci.txt

install:
	pip install --upgrade pip
	pip install -r requirements_ci.txt

dist: clean
	@python setup.py sdist bdist_wheel

clean:
	@find ./ -name '*.pyc' -exec rm -f {} \;
	@find ./ -name '__pycache__' -prune -exec rm -rf {} \;
	@find ./ -name 'Thumbs.db' -exec rm -f {} \;
	@find ./ -name '*~' -exec rm -f {} \;
	rm -rf .cache
	rm -rf build
	rm -rf dist
	rm -rf *.egg-info
	rm -rf htmlcov
	rm -rf .tox/
	rm -rf site

#!/bin/env bash

echo "Checking dist build health"

python -m venv venv
source venv/bin/activate
for dist in dist/*; do
    pip install --quiet "${dist}"
    dynaconf list --help 1>/dev/null
    pip uninstall --quiet --yes dynaconf
done

echo "Done"

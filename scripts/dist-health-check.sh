#!/bin/env bash

set -euo pipefail
echo "Checking dist build health"

python -m venv venv
source venv/bin/activate
for dist in dist/*; do
    pip install --quiet "${dist}"
    python -m samplepkg.main 1>/dev/null
done

echo "Done"

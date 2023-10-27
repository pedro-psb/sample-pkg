#!/bin/bash

echo "Bumping version reference in files"

if [ -z $NEXT_VERSION_BUMP ]; then
  echo "No version provided by envvar"
  exit 1
fi

set -euo pipefail

# choose bump
case "$NEXT_VERSION_BUMP" in
  patch)
    ;;
  minor)
    ;;
  *)
    echo "Not valid. For majors, do it manually."
    exit 1
    ;;
esac
    

# Generate new packages using envvar NEW_PACKAGE_VERSION
current_version="$(cat samplepkg/VERSION)"
echo "Current version is $current_version"

bump2version \
  --current-version $current_version \
  $NEXT_VERSION_BUMP \
  samplepkg/VERSION

new_version="$(cat samplepkg/VERSION)"
echo "New $NEXT_VERSION_BUMP version is $new_version"

# update doc header
# sed -i "s/Dynaconf - [[:digit:]]*.[[:digit:]]*.[[:alnum:]]*/Dynaconf - ${new_version}/" mkdocs.yml

echo "Done"


#!/bin/bash

# Define the versions you want to iterate over
versions=("1.12.1" "1.13.0")

for version in "${versions[@]}"; do
  mkdir -p "dist/v$version"
  npm install --no-save "@gouvfr/dsfr@$version"
  cp -r "node_modules/@gouvfr/dsfr/dist" "dist/v$version/"
  cp -r "node_modules/@gouvfr/dsfr/example" "dist/v$version/"

  # Test if storybook exists
  if [ -d "node_modules/@gouvfr/dsfr/storybook" ]; then
    cp -r "node_modules/@gouvfr/dsfr/storybook" "dist/v$version/"
  fi

  cp -r "node_modules/@gouvfr/dsfr/doc" "dist/v$version/"
done

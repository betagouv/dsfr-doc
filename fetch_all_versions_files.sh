#!/bin/bash

versions=$(jq -r '.versions[]' package.json)

for version in $versions; do
  mkdir -p "dist/v$version"
  npm install --no-save "@gouvfr/dsfr@$version"

  cp -r "node_modules/@gouvfr/dsfr/dist" "dist/v$version/"
  cp -r "node_modules/@gouvfr/dsfr/example" "dist/v$version/"
  cp -r "node_modules/@gouvfr/dsfr/doc" "dist/v$version/"

  if [ -d "node_modules/@gouvfr/dsfr/storybook" ]; then
    cp -r "node_modules/@gouvfr/dsfr/storybook" "dist/v$version/"
  fi

done

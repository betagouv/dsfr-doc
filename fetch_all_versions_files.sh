#!/bin/bash

versions=$(jq -c '.versions[]' package.json)

for version in $versions; do
  version_number=$(echo $version | jq -r '.number')
  has_storybook=$(echo $version | jq -r '.storybook')

  printf "\nFetching files for version $version_number - Storybook: $has_storybook\n"
  mkdir -p "dist/v$version"
  npm install --no-save "@gouvfr/dsfr@$version_number"

  cp -r "node_modules/@gouvfr/dsfr/dist" "dist/v$version_number/"
  cp -r "node_modules/@gouvfr/dsfr/example" "dist/v$version_number/"
  cp -r "node_modules/@gouvfr/dsfr/doc" "dist/v$version_number/"

  if [ "$has_storybook" = "true" ]; then
    cp -r "node_modules/@gouvfr/dsfr/storybook" "dist/v$version_number/"
  fi
done

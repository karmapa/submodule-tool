#!/bin/bash

function install_sub() {
  BASE_PATH=$(pwd)
  SUB_PATHS=$(cat ./.gitmodules | grep path | awk '{print $3}')
  for path in $SUB_PATHS; do
    test -d "$path" || continue
    cd $path
    if test -e "package.json"; then
      rm -rf node_modules/
      yarn
    fi
    cd "$BASE_PATH"
  done
}

if test -e ".gitmodules"; then
  install_sub
else
  echo "no .gitmodules in "$(pwd)
fi

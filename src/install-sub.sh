#!/bin/bash
function installSub(){
  BASE_PATH=$(pwd)
  SUB_PATHS=$(cat ./.gitmodules | grep path | awk '{print $3}')
  for path in $SUB_PATHS; do
    test -d "$path" || continue
    cd $path
    if test -e "package.json"; then
      if cat package.json | grep -iq dependencies; then
        echo "npm installing "$path
        npm i
        cd "$BASE_PATH"
      else
        echo "no dependencies in package.json "$path
        cd "$BASE_PATH"
      fi
    else
      echo "no package.json "$path
      cd "$BASE_PATH"
    fi
  done
}

if test -e ".gitmodules"; then
  installSub
else
  echo "no .gitmodules in "$(pwd)
fi




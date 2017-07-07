#!/bin/bash
function rebuildSub(){
  BASE_PATH=$(pwd)
  SUB_PATHS=$(cat ./.gitmodules | grep path | awk '{print $3}')
  GREEN='\033[0;32m'
  NC='\033[0m' # No Color
  for path in $SUB_PATHS; do
    test -d "$path" || continue
    cd $path
    echo -e "${GREEN}rebuild in "$path"${NC}"
    npm rebuild
    cd "$BASE_PATH"
  done
}

if test -e ".gitmodules"; then
  rebuildSub
else
  echo "no .gitmodules in "$(pwd)
fi




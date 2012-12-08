#!/bin/bash

# create a release to a separate direction

if [ -z "$1" ]; then
  echo "Usage: $0 <release_number>"
  exit 1
fi

RELEASE="$1";

LONG_DIR='/home/otoolej/deusto/software/fast_DTFDs/';
NEW_DIR=${LONG_DIR}/releases/fastTFDs_v;
NEW_DIR=${NEW_DIR}${RELEASE}


# 1. make new directory
mkdir $NEW_DIR

# 2. tag current git release (make sure git is up-to-date first)
if [ -n "$(git status --porcelain)" ]; then 
  echo "git is not up to date !"; 
  git status;
  exit;
else 
  echo "git ok; no changes";
fi

git tag "release_v$RELEASE"


# 3. copy all to new direction and clean-up
cp -R * ${NEW_DIR}/
rm -f ${NEW_DIR}/notes.org
rm -f ${NEW_DIR}/create_release.sh
rm -rf ${NEW_DIR}/.git

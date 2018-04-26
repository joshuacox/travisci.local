#!/bin/bash
AUTHOR=$1
PROJECT=$2
BRANCH=$3
# https://stackoverflow.com/a/41935867
# Install travis-build to generate a .sh out of .travis.yml
cd ~/builds
mkdir $AUTHOR
cd $AUTHOR
echo "git clone https://github.com/$AUTHOR/$PROJECT.git"
git clone https://github.com/$AUTHOR/$PROJECT.git
cd $PROJECT
yes | ~/.travis/travis-build/bin/travis compile > ci.sh
this_regex="s/--branch\S* /--branch\\=$BRANCH\\ /"
sed -i "$this_regex" ci.sh
bash ci.sh

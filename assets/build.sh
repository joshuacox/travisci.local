#!/bin/bash
# https://stackoverflow.com/a/41935867
# Install travis-build to generate a .sh out of .travis.yml
cd $HOME/builds
git clone https://github.com/travis-ci/travis-build.git
cd travis-build
gem install bundler
bundler add travis
# to create ~/.travis
yes | travis version
ln -s `pwd` ~/.travis/travis-build
bundle install --gemfile ~/.travis/travis-build/Gemfile
bundler binstubs travis

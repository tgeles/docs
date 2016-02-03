#!/bin/bash

# Helper script for publishing RPC documentation to github.rackspace.com.
# Run from the master branch of the internal RPC repository.

# set repo root directory
GITDIR=`git rev-parse --show-toplevel`

# set source directories
SOURCE='docs'

# ensure master is up-to-date
cd $GITDIR
# git fetch upstream
# git merge upstream/master
# git push origin master

# checkout gh-pages branch and delete contents except . files
# git checkout gh-pages
# find ./* -not -name ".*" -delete

# checkout source directories from master and reset HEAD
# git checkout master $SOURCE
# git reset HEAD

# remove symlinks and move external books to internal directory
# find internal/* -maxdepth 0 -type l -delete

# run tests and build html from rst
tox

# move html files to root directory
mv -fv docs/_build/html/* $GITDIR/

# add, commit, and push new html files
git add .
git commit -m "publish: `git log master -1 --pretty=short --abbrev-commit`"
git push

echo
tput setaf 2; echo "Docs published to kallimachos.github.io"
tput sgr0

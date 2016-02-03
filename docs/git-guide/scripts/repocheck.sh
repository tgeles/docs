#!/bin/bash

# This script runs 'git status -s' on each repository. It is helpful for checking if you have any work that has not been committed or pushed. Note that the output is the short (-s) version. No message means that the working directory is clean. If you receive a message, run 'git status' on the indicated repository for full information.

# You must change ~/docs/* to the location of the git repositories on your local machine.

for dir in ~/docs/*; do
    if test -d $dir && test -e $dir/.git; then
        cd $dir && echo $dir
        git status -s && echo
    fi
done
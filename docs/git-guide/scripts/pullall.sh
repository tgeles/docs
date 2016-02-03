#!/bin/bash

# This script runs 'git pull' on all remote repositories. It is helpful for pulling down changes from all the remote repositories in one action.

# You must change ~/docs/* to the location of the git repositories on your local machine.

for dir in ~/docs/*; do
    if test -d $dir && test -e $dir/.git; then
        cd $dir && echo $dir
        git pull && echo
    fi
done
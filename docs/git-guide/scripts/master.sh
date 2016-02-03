#!/bin/bash

#This script runs 'git checkout master' on all repositories. Note that if you run this command with uncommitted changes in non-master branches, those changes will be copied to their corresponding master branch.

# You must change ~/docs/* to the location of the git repositories on your local machine.

for dir in ~/docs/*; do
	if test -d $dir && test -e $dir/.git; then
        cd $dir && echo $dir
        git checkout master && echo
    fi
done
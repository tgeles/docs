#!/bin/bash

# This script runs 'git branch -a' on all repositories. It shows you all the local and remote branches, and indicates which branches you have checked out. Remove the '-a' option to view only local branches.

# You must change ~/docs/* to the location of the git repositories on your local machine.

for dir in ~/docs/*; do
	if test -d $dir && test -e $dir/.git; then
        cd $dir && echo $dir
        git branch -a && echo
    fi
done
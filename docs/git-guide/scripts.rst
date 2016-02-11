=======
Scripts
=======

.. _repocheck:

repocheck.sh
~~~~~~~~~~~~

.. code::

   #!/bin/bash

   # Print ``git status -s -b`` of repos in the listed directories if they have
   # uncommitted changes or if they are not on the master branch.

   repos=(openstack rpcdocs code code/python scripts)

   echo

   for item in ${repos[@]}; do
       root=~/$item/*
       for dir in $root; do
           if test -d $dir && test -e $dir/.git; then
               cd $dir && echo $dir
               branch=$(git status -s -b)
               if ! [ "$branch" = "## master...origin/master" ]; then
                   git status -s -b
               fi
           fi
       done
   done
   echo



.. _master:

master.sh
~~~~~~~~~

.. code::

   #!/bin/bash

   # This script runs 'git checkout master' on all repositories. Note that
   # if you run this command with uncommitted changes in non-master branches,
   # those changes will be copied to their corresponding master branch.

   # You must change ~/docs/* to the location of the git repositories on your
   # local machine.

   for dir in ~/docs/*; do
       if test -d $dir && test -e $dir/.git; then
           cd $dir && echo $dir
           git checkout master && echo
       fi
   done


.. _branchlist:

branchlish.sh
~~~~~~~~~~~~~

.. code::

   #!/bin/bash

   # This script runs 'git branch -a' on all repositories. It shows you all
   # the local and remote branches, and indicates which branches you have
   # checked out. Remove the '-a' option to view only local branches.

   # You must change ~/docs/* to the location of the git repositories on your
   # local machine.

   for dir in ~/docs/*; do
       if test -d $dir && test -e $dir/.git; then
           cd $dir && echo $dir
           git branch -a && echo
       fi
   done


.. _pullall:

pullall.sh
~~~~~~~~~~

.. code::

   #!/bin/bash

   # This script runs 'git pull' on all remote repositories. It is helpful
   # for pulling down changes from all the remote repositories in one action.

   # You must change ~/docs/* to the location of the git repositories on your
   # local machine.

   for dir in ~/docs/*; do
       if test -d $dir && test -e $dir/.git; then
           cd $dir && echo $dir
           git pull && echo
       fi
   done

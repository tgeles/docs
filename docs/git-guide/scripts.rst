=======
Scripts
=======

.. _repocheck:

repocheck.sh
~~~~~~~~~~~~

.. code::

   #!/bin/bash

   # This script runs 'git status -s' on each repository. It is helpful for
   # checking if you have any work that has not been committed or pushed. Note
   # that the output is the short (-s) version. No message means that the
   # working directory is clean. If you receive a message, run 'git status' on
   # the indicated repository for full information.

   # You must change ~/docs/* to the location of the git repositories on your
   # local machine.

   for dir in ~/docs/*; do
       if test -d $dir && test -e $dir/.git; then
           cd $dir && echo $dir
           git status -s && echo
       fi
   done


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

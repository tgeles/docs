==================
Using Bash Scripts
==================

The following bash scripts can be used to run certain git commands
across several repositories. These scripts can be run from any
directory, and will return you to the directory in which you started.
Creating aliases for your scripts for easy access is recommended.

.. note::

   You must change ``~/docs/*`` in each script to the location of the git
   repositories on your local machine.

**Creating Bash Aliases**

#. Create the script in a convenient location, for example
   **~/scripts/**

#. Make the script executable:

   ``$ chmod a+x myscript.sh``

#. Open **~/.bashrc** and add an alias for the script:

   ``alias myscript='~/scripts/myscript.sh'``

#. Save the change, then reload the file for the current terminal
   session:

   ``$ source ~/.bashrc``

#. Run the script by using the alias on the command line:

   ``$ myscript``


Sample Scripts
~~~~~~~~~~~~~~

:ref:`repocheck`
----------------

This script runs ``git status -s`` on each repository. It is helpful for
checking if you have any work that has not been committed or pushed.
Note that the output is the short (-s) version. No message means that
the working directory is clean. If you receive a message, run
``git status`` on the indicated repository for full information.

Example Output:

.. code::

   /docs/administration-guide

   /docs/release-notes

   /docs/rest-api-guide

   /docs/user-guide

:ref:`master`
-------------

This script runs ``git checkout master`` on all repositories. Note that
if you run this command with uncommitted changes in non-master branches,
those changes will be copied to their corresponding master branch.

Example Output:

.. code::

   /docs/administration-guide
   Already on 'master'

   /docs/release-notes
   Already on 'master'

   /docs/rest-api-guide
   Already on 'master'

   /docs/user-guide
   Already on 'master'

:ref:`branchlist`
-----------------

This script runs ``git branch -a`` on all repositories. It shows you all
the local and remote branches, and indicates which branches you have
checked out. Remove the ``-a`` option to view only local branches.

Example Output:

.. code::

   /docs/administration-guide
   * master
     remotes/origin/1.0
     remotes/origin/1.1
     remotes/origin/master

   /docs/release-notes
     Enterprise
     Online
   * master
     remotes/origin/Enterprise
     remotes/origin/Online
     remotes/origin/master

   /docs/rest-api-guide
     Enterprise
   * master
     remotes/origin/Enterprise
     remotes/origin/master

   /docs/user-guide
     Enterprise
   * master
     remotes/origin/Enterprise
     remotes/origin/master

:ref:`pullall`
--------------

This script runs ``git pull`` on all remote repositories. It is helpful
for pulling down changes from all the remote repositories in one action.

Example Output:

.. code::

   /docs/administration-guide
   Already up-to-date.

   /docs/release-notes
   Already up-to-date.

   /docs/REST-api-guide
   Already up-to-date.

   /docs/user-guide
   Already up-to-date.

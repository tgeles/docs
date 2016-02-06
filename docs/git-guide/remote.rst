============================
Working with Remote Branches
============================

.. list-table::
   :widths: 50 50
   :header-rows: 1

   * - Command
     - Result
   * - git checkout --track origin/\ *branch*
     - creates and checks out a local tracking branch for the specified remote
       branch
   * - git fetch origin
     - fetches the remote repository and stores it locally, but does not merge
       it with the current branch
   * - git pull
     - fetches and merges the remote repository with the local repository
   * - git pull origin *branch*
     - fetches and merges the specified remote branch with the current local
       branch
   * - git rebase -i origin/master
     - interactively combines multiple commits into a single commit and rebases
       from origin/master. ``pick`` the first commit listed, and enter
       ``squash`` for the rest.
   * - git push
     - pushes all committed changes on all branches to the remote repo
   * - git push origin *branch1*:*branch2*
     - creates a remote branch *branch2* and pushes the local branch *branch1*
       to it
   * - git push origin :*branch*
     - deletes the specified remote branch
   * - git reset --hard origin/\ *branch*
     - resets the checked-out local branch to the status of the specified
       remote branch; running ``git fetch origin`` first is recommended

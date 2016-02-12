===========================
Working with Local Branches
===========================

.. list-table::
   :widths: 50 50
   :header-rows: 1

   * - Command
     - Result
   * - git add *file*
     - adds the specified, untracked file to the index. Also used to update
       files to be committed after fixing merge conflicts.
   * - git commit -m "*message*" *file*
     - commits changes in the specified file or directory to the local
       repository
   * - git commit -m "*message*" -a
     - adds all new files to the index and commits all changes to the local
       repository
   * - git stash
     - stashes current changes and sets branch to last commit. Useful for
       switching branches or pulling remote changes without having to commit
       local changes first.
   * - git stash apply
     - applies the changes stashed using the ``git stash`` command
   * - git rebase -i master
     - interactively combines multiple commits into a single commit and rebases
       from master. ``pick`` the first commit listed, and enter ``squash`` for
       the rest.
   * - git branch
     - displays local branches
   * - git branch -a
     - displays all local and remote branches
   * - git branch *branch*
     - creates a new local branch with the specified name
   * - git checkout *branch*
     - checks out the specified local branch. If you checkout another branch
       without committing changes in the current branch, the uncommitted files
       will be copied to the new branch.
   * - git branch -d *branch*
     - deletes the specified local branch if it has been merged
   * - git branch -D *branch*
     - deletes the specified local branch regardless of its merge status
   * - git remote update --prune
     - updates list of remote branches on the local machine

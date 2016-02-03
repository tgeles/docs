#Git Guide

**Version 1.0**

Some basic information on using Git version control.

[1. Introduction](#head1)

[2. Working with Local Branches](#head2)

[3. Working with Remote Branches](#head3)

[4. Merging Branches](#head4)

[5. Using Bash Scripts](#head5)


##<a name="head1"></a>1. Introduction

Git is a distributed revision control and source code management (SCM) system with an emphasis on speed. Git was initially designed and developed by Linus Torvalds for Linux kernel development; it has since been adopted by many other projects. Every Git working directory is a full-fledged repository with complete history and full revision tracking capabilities, and is not dependent on network access or a central server. Git is free software distributed under the terms of the GNU General Public License version 2.


##<a name="head2"></a>2. Working with Local Branches

| Command | Result |
| ------- | ------ |
| git add *file* | adds the specified, untracked file to the index. Also used to update files to be committed after fixing merge conflicts. |
| git commit -m '*message*' *file* | commits changes in the specified file or directory to the local repository |
| git commit -m '*message*' -a | adds all new files to the index and commits all changes to the local repository |
| git stash | stashes current changes and sets branch to last commit. Useful for switching branches or pulling remote changes without having to commit local changes first. |
| git stash apply | applies the changes stashed using the `git stash` command |
| git rebase -i master | interactively combines multiple commits into a single commit and rebases from master. `pick` the first commit listed, and enter `squash` for the rest. |
| git branch | displays local branches |
| git branch -a | displays all local and remote branches |
| git branch *branch* | creates a new local branch with the specified name |
| git checkout *branch* | checks out the specified local branch. If you checkout another branch without committing changes in the current branch, the uncommitted files will be copied to the new branch. |
| git branch -d *branch* | deletes the specified local branch if it has been merged |
| git branch -D *branch* | deletes the specified local branch regardless of its merge status |

⁠
##<a name="head3"></a>3. Working with Remote Branches

| Command | Result |
| ------- | ------ |
| git checkout --track origin/*branch* | creates and checks out a local tracking branch for the specified remote branch|
| git fetch origin | fetches the remote repository and stores it locally, but does not merge it with the current branch |
| git pull | fetches and merges the remote repository with the local repository |
| git pull origin *branch* | fetches and merges the specified remote branch with the current local branch |
| git rebase -i origin/master | interactively combines multiple commits into a single commit and rebases from origin/master. `pick` the first commit listed, and enter `squash` for the rest. |
| git push | pushes all committed changes on all branches to the remote repo |
| git push origin *branch1*:*branch2* | creates a remote branch *branch2* and pushes the local branch *branch1* to it |
| git push origin :*branch* | deletes the specified remote branch |
| git reset --hard origin/*branch* | resets the checked-out local branch to the status of the specified remote branch; running `git fetch origin` first is recommended |
⁠

##<a name="head4"></a>4. Merging Branches

| Command | Result |
| ------- | ------ |
| git cherry-pick *commit* | cherry-picks the specified commit to the current branch |
| git merge *branch* | merges all commits from the specified branch into the current branch |
| git rebase master | rebase your current branch using master |
| git rebase origin/master | rebase your current branch using origin/master |

##<a name="head5"></a>5. Using Bash Scripts

The following bash scripts can be used to run certain git commands across several repositories. These scripts can be run from any directory, and will return you to the directory in which you started. Creating aliases for your scripts for easy access is recommended.

**Note:** you must change `~/docs/*` in each script to the location of the git repositories on your local machine.

###Creating Bash Aliases

1. Create the script in a convenient location, for example **~/scripts/**
2. Make the script executable:
  * `$ chmod a+x myscript.sh`
3. Open **~/.bashrc** and add an alias for the script:
  * `alias myscript='~/scripts/myscript.sh'`
4. Save the change, then reload the file for the current terminal session:
  * `$ source ~/.bashrc`
5. Run the script by using the alias on the command line:
  * `$ myscript`

###Sample Scripts

####[repocheck.sh](scripts/repocheck.sh)
This script runs `git status -s` on each repository. It is helpful for checking if you have any work that has not been committed or pushed. Note that the output is the short (-s) version. No message means that the working directory is clean. If you receive a message, run `git status` on the indicated repository for full information.

Example Output:

~~~~ {.screen}
/docs/administration-guide

/docs/release-notes

/docs/rest-api-guide

/docs/user-guide
~~~~

####[master.sh](scripts/master.sh)
This script runs `git checkout master` on all repositories. Note that if you run this command with uncommitted changes in non-master branches, those changes will be copied to their corresponding master branch.

Example Output:

~~~~ {.screen}
/docs/administration-guide
Already on 'master'

/docs/release-notes
Already on 'master'

/docs/rest-api-guide
Already on 'master'

/docs/user-guide
Already on 'master'
~~~~

####[branchlist.sh](scripts/branchlist.sh)
This script runs `git branch -a` on all repositories. It shows you all the local and remote branches, and indicates which branches you have checked out. Remove the `-a` option to view only local branches.

Example Output:

~~~~ {.screen}
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
~~~~

####[pullall.sh](scripts/pullall.sh)
This script runs `git pull` on all remote repositories. It is helpful for pulling down changes from all the remote repositories in one action.

Example Output:

~~~~ {.screen}
/docs/administration-guide
Already up-to-date.

/docs/release-notes
Already up-to-date.

/docs/REST-api-guide
Already up-to-date.

/docs/user-guide
Already up-to-date.
~~~~

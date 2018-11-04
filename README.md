# Note on git


## CREATE

Clone an existing repository
$ git clone ssh://user@domain.com/repo.git

Create a new local repository
$ git init


## LOCAL CHANGES 	

Changed files in your working directory
$ git status 

Changes to tracked files
$ git diff

Add all current changes to the next commit
$ git add .

Add some changes in <file> to the next commit
$ git add -p <file>

Commit all local changes in tracked files
$ git commit -a 	

Commit previously staged changes
$ git commit 	

Change the last commit
Don‘t amend published commits!
$ git commit --amend


## COMMIT HISTORY 	

Show all commits, starting with newest
$ git log

Show changes over time for a specific file
$ git log -p <file>

Who changed what and when in <file>
$ git blame <file> 	


## BRANCHES & TAGS

List all existing branches
$ git branch -av

Switch HEAD branch
$ git checkout <branch>

Create a new branch based on your current HEAD
$ git branch <new-branch>

Create a new tracking branch based on  a remote branch
$ git checkout --track <remote/branch>

Delete a local branch
$ git branch -d <branch>

Mark the current commit with a tag
$ git tag <tag-name> 	


## UPDATE & PUBLISH

List all currently configured remotes
$ git remote -v 	

Show information about a remote
$ git remote show <remote>

Add new remote repository, named <remote>
$ git remote add <shortname> <url>

Alle Änderungen von <remote> runterladen, aber nicht in HEAD integrieren
$ git fetch <remote>

Download changes and directly merge/integrate  into HEAD
$ git pull <remote> <branch>

Publish local changes on a remote
$ git push <remote> <branch>

Delete a branch on the remote
$ git branch -dr <remote/branch>

Publish your tags
$ git push --tags


## MERGE & REBASE

Merge <branch> into your current HEAD
$ git merge <branch>

Rebase your current HEAD onto <branch>
Don‘t rebase published commits!
$ git rebase <branch>

Abort a rebase
$ git rebase --abort

Continue a rebase after resolving conflicts
$ git rebase --continue 	

Use your configured merge tool to solve conflicts
$ git mergetool

Use your editor to manually solve conflicts and  (after resolving) mark file as resolved
$ git add <resolved-file>
$ git rm <resolved-file>


## UNDO 	

Discard all local changes in your working directory
$ git reset --hard HEAD

Discard local changes in a specific file
$ git checkout HEAD <file>

Revert a commit  (by producing a new commit with contrary changes)
$ git revert <commit> 	

Reset your HEAD pointer to a previous commit
…and discard all changes since then
$ git reset --hard <commit>

…and preserve all changes as unstaged changes
$ git reset <commit>

…and preserve uncommitted local changes
$ git reset --keep <commit>


# Version control


## COMMIT RELATED CHANGES

A commit should be a wrapper for related changes. For example, fixing two different bugs should produce two separate commits. Small commits make it easier for other de- velopers to understand the changes and roll them back if something went wrong.
With tools like the staging area and the abi- lity to stage only parts of a file, Git makes it easy to create very granular commits.


## COMMIT OFTEN

Committing often keeps your commits small and, again, helps you commit only related changes. Moreover, it allows you to share your code more frequently with others. That way it‘s easier for everyone to integrate changes regularly and avoid having merge conflicts. Having few large commits and sharing them rarely, in contrast, makes it hard to solve conflicts.


## DON‘T COMMIT HALF-DONE WORK 	

You should only commit code when it‘s com- pleted. This doesn‘t mean you have
to complete a whole, large feature before committing. Quite the contrary: split the feature‘s implementation into logical chunks and remember to commit early and often. But don‘t commit just to have something in
the repository before leaving the office at the end of the day. If you‘re tempted to commit just because you need a clean working copy (to check out a branch, pull in changes, etc.) consider using Git‘s «Stash» feature instead.


## TEST CODE BEFORE YOU COMMIT

Resist the temptation to commit some- thing that you «think» is completed. Test it thoroughly to make sure it really is completed and has no side effects (as far as one can tell). While committing half-baked things in your local repository only requires you to forgive yourself, having your code tested is even more important when it comes to pushing/sharing your code with others.


## WRITE GOOD COMMIT MESSAGES

Begin your message with a short summary of your changes (up to 50 characters as a gui- deline). Separate it from the following body by including a blank line. The body of your message should provide detailed answers to the following questions:
›  What was the motivation for the change?
›  How does it differ from the previous implementation?
Use the imperative, present tense («change», not «changed» or «changes») to be consistent with generated messages from commands
like git merge.


## VERSION CONTROL IS NOT A BACKUP SYSTEM

Having your files backed up on a remote server is a nice side effect of having a version control system. But you should not use your VCS like it was a backup system. When doing version control, you should pay attention to committing semantically (see «related chan- ges») - you shouldn‘t just cram in files.


## USE BRANCHES

Branching is one of Git‘s most powerful features - and this is not by accident: quick and easy branching was a central requirement from day one. Branches are the perfect tool
to help you avoid mixing up different lines of development. You should use branches extensively in your development workflows: for new features, bug fixes, ideas…


## AGREE ON A WORKFLOW

Git lets you pick from a lot of different work- flows: long-running branches, topic bran- ches, merge or rebase, git-flow… Which one you choose depends on a couple of factors: your project, your overall development and deployment workflows and (maybe most importantly) on your and your teammates‘ personal preferences. However you choose to work, just make sure to agree on a common workflow that everyone follows.


## HELP & DOCUMENTATION

Get help on the command line
$ git help <command> 	


## This document is from git-tower
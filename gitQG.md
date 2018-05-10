### INIT A REPO
#### Create a new repository on the command line
''''
echo $2 >> README.md
git init
git add README.md
git commit -m "first commit INIT $ - $README"
git remote add origin https://github.com/$OWNER/$NAME.git
git push -u origin master
#For push an existing repository from the command line
git remote add origin https://github.com/$OWNER/$NAME.git
git push -u origin master
''''

Branches
--------
* Create a new branch: `git checkout -b <branch_name>`
* Move to a branch: `git checkout <branch_name>`
* Add a branch to upstream server: `git push --set-upstream origin <branch_name>`
* Push a branch: `git push -u origin <branch_name>`
* Merge two branches: `git merge <branch_name1> <branch_name2>`
* Delete a branch: `git branch -d <branch_name>`
* Update a branch with changes in master (Rebase): `git checkout <branch_name>; git rebase master`


Tags
----
* Create a new tag for version 1.4.0: `git tag -a v1.4.0 -m "Some Message."`
* View all tags: `git tag -n`
* Delete the tag for version 1.4.0: `git tag -d v1.4.0`
* Push the tags: `git push --tags`


Create Archive From Tag
-----------------------
* Create an archive for version 1.4.0 (Option 1): `git archive --prefix=<project_name>-1.4.0/ -o <project_name>-1.4.0.tar.gz v1.4.0`
* Create an archive for version 1.4.0 (Option 2): `git archive --format=tar.gz --prefix=<project_name>-1.4.0/ v1.4.0 > <project_name>-1.4.0.tar.gz`


View Commits Between Tags
-------------------------
* Commits between two tags: `git log --pretty=format:%s Tag1..Tag2`
* Commits between tag and HEAD: `git log --pretty=format:%s Tag..HEAD`

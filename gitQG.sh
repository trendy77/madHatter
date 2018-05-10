#!/bin/bash
## GIT QUIK

TYPE=$1
REPONAME=$2
AUTHOR=$3

existinGit(){
    # For push an existing repository from the command line
    git remote add origin https://github.com/defnottrendy/$REPONAME.git
    git push -u origin master
}

newGit(){
    echo "forked/copied from $REPONAME -- $AUTHOR">> README.md
    git checkout master
    rm -rf .git
    git init
    git add .
    git commit -m "First Commit INIT - $REPONAME ... $AUTHOR"
    git remote add origin https://github.com/defnottrendy/$REPONAME
    git push -u origin master
}

if [[ -z "$1" ]]; then
    echo "Usage: $0 [n/e/nt <NEW>or<EXIST>or<take/EXIST> <REPO NAME> <AUTHOR>"
    exit
fi
# new or existing or new taking?

if [ "$1"="nt" ]; then
    cd /home
    git clone https://github.com/$AUTHOR/$REPONAME.git
    cd $REPONAME
    newGit
    elif [ "$1" = "n" ]; then
    newGit
    elif [ "$1" = "e" ]; then
    existinGit
fi

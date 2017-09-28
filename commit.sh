#!/bin/bash
cd /home/pdnsup/
TIMESTAMP=`date +%s`
git config --global core.excludesfile ~/.git/.gitignore
git add ~/pdns/.
git add ~/install.sh
git add ~/commit.sh
git config --global user.name "DoT"
git config --global user.email "antal@lovasi.eu"
git commit -m "$TIMESTAMP commit"
if [ `git remote -v|wc -l` -lt "1" ]
then
        git remote add origin https://github.com/dotnet79/pdnsup.git
fi
git push -u origin master

#!/bin/bash

# Add simple help
help()
{
  echo 'Run: ./mgit.sh -b <branch> -a <pull|push|none> -m <message>'
  exit
}

mgit()
{
  directories=$(ls -d */)
  currwordir=$(pwd)
  
  for dir in $directories
  do
    cd $dir
    git pull origin
    git commit -am"$1"
    git push origin
    cd ../
    echo $currwordir/$dir;
  done
}

# Loop through every one and set same message commit
if [ "$#" -ge 1 ]
then
  mgit
else
  help
fi

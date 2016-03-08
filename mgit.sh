#!/bin/bash

# Add simple help
help()
{
  echo 'Ex: ./mgit.sh -b <branch> -pull -push -m "<message> -path <path>"'
  echo ''
  echo '	-b <branch> (target repository branch) >>> default: master'
  echo '	-pull (Fetch from and integrate with your local branch before commit) '
  echo '	-push (Update remote refs along with associated objects after commit) '
  echo '	-m "<your message>" (Define a commit message) '
  echo '	-path <relative_path> (Enter absolute paths or relative paths) >>> default: .'
  exit
}

mgit()
{
  directories=$(ls -d */)
  currwordir=$(pwd)
  pull=false
  push=false 
  branch="master"
  path="."

paste=vpaste	# default is vertical pasting
seplist="\t"	# default separator is tab

  set -- $(getopt -b $0 d:s "$@")
  for o
  do	case "$o" in
	-b)	shift; echo $1; shift;;
	-path)	echo $1; shift;;
	esac
  done

  exit 1;
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

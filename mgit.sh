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
  message=$(git status -s)

  # Get options
  local OPTIND
  while getopts :b:p:m: FLAG; do
    case $FLAG in
      b)  #set branch
        branch=$OPTARG
        ;;
      p)  #set option "pull, push or path"
        if [ $OPTARG == "ull" ]
	then
		pull=$OPTARG
        elif [ $OPTARG == "ush" ]
        then
                push=$OPTARG
	elif [ $OPTARG == "ath" ]
        then
                path=$OPTARG
	fi
	;;
      m) # set message
	if [ ! -z $OPTARGS]
	then
		message=$OPTARGS
		echo $message
	fi
	;;
    esac
  done

  for dir in $directories
  do
    cd $dir
    if [ ! -z "$pull"  ] || [ ! -z "$push" ] ; then
        git pull origin "$branch"
    fi
    git commit -am"$message"
    if [ ! -z "$push" ] ; then
        git push origin "$branch"
    fi
    cd ../
  done
}

# Loop through every one and set same message commit
if [ "$#" -ge 1 ]
then
  mgit "$@"
else
  help
fi

# gitmc - Git Multiple Commits
Git Multiple Commits - This small bash shell script commits/pull/push the same message to projects with same structure/code.

## You have 3 projects with the same code A, B and C
Maybe diferents databases/configs/dependencies but same structure (theme/css/js/php/etc)

## You made exactly the same changes to A, B, and C
It's time to commit every project with the same message, pull, push and let's give a try you use gitmc.sh ...

## Usage
git clone https://github.com/7rin0/gitmc.git or simply get the script and place in a folder up one level to your projects. Lets say:
![alt tag](https://github.com/7rin0/gitmc/raw/master/unpacked/examples/project_a/three.png)

## Commit, Pull and push in a row
./gitmc.sh -b <branch> -m "message" -pull -push -path <path>

### By default
./gitmc.sh = ./gitmc.sh -b master -m "$(git status -s)" -pull -push -path .

### Options
Ex: ./mgit.sh -b <branch> -pull -push -m "<message> -path <path>"
	-b <branch> (target repository branch) >>> default: master
	-pull (Fetch from and integrate with your local branch before commit) 
	-push (Update remote refs along with associated objects after commit) 
	-m "<your message>" (Define a commit message) 
	-path <relative_path> (Enter absolute paths or relative paths) >>> default: .

## Voilà
More instructions and options comming soon

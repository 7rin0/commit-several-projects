# gitmc - Git Multiple Commits
Git Multiple Commits - This small bash shell script commits/pull/push the same message to projects with same structure/code.

### Usage
You have 3 projects with the same structure and yout want commit the same message in each one, pull, push in one comand.

#### Get gitmc.sh
Put gitmc.sh in a folder up one level to your projects
- git clone https://github.com/7rin0/gitmc.git
- or simply get the script and place

#### Lets say we have project_a project_b and project_c
![alt tag](https://raw.githubusercontent.com/7rin0/gitmc/master/examples/project_a/three.png)

#### Commit, Pull and push in a row
./gitmc.sh -b <branch> -m "message" -pull -push -path <path>

##### By default
./gitmc.sh = ./gitmc.sh -b master -m "$(git status -s)" -pull -push -path .

##### Options
Ex: ./mgit.sh -b <branch> -pull -push -m "<message> -path <path>"

-b <branch> (target repository branch) >>> default: master

-pull (Fetch from and integrate with your local branch before commit) 

-push (Update remote refs along with associated objects after commit) 

-m "<your message>" (Define a commit message) 

-path <relative_path> (Enter absolute paths or relative paths) >>> default: .


### Voilà
More instructions and options comming soon

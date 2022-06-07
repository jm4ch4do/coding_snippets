''' --------------------------------- GIT BASICS -------------------------------- '''
# version and help
git --version
git help config  # open help page for config
git config --help  # same


''' ------------------------------ GLOBAL VARIABLES ----------------------------- '''
git config --global http.proxy http://<username>:<password>@<proxy-server-url>:<port>
git config --global user.name joseraul
git config --global user.email m4ch4do@protonmail.com
git config --list  # show global variables


''' ---------------------------- CREATE/ERASE REPOSITORY ------------------------- '''
# CREATE
git init  # initialize repository within a folder
git status
git diff  # shows diffirences between current files and the once added to repo

# ERASE
git clean -f  # erase untracked
git clean -f -d  # also directories
git clean -f -X  # erase ignored files
git clean -f -x  # erase ignored and not ignored
''' --------------------------------- MAKE CHANGES ------------------------------ '''
# ADD FILE
nano info.txt
git add info.txt  # add a file to repo
git diff  # if you want to see what's new
git commit -m "comitting a text file"  # save changes to current branchs

# ALL
git add -A  # add all untracked files
git reset  # remove files from the staging area (back to working directory)

# logs
git log  # shows all changes to 


''' ----------------------------------- SYNC REPO ------------------------------- '''


''' ------------------------------ PARAREL DEVELOPMENT -------------------------- '''


''' --------------------------------- IGNORE FILES ------------------------------ '''
touch .gitignore


''' ------------------------------- LINK TO GITHUB ------------------------------ '''
git config --global user.username jm4ch4do
git remote add origin https://github.com/jm4ch4do/test.git  # link to 

git pull origin master  # is best to always update last changes made before uploading
git push origin master  # upload(push) to origin(remote_repo) to branch master

# see remote url
git remote get-url origin

# change remote url
git remote set-url origin https://github.com/jm4ch4do/snippets_front_end.git

git push -u origin calc-divide  # associates local calc-divide branch with remote 
                                #  calc-divide branch, so in the future
git push
git pull  # already knows it means the remote calc-divide branch

git clone https://github.com/jm4ch4do/test.git . # download(clone) from master to origin

git remote -v  # shows origin of repository


''' ------------------------------------ BRANCH --------------------------------- '''
git branch first_branch  # create branch
git checkout first_branch  # enter branch

# MERGE
git checkout master  # switching to master branch
git merge first_branch  # merge first_branch into master branch

git branch  # shows all branches (local)
git branch -a  # shows all branches (local and in repository)



''' ------------------------------------ LINUX ---------------------------------- '''
ls
cd /D  # change to disk D
pwd
mkdir

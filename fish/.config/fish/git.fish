# git aliases
function ga --description "Git Add"
    git add $argv
end
function gb --description "Git Branch"
    git branch $argv
end
function gpl --description "Git Pull"
    git pull $argv
end
function gp --description "Git Push"
    git push $argv
end
function gd --description "Git Diff"
    git diff $argv
end
function gdc --description "Git Diff Cached"
    git diff --cached $argv
end
function gs --description "Git Status"
    git status
end
function gchk --description "Git Checkout"
    git checkout $argv
end
function gc --description "Git Commit"
    git commit $argv
end
function gss --description "Git Stash and Save"
    git stash saves
end
function gsh --description "Git Stash"
    git stash
end
function gsp --description "Git Pop"
    git stash pop
end
function gmv --description "Git Moved"
    git mv $argv
end
function grm --description "Git Remove"
    git rm $argv
end
function grn --description "Git REname"
    git-rename
end
function glog --description "Git Log"
    git l
end
function yntest --description "Runs Yarn Test"
    yarn test
end
function ynlint --description "Runs Yarn Lint"
    yarn lint
end
function npmi --description "Removes and Reinstalls Node Modules"
    rm -rf node_modules && npm i
end
function npublish --description "Runs NPM Publish"
    npm run publish
end

# alias git-amend='git commit --amend -C HEAD'
function git-undo --description "Undo the last commit"
    git reset --soft HEAD~1
end
function git-count --description "Count the thing"
    git shortlog -sn
end
function undopush --description "Oops. Let's Undo That Last Push Playa"
    git push -f origin HEAD^:master
end
function cpbr --description "Copies the thing"
    git rev-parse --abbrev-ref HEAD | pbcopy
end
# git root
function gr --description "Git Root"
    [ ! -z `git rev-parse --show-cdup` ] && cd `git rev-parse --show-cdup || pwd`
end

function sub-pull --description "Pulls Submodules"
    git submodule foreach git pull origin master
end

function give-credit --description "Give Author Creds"
    git commit --amend --author $1 <$2 >-C HEAD
end

# a simple git rename file function
# git does not track case-sensitive changes to a filename.
function git-rename --description "Changes File Name"
    git mv $1 "$2-"
    git mv "$2-" $2
end

function g
    if [[ $argv> 0 ]]
        then
        # if there are arguments, send them to git
        git $argv
    else
        # otherwise, run git status
        git s
        fi
    end
end

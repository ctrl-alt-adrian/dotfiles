# Git aliases for Bash on Arch Linux
alias ga='git add'
alias gb='git branch'
alias gpl='git pull'
alias gp='git push'
alias gd='git diff'
alias gdc='git diff --cached'
alias gs='git status'
alias gchk='git checkout'
alias gc='git commit'
alias gss='git stash save'
alias gsh='git stash'
alias gsp='git stash pop'
alias gmv='git mv'
alias grm='git rm'
alias grn='git-rename'
alias glog='git log --oneline --graph --all'
alias git-undo='git reset --soft HEAD~1'
alias git-count='git shortlog -sn'
alias git-undopush='git push -f origin HEAD^:master'
alias cpbr='git rev-parse --abbrev-ref HEAD | xclip -selection clipboard'
alias gr='[ ! -z "$(git rev-parse --show-cdup)" ] && cd "$(git rev-parse --show-cdup)" || pwd'

alias sub-pull='git submodule foreach git pull origin master'

# Amend commit author
give-credit() {
    git commit --amend --author "$1 <$2>" -C HEAD
}

# Rename file with Git (handles case-sensitive renames)
git-rename() {
    git mv "$1" "${2}-"
    git mv "${2}-" "$2"
}

# Git wrapper function
g() {
    if [ $# -gt 0 ]; then
        # If arguments are provided, pass them to git
        git "$@"
    else
        # Otherwise, run git status
        git status
    fi
}

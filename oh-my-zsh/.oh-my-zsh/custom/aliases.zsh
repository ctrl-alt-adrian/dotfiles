# Shortcuts!

# reload zsh config
alias reload!='source ~/.zshrc'
alias r!='source ~/.zshrc'
# nvim = vim
alias vim='nvim'
alias v='nvim'
# nvim init file
alias nconfig='~/.config/nvim/'
# tmux
alias tmx='tmux'
#  use eza instead of ls
alias ls="eza --color=always --git  --icons=always --no-time"
# zoxide in place of cd
alias cd="z"
# go home!
alias home='~/'
# dotfile shortcut
alias dot='~/Developer/dotfiles'
# desktop shortcut
alias desktop='~/Desktop'
# downloads shortcut
alias downloads='~/Downloads'
# pictures
alias pictures='~/Pictures'
# git shortcut
alias gitclones='~/Developer/gitclones'
alias gcln='~/Developer/gitclones'
# developer
alias dev='~/Developer'
# .oh-my-zsh custom folder
alias myzsh='~/.oh-my-zsh/custom'
# symlink
alias symlink="ln -s"
# dot zsh
alias dotzsh="~/Developer/dotfiles/zsh"

##### projects
# projects
alias projects="~/Developer/Projects"
# go projects
alias goproj="~/Developer/Projects/golang/"
# vue projects
alias vueproj="~/Developer/Projects/vue/"
# react projects
alias reactproj="~/Developer/Projects/react/"
# suyu
alias suyu='~/Developer/Projects/suyu-app/'
# build suyu
alias suyubuild='cmake .. -GNinja -DSUYU_USE_BUNDLED_VCPKG=ON -DSUYU_TESTS=OFF && ninja && sudo ninja install'
alias suyudebug='cmake .. -GNinja -DCMAKE_BUILD_TYPE=RelWithDebInfo -DSUYU_USE_BUNDLED_VCPKG=ON -DSUYU_TESTS=OFF && ninja'

# uninstall a program
alias uninstall="sudo apt remove --auto-remove"
# purge a program
alias purge="sudo apt purge"
# ip addressing help
alias check='nslookup'

# yarn
alias ys='yarn serve'
alias uys='nvm use && yarn serve'
alias yt='yarn test'
alias yl='yarn lint'

# below credit to nick isi @github.com/nicknisi
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Trim new lines and copy to clipboard
alias trimcopy="tr -d '\n' | pbcopy"

# Recursively delete `.DS_Store` files
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"

# File size
alias fs="stat -f \"%z bytes\""

# Empty the trash on all mounted volumes and the main HDD
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; rm -rfv ~/.Trash"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
#kll all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# tar
alias xtar="tar -xvf"
alias xtargz="tar -xzvf"

# debug chrome
alias chromedebug="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222"

# pnpm
alias pn="pnpm"
# ddgr
alias search="ddgr"

#fun stuff
alias weather="wttr"
function wttr() {
  curl http://wttr.in/$1
}

alias cht="cht"
function cht() {
  curl cheat.sh/$1
}

# gnu stow
alias stowdir="stow -t ~ */"
alias stowunlink="stow -D"

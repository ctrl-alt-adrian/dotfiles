# reload zsh config
alias reload!='source ~/.zshrc'

# nvim = vim
alias vim='nvim'

# Shortcuts!

if [[ "$OSTYPE" == "linux-gnu" ]]; then
	# go home!
	alias home='/mnt/c/Users/adrian'
	# dotfile shortcut
	alias dotfiles='/mnt/c/Users/adrian/git-clones/dotfiles'
	# desktop shortcut
	alias desktop='/mnt/c/Users/adrian/Desktop'
	# downloads shortcut
	alias downloads='/mnt/c/Users/adrian/Downloads'
	# pictures
	alias pictures='/mnt/c/Users/adrian/Pictures'
	# git shortcut
	alias gitclones='/mnt/c/Users/adrian/git-clones'
	# projects
	alias projects='/mnt/c/Users/adrian/projects'
	# open cmd
	alias open="explorer.exe"
	# copy cmd
	alias pbcopy="clip.exe <"
	# majestic
	alias majestic='npx majestic'
elif [[ "$OSTYPE" == "darwin"* ]]; then
	# go home!
	alias home='~/'
	# dotfile shortcut
	alias dotfiles='~/git-clones/dotfiles'
	# desktop shortcut
	alias desktop='~/Desktop'
	# downloads shortcut
	alias downloads='~/Downloads'
	# pictures
	alias pictures='~/Pictures'
	# git shortcut
	alias gitclones='~/git-clones'
	# projects
	alias projects='~/projects'
	# majestic
	alias majestic='npx majestic'
fi
# .oh-my-zsh custom folder
alias myzsh='~/.oh-my-zsh/custom'
# symlink
alias symlink="ln -s"

# ip addressing help
#alias check='nslookup

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


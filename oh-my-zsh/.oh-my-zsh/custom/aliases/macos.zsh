# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# macOS-Specific ZSH Aliases
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Navigation
alias desktop='cd ~/Desktop'                 # Desktop
alias downloads='cd ~/Downloads'             # Downloads

# System Utilities
alias localip='ipconfig getifaddr en0'       # Local IP
alias flush='dscacheutil -flushcache'        # Flush DNS cache
alias ips="ifconfig -a | grep -oE '\d+\.\d+\.\d+\.\d+'" # List all IPs
alias sniff="sudo ngrep -d 'en0' -t '^(GET|POST) ' 'tcp and port 80'" # HTTP traffic
alias httpdump="sudo tcpdump -i en0 -n -s 0 -w - | grep -a -o -E 'Host: .*|GET /.*'" # HTTP dump

# File Management
alias fs='stat -f "%z bytes"'                # File size
alias emptytrash='sudo rm -rfv /Volumes/*/.Trashes; rm -rfv ~/.Trash' # Empty trash
alias hidedesktop='defaults write com.apple.finder CreateDesktop -bool false && killall Finder' # Hide desktop icons
alias showdesktop='defaults write com.apple.finder CreateDesktop -bool true && killall Finder' # Show desktop icons

# Browser Debugging
alias chromedebug='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222'

# Clipboard
alias trimcopy='tr -d "\n" | pbcopy'         # Trim newlines and copy to clipboard

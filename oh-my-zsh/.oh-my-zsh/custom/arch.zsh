# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Arch Linux-Specific ZSH Aliases
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Navigation
alias desktop='cd ~/Desktop'                 # Desktop
alias downloads='cd ~/Downloads'             # Downloads

# System Utilities
alias localip="ip route get 1 | awk '{print \$7}' | head -1" # Local IP
alias flush='sudo systemd-resolve --flush-caches'            # Flush DNS cache
alias ips="ip addr | grep -oE '\d+\.\d+\.\d+\.\d+' | grep -v '127.0.0.1'" # List all IPs
alias sniff="sudo ngrep -d 'any' -t '^(GET|POST) ' 'tcp and port 80'" # HTTP traffic
alias httpdump="sudo tcpdump -i any -n -s 0 -w - | grep -a -o -E 'Host: .*|GET /.*'" # HTTP dump

# File Management
alias fs='stat -c "%s bytes"'                # File size
alias emptytrash='trash-empty'               # Empty trash (requires trash-cli)

# Package Management
alias uninstall='sudo pacman -Rns'           # Uninstall package
alias purge='sudo pacman -Rns'               # Purge package (same as uninstall)

# Browser Debugging
alias chromedebug='google-chrome --remote-debugging-port=9222'

# Clipboard
alias trimcopy='tr -d "\n" | xclip -selection clipboard' # Trim newlines and copy (requires xclip)

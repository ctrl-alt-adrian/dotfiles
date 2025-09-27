# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Ubuntu WSL-Specific ZSH Aliases
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Navigation
alias desktop='cd /mnt/c/Users/$USER/Desktop'    # Windows Desktop
alias downloads='cd /mnt/c/Users/$USER/Downloads' # Windows Downloads

# System Utilities
alias localip="ip route get 1 | awk '{print \$7}' | head -1" # Local IP
alias flush='sudo systemd-resolve --flush-caches'            # Flush DNS cache
alias ips="ip addr | grep -oE '\d+\.\d+\.\d+\.\d+' | grep -v '127.0.0.1'" # List all IPs
alias sniff="sudo ngrep -d 'any' -t '^(GET|POST) ' 'tcp and port 80'" # HTTP traffic
alias httpdump="sudo tcpdump -i any -n -s 0 -w - | grep -a -o -E 'Host: .*|GET /.*'" # HTTP dump

# File Management
alias fs='stat -c "%s bytes"'                     # File size
alias emptytrash='rm -rfv /mnt/c/Users/$USER/.Trash/*' # Empty Windows trash

# Package Management
alias uninstall='sudo apt remove --auto-remove'    # Uninstall package
alias purge='sudo apt purge'                       # Purge package

# Browser Debugging
alias chromedebug='/mnt/c/Program\ Files/Google/Chrome/Application/chrome.exe --remote-debugging-port=9222'

# Clipboard
alias trimcopy='tr -d "\n" | xclip -selection clipboard' # Trim newlines and copy (requires xclip)

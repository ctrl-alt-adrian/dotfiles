# Tool Replacements for Arch Linux
alias ls='eza --color=always --git --icons=always --no-time'
alias cd='z'  # Assumes zoxide is installed
alias tmx='tmux'

# File Operations
alias symlink='ln -s'
alias xtar='tar -xvf'
alias xtargz='tar -xzvf'

# Network Utilities
alias ip='dig +short myip.opendns.com @resolver1.opendns.com'
alias check='nslookup'

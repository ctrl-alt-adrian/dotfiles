# Tmux aliases for Bash on Arch Linux

# Tmux session management
alias tm='tmux new -s'
alias tlist='tmux ls'
alias ta='tmux attach-session'
alias killserve='tmux kill-server'
alias killsesh='tmux kill-session -a'

# Tmux Plugin Manager (TPM)
alias tpminstall='~/.tmux/plugins/tpm/bin/install_plugins'
alias tpmremoveall='~/.tmux/plugins/tpm/bin/update_plugins all'
alias tpmremove='~/.tmux/plugins/tpm/bin/update_plugins tmux-sensible'
alias tpmclean='~/.tmux/plugins/tpm/bin/clean_plugins'

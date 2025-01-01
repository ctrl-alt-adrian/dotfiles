function tm --description "Tmux New Session"
    tmux new -s
end
function tlist --description "Tmux Session List"
    tmux ls
end
function ta --description "Tmux Attach Session"
    tmux attach-session
end
function tkillserve --description "Kill Tmux Server"
    tmux kill-server
end
function tkillssesh --description "Kill Tmux Session"
    tmux kill-session -a
end
#tpm
function tpminstall --description "Install a TPM Plugin"
    ~/.tmux/plugins/tpm/bin/install_plugins
end
function tpmremoveall --description "Removes all Tmux Plugins"
    ~/.tmux/plugins/tpm/bin/update_plugins all
end
function tpmremove --description "Yeet Tmux Sensible Plug"
    ~/.tmux/plugins/tpm/bin/update_plugins tmux-sensible
end
function tpmclean --description "Clean Tmux Plugins"
    ~/.tmux/plugins/tpm/bin/clean_plugins
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    # set some paths and configs
    set -U fish_user_paths $fish_user_path $HOME/.local/bin/
    # tells fish where to find homebrew
    set -U fish_user_paths /home/linuxbrew/.linuxbrew/bin $fish_user_paths
    set fish_greeting
    set TERM xterm-256color
    # aliases
    source ~/.config/fish/aliases.fish
    source ~/.config/fish/git.fish
    source ~/.config/fish/tmux.fish
    # soon
    # source ~/.config/fish/supersecretcommands.fish
    # zoxide
    zoxide init fish | source
    # ~/.config/fish/config.fish

    starship init fish | source

    # go path setup
    export GOPATH="$HOME/workspace/go"
    export PATH="$GOPATH/bin:$PATH"
    # aws
    export AWS_SDK_LOAD_CONFIG=true

    fish_add_path "/home/linuxbrew/.linuxbrew/opt/qt@5/bin:$PATH"
    # Fish syntax highlighting
    set -g fish_color_autosuggestion 555 brblack
    set -g fish_color_cancel -r
    set -g fish_color_command --bold
    set -g fish_color_comment red
    set -g fish_color_cwd green
    set -g fish_color_cwd_root red
    set -g fish_color_end brmagenta
    set -g fish_color_error brred
    set -g fish_color_escape bryellow --bold
    set -g fish_color_history_current --bold
    set -g fish_color_host normal
    set -g fish_color_match --background=brblue
    set -g fish_color_normal normal
    set -g fish_color_operator bryellow
    set -g fish_color_param cyan
    set -g fish_color_quote yellow
    set -g fish_color_redirection brblue
    set -g fish_color_search_match bryellow '--background=brblack'
    set -g fish_color_selection white --bold '--background=brblack'
    set -g fish_color_user brgreen
    set -g fish_color_valid_path --underline
    fzf --fish | source
end
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
mise activate fish | source

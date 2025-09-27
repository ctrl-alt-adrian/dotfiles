# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Shared ZSH Aliases (macOS, Ubuntu WSL, Arch Linux)
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Reload ZSH configuration
alias reload='source ~/.zshrc'

# Navigation Shortcuts
alias home='cd ~'
alias dot='cd ~/Developer/dotfiles'          # Dotfiles
alias pictures='cd ~/Pictures'               # Pictures
alias dev='cd ~/Developer'                   # Developer directory
alias gitclones='cd ~/Developer/gitclones'   # Git clones
alias gcln='cd ~/Developer/gitclones'        # Alias for gitclones
alias projects='cd ~/Developer/Projects'      # Projects directory
alias goproj='cd ~/Developer/Projects/golang' # Go projects
alias vueproj='cd ~/Developer/Projects/vue'   # Vue projects
alias reactproj='cd ~/Developer/Projects/react' # React projects
alias suyu='cd ~/Developer/Projects/suyu-app' # Suyu project

# Editor and Configuration
alias vim='nvim'                             # Use Neovim as vim
alias v='nvim'                               # Short alias for Neovim
alias nconfig='cd ~/.config/nvim'            # Neovim config directory
alias myzsh='cd ~/.oh-my-zsh/custom'         # ZSH custom directory
alias dotzsh='cd ~/Developer/dotfiles/zsh'   # Dotfiles ZSH config

# Tool Replacements
alias ls='eza --color=always --git --icons=always --no-time' # Use eza instead of ls
alias cd='z'                                         # Use zoxide instead of cd
alias tmx='tmux'                                     # Tmux shortcut

# Project-Specific Commands
alias suyubuild='cmake .. -GNinja -DSUYU_USE_BUNDLED_VCPKG=ON -DSUYU_TESTS=OFF && ninja && sudo ninja install'
alias suyudebug='cmake .. -GNinja -DCMAKE_BUILD_TYPE=RelWithDebInfo -DSUYU_USE_BUNDLED_VCPKG=ON -DSUYU_TESTS=OFF && ninja'
alias ys='yarn serve'                                # Yarn serve
alias uys='nvm use && yarn serve'                    # Use NVM and yarn serve
alias yt='yarn test'                                 # Yarn test
alias yl='yarn lint'                                 # Yarn lint
alias pn='pnpm'                                      # PNPM shortcut
alias stowdir='stow -t ~ */'                         # GNU Stow for dotfiles
alias stowunlink='stow -D'                           # Unlink dotfiles

# File Operations (OS-agnostic)
alias symlink='ln -s'                                # Create symbolic links
alias xtar='tar -xvf'                                # Extract tar
alias xtargz='tar -xzvf'                             # Extract tar.gz
alias cleanup='find . -name "*.DS_Store" -type f -ls -delete' # Remove .DS_Store files

# Network Utilities (OS-agnostic)
alias ip='dig +short myip.opendns.com @resolver1.opendns.com' # Public IP
alias check='nslookup'                                # DNS lookup

# Fun and Productivity
alias weather='curl http://wttr.in'                  # Weather information
alias cht='curl cheat.sh'                            # Cheat sheet lookup
alias search='ddgr'                                  # DuckDuckGo search

# Kill Chrome helper processes
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

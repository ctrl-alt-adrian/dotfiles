function reload --description "Reloads the fish shell"
    source ~/.config/fish/config.fish
end

function v --description "Start Neovim"
    nvim $argv
end

####### directory shortcuts
### common shortcuts
function nconfig --description "Go to nvim dir"
    ~/.config/nvim/
end
function myfish --description "Go to fish dir"
    ~/.config/fish/
end
function home --description "Go home"
    ~/
end
function dot --description "Go to dotfiles"
    ~/Developer/dotfiles/
end
function dev --description "Go to dev dir"
    ~/Developer/
end

### projects
function projects --description "Go to projects dir"
    ~/Developer/Projects/
end
function goproj --description "Go to golang project dir"
    ~/Developer/Projects/golang/
end
function vueproj --description "Go to vue project dir"
    ~/Developer/Projects/vue/
end
function reactproj --description "Go to react project dir"
    ~/Developer/Projects/react/
end
function suyu --description "Go to suyu project dir"
    ~/Developer/Projects/
end
#### build commands
# build suyu
alias suyubuild='cmake .. -GNinja -DSUYU_USE_BUNDLED_VCPKG=ON -DSUYU_TESTS=OFF && ninja &&
       │  sudo ninja install'
alias suyudebug='cmake .. -GNinja -DCMAKE_BUILD_TYPE=RelWithDebInfo -DSUYU_USE_BUNDLED_VCP
       │ KG=ON -DSUYU_TESTS=OFF && ninja'
#### app shortcuts
function pn --description "Start Pnpm"
    pnpm $argv
end
function search --description "Use ddgr to search"
    ddgr $argv
end
function weather --description "Get weather report"
    curl "http://wttr.in/$argv"
end
function cht --description "Pull up a Cheatsheat on a thing"
    curl "cheat.sh/$argv"
end

# gnu stow
function stowdir --description "Stows specified directory"
    stow -t ~ */$argv
end
function stowunlink --description "Removes symlink using gnu stow for a given directory"
    stow -D $argv
end

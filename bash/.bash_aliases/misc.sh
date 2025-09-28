# Miscellaneous for Arch Linux
alias reload='source ~/.bashrc'
alias o='gio open .'
# Fun and Productivity
alias weather='curl http://wttr.in'
alias cht='curl cheat.sh'
alias search='ddgr'

# Kill Chrome helper processes
alias chromekill="ps aux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | awk '{print $2}' | xargs kill"

# Wallpapers

alias wset="$HOME/.config/hypr/set-wallpapers.sh"
alias wstat="wset --status"

# Random wallpapers
alias wrand='wset --rand'                       # both monitors, default ~/Pictures/wallpapers
alias wrandc="wset --rand ~/Pictures/walls"     # both monitors, default ~/Pictures/walls

alias wrand1='wset --dp1 --rand'                # DP-1 only, default ~/Pictures/wallpapers
alias wrand2='wset --dp2 --rand'                # DP-2 only, default ~/Pictures/wallpapers

alias wrand1c="wset --dp1 --rand ~/Pictures/walls" # DP-1 only, default ~/Pictures/walls
alias wrand2c="wset --dp2 --rand ~/Pictures/walls" # DP-2 only, default ~/Pictures/walls

# Help for wallpaper commands
alias whelp='echo "
Wallpaper Aliases:
  wset      - main script (set-wallpapers.sh)
  wstat     - check wallpaper status
  wrand     - random both monitors (default: ~/Pictures/wallpapers)
  wrandc    - random both monitors (default: ~/Pictures/walls)
  wrand1    - random DP-1 only (default: ~/Pictures/wallpapers)
  wrand2    - random DP-2 only (default: ~/Pictures/wallpapers)
  wrand1c   - random DP-1 only (default: ~/Pictures/walls)
  wrand2c   - random DP-2 only (default: ~/Pictures/walls)

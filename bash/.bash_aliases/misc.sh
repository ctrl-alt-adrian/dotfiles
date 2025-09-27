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
export PATH="$HOME/.local/bin:$PATH"
alias wrandc='wset --rand ~/Pictures/walls'     # custom folder
alias wrand='wset --rand'                       # default folder
alias w2randc='wset --dp2 --rand ~/Pictures/walls' # monitor DP-2, custom folder
alias w2rand='wset --dp2 --rand'                  # monitor DP-2, default folder
alias w1randc='wset --dp1 --rand ~/Pictures/walls' # monitor DP-1, custom folder
alias w1rand='wset --dp1 --rand'                  # monitor DP-1, default folder


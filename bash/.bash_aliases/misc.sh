# Miscellaneous for Arch Linux
alias reload='source ~/.bashrc'
alias o='gio open .'
# Fun and Productivity
alias weather='curl http://wttr.in'
alias cht='curl cheat.sh'
alias search='ddgr'

# Kill Chrome helper processes
alias chromekill="ps aux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | awk '{print $2}' | xargs kill"

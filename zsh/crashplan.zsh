# stop crashplan service
alias stopcrash="sudo launchctl unload /Library/LaunchDaemons/com.crashplan.engine.plist"
# start crashplan service
alias startcrash="sudo launchctl load /Library/LaunchDaemons/com.crashplan.engine.plist"
# check if crashplan service is running
alias checkcrash="ps auxww | grep -i CrashPlanService"

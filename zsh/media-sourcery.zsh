# shortcuts
if [[ "$OSTYPE" == "linux-gnu" ]]; then
	alias mediasourcery='/mnt/c/Users/adrian/work/media-sourcery'
	alias docverify='/mnt/c/Users/adrian/work/media-sourcery/document-verification'
	alias packapproval='/mnt/c/Users/adrian/work/media-sourcery/packet-approval'
elif [["$OSTYPE" == "darwin"* ]]; then
	alias mediasourcery='~/work/media-sourcery'
	alias docverify='~/work/media-sourcery/document-verification'
	alias packapproval='~/work/media-sourcery/packet-approval'
fi

# building
alias msdevr='npm run build:devr'
alias msprod='npm run build:prod'

# testing
alias mstest='npm run test'
alias mse2e='npm run e2e'

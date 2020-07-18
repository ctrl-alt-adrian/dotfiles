# shortcuts
if [[ "$OSTYPE" == "linux-gnu" ]]; then
	alias mediasourcery='/mnt/c/Users/adrian/work/media-sourcery'
	alias docverify='/mnt/c/Users/adrian/work/media-sourcery/document-verification'
	alias packapproval='/mnt/c/Users/adrian/work/media-sourcery/packet-approval'
	alias verification='/mnt/c/Users/adrian/work/media-sourcery/verification-criteria'
	alias insurancerepo='/mnt/c/Users/adrian/work/media-sourcery/insurance-repo'
	alias ccs='/mnt/c/Users/adrian/work/media-sourcery/ccs'
	alias pwotemplates='/mnt/c/Users/adrian/work/media-sourcery/ccs/pims/src/main/resources/pwo/templates'
	alias pwoimages='/mnt/c/Users/adrian/work/media-sourcery/ccs/pims/src/main/resources/pwo/images'
	alias pwoconfiguration='/mnt/c/Users/adrian/work/media-sourcery/ccs/pims/src/main/scala/com/mediasourcery/ccs/pims/pwo'
elif [["$OSTYPE" == "darwin"* ]]; then
	alias mediasourcery='~/work/media-sourcery'
	alias docverify='~/work/media-sourcery/document-verification'
	alias packapproval='~/work/media-sourcery/packet-approval'
	alias verification='~/work/media-sourcery/verification-criteria'
	alias insurancerepo='~/work/media-sourcery/insurance-repo'
	alias ccs='~/work/media-sourcery/ccs'
	alias pwotemplates='~/work/media-sourcery/ccs/pims/src/main/resources/pwo/templates'
	alias pwoimages='~/work/media-sourcery/ccs/pims/src/main/resources/pwo/images'
	alias pwoconfiguration='~/work/media-sourcery/ccs/pims/src/main/scala/com/mediasourcery/ccs/pims/pwo'
fi

# building
alias msdevr='npm run build:devr'
alias msprod='npm run build:prod'

# testing
alias mstest='npm run test'
alias mse2e='npm run e2e'

# app run
alias runpwofaxes='sbt "project pwofaxes" "runMain com.mediasourcery.ccs.pwofaxes.Main"'

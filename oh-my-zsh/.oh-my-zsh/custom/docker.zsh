# configure docker commands based on OS 

if [[ "$OSTYPE" == "linux-gnu" ]]; then
	# docker
	alias docker='docker.exe'
	# docker compose
	alias docker-compose='docker-compose.exe'
fi

#docker compose commands
alias dcdown='docker-compose down -v'
alias dcup='docker-compose up -d'
# golang test
alias gotest='go test -p 1 ./... | grep FAIL'

# configure docker commands based on OS 

if [[ "$OSTYPE" == "linux-gnu" ]]; then
	# docker
	alias docker='docker.exe'
	# docker compose
	alias docker-compose='docker-compose.exe'
fi

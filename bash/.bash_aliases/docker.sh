# Docker aliases for Bash on Arch Linux

# Containers
alias dps='docker ps'
alias dpsa='docker ps -a'
alias dstop='docker stop'
alias ds='docker start'
alias drm='docker rm'
alias drmf='docker rm -f'
alias dpl="docker pull"
alias dr="docker run"

# Images
alias dimg='docker images'
alias drmi='docker rmi'
alias dbuild='docker build .'
alias dprune='docker system prune -af'

# Logs & Exec
alias dlog='docker logs'
alias dlogf='docker logs -f'
alias dexec='docker exec -it'

# Docker Compose
alias dcup='docker compose up -d'
alias dcdown='docker compose down -v'
alias dcb='docker compose build'
alias dcl='docker compose logs'
alias dclf='docker compose logs -f'
alias dce='docker compose exec'
alias dcr='docker compose run'

# Combined Helpers
alias dkillall='docker stop $(docker ps -q) && docker rm $(docker ps -aq)'
alias drmall='docker rmi -f $(docker images -q)'
alias dclean='docker system prune -a --volumes -f'

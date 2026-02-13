# -----------------------------
# 🐳 OS-specific Docker Wrappers
# -----------------------------
# WSL Docker
# if [[ "$OSTYPE" == "linux-gnu" ]]; then
#   alias docker='docker.exe'
#   alias docker-compose='docker-compose.exe'
# fi

# -----------------------------
# 🐳 Docker Aliases
# -----------------------------

# Containers
alias dps="docker ps"
alias dpsa="docker ps -a"
alias dstop="docker stop"
alias dstart="docker start"
alias drm="docker rm"
alias drmf="docker rm -f"

# Images
alias dimg="docker images"
alias drmi="docker rmi"
alias dbuild="docker build ."
alias dprune="docker system prune -af"

# Logs & Exec
alias dlog="docker logs"
alias dlogf="docker logs -f"
alias dexec="docker exec -it"

# -----------------------------
# 🐳 Docker Compose Aliases
# -----------------------------

alias dcup="docker-compose up -d"
alias dcdown="docker-compose down -v"
alias dcb="docker-compose build"
alias dcl="docker-compose logs"
alias dclf="docker-compose logs -f"
alias dce="docker-compose exec"
alias dcr="docker-compose run"

# -----------------------------
# ⚡ Combined Helpers
# -----------------------------

# Stop & remove all containers
alias dkillall="docker stop \$(docker ps -q) && docker rm \$(docker ps -aq)"

# Remove all images
alias drmall="docker rmi -f \$(docker images -q)"

# Cleanup system (containers, images, volumes, networks)
alias dclean="docker system prune -a --volumes -f"

# -----------------------------
# 🐹 Golang (kept from original)
# -----------------------------
# alias gotest='go test -p 1 ./... | grep FAIL'


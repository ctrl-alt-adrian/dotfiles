# General utility functions for Bash on Arch Linux

# Create a directory and cd into it
take() {
    if [ -z "$1" ]; then
        echo "Usage: take <directory>"
        return 1
    fi
    mkdir -p "$1" && command cd "$1"
}

# Create a file (and its parent directories) and open it in the editor
mk() {
    if [ -z "$1" ]; then
        echo "Usage: mk <file>"
        return 1
    fi
    mkdir -p "$(dirname "$1")" && touch "$1" && nvim "$1"
}

# Extract various archive formats
extract() {
    if [ -z "$1" ]; then
        echo "Usage: extract <archive>"
        return 1
    fi
    if [ ! -f "$1" ]; then
        echo "Error: '$1' is not a valid file"
        return 1
    fi
    case "$1" in
        *.tar.gz|*.tgz) tar -xzvf "$1" ;;
        *.tar.bz2|*.tbz2) tar -xjvf "$1" ;;
        *.tar.xz|*.txz) tar -xJvf "$1" ;;
        *.tar) tar -xvf "$1" ;;
        *.gz) gunzip "$1" ;;
        *.bz2) bunzip2 "$1" ;;
        *.xz) unxz "$1" ;;
        *.zip) unzip "$1" ;;
        *.rar) unrar x "$1" ;;
        *.7z) 7z x "$1" ;;
        *) echo "Error: unsupported archive format '$1'" ;;
    esac
}

# Find files or directories by name using fd
fd() {
    if [ -z "$1" ]; then
        echo "Usage: fd <pattern>"
        return 1
    fi
    command fd --hidden --exclude .git "$1"
}

# Display PATH entries, one per line
path() {
    echo "$PATH" | tr ':' '\n'
}

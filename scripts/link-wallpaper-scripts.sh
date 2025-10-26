#!/usr/bin/env bash
#
# link-wallpaper-scripts.sh
#
# Purpose:
#   Symlink wallpaper management scripts from your dotfiles repo into the proper
#   runtime directories for Hyprland and shell usage.
#
#   - Links `wset` → ~/.local/bin/
#   - Links `wallswitch` → ~/.local/bin/
#
#   Ensures:
#     - Skips linking if destination directories don't exist.
#     - Removes broken symlinks before recreating them.
#     - Supports verbose output for clarity.
#
# Usage:
#   ./link-wallpaper-scripts.sh            # normal run
#   ./link-wallpaper-scripts.sh --verbose  # show full symlink paths
#   ./link-wallpaper-scripts.sh -h         # show help
#
# Notes:
#   - Your dotfiles are expected to live in: ~/Developer/dotfiles/scripts
#   - Requires your `symlinkit` helper script in PATH.
#

DOT_SCRIPTS="$HOME/Developer/dotfiles/scripts"
VERBOSE=false

show_help() {
  sed -n '2,30p' "$0" | sed 's/^# \{0,1\}//'
}

error_exit() {
  echo "❌ $1"
  exit "${2:-1}"
}

validate_dependencies() {
  command -v symlinkit >/dev/null 2>&1 || \
    error_exit "symlinkit not found. Make sure it's in your PATH."
}

validate_source_file() {
  local src="$1"
  [[ -f "$src" ]] || error_exit "Source file not found: $src"
}

validate_dest_dir() {
  local dest_dir="$1"
  [[ -d "$dest_dir" ]] || return 1
}

cleanup_broken_symlink() {
  local target="$1"
  if [[ -L "$target" && ! -e "$target" ]]; then
    echo "Removing broken symlink: $target"
    rm "$target"
  fi
}

create_symlink() {
  local src="$1"
  local dest_dir="$2"
  local target="$dest_dir/$(basename "$src")"

  symlinkit -o "$src" "$dest_dir"

  if $VERBOSE; then
    echo "Linked: $target → $src"
  else
    echo "Linked $(basename "$src") into $dest_dir"
  fi
}

link_script() {
  local src="$1"
  local dest_dir="$2"
  local target="$dest_dir/$(basename "$src")"

  if ! validate_dest_dir "$dest_dir"; then
    echo "Skipped: $dest_dir does not exist"
    return
  fi

  validate_source_file "$src"
  cleanup_broken_symlink "$target"
  create_symlink "$src" "$dest_dir"
}

# Parse flags
while [[ "$1" == -* ]]; do
  case "$1" in
    --verbose) VERBOSE=true ;;
    -h|--help) show_help; exit 0 ;;
    *) error_exit "Unknown flag: $1" ;;
  esac
  shift
done

validate_dependencies

# Try linking all scripts
link_script "$DOT_SCRIPTS/wset" "$HOME/.local/bin"
link_script "$DOT_SCRIPTS/wallswitch" "$HOME/.local/bin"

echo "Done!"


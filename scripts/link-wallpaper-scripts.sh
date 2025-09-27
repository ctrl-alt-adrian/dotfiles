#!/usr/bin/env bash
#
# link-wallpaper-scripts.sh
#
# 📌 Purpose:
#   Symlink wallpaper management scripts from your dotfiles repo into the proper
#   runtime directories for Hyprland and shell usage.
#
#   - Links `set-wallpapers.sh` → ~/.config/hypr/
#   - Links `wset` → ~/.local/bin/
#
#   Ensures:
#     • Skips linking if destination directories don’t exist.
#     • Removes broken symlinks before recreating them.
#     • Supports verbose output for clarity.
#
# 🔑 Usage:
#   ./link-wallpaper-scripts.sh            # normal run
#   ./link-wallpaper-scripts.sh --verbose  # show full symlink paths
#   ./link-wallpaper-scripts.sh -h         # show help
#
# 💡 Notes:
#   • Your dotfiles are expected to live in: ~/Developer/dotfiles/scripts
#   • Requires your `symlinkit` helper script in PATH.
#

DOT_SCRIPTS="$HOME/Developer/dotfiles/scripts"
VERBOSE=false

show_help() {
  sed -n '2,30p' "$0" | sed 's/^# \{0,1\}//'
}

# Parse flags
while [[ "$1" == -* ]]; do
  case "$1" in
    --verbose) VERBOSE=true ;;
    -h|--help) show_help; exit 0 ;;
    *) echo "❌ Unknown flag: $1"; exit 1 ;;
  esac
  shift
done

if ! command -v symlinkit >/dev/null 2>&1; then
  echo "❌ symlinkit not found. Make sure it's in your PATH."
  exit 1
fi

link_with_feedback() {
  local src="$1"
  local dest_dir="$2"
  local target="$dest_dir/$(basename "$src")"

  if [[ -d "$dest_dir" ]]; then
    # Remove broken symlinks
    if [[ -L "$target" && ! -e "$target" ]]; then
      echo "🗑️  Removing broken symlink: $target"
      rm "$target"
    fi

    if [[ -f "$src" ]]; then
      symlinkit -o "$src" "$dest_dir"
      if $VERBOSE; then
        echo "✅ Linked: $target → $src"
      else
        echo "✅ Linked $(basename "$src") into $dest_dir"
      fi
    else
      echo "❌ Source file not found: $src"
    fi
  else
    echo "⚠️  Skipped: $dest_dir does not exist"
  fi
}

# Try linking both scripts
link_with_feedback "$DOT_SCRIPTS/set-wallpapers.sh" "$HOME/.config/hypr"
link_with_feedback "$DOT_SCRIPTS/wset" "$HOME/.local/bin"

echo "🎉 Done!"


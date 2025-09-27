#!/usr/bin/env bash

DOT_SCRIPTS="$HOME/dotfiles/scripts"
VERBOSE=false

# Parse flags
while [[ "$1" == -* ]]; do
  case "$1" in
    --verbose) VERBOSE=true ;;
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

  if [[ -d "$dest_dir" ]]; then
    symlinkit -o "$src" "$dest_dir"
    local target="$dest_dir/$(basename "$src")"
    if $VERBOSE; then
      echo "✅ Linked: $target → $src"
    else
      echo "✅ Linked $(basename "$src") into $dest_dir"
    fi
  else
    echo "⚠️  Skipped: $dest_dir does not exist"
  fi
}

# Try linking both scripts
link_with_feedback "$DOT_SCRIPTS/set-wallpapers.sh" "$HOME/.config/hypr"
link_with_feedback "$DOT_SCRIPTS/wset" "$HOME/.local/bin"

echo "🎉 Done!"


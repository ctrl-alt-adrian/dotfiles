#!/usr/bin/env bash

# Usage:
#   set-wallpapers.sh --rand [folder]
#   set-wallpapers.sh /path/to/wall1 /path/to/wall2
#   set-wallpapers.sh --dp1 /path/to/wall
#   set-wallpapers.sh --dp2 /path/to/wall
#   set-wallpapers.sh   (reload last used)

STATE_FILE="$HOME/.config/hypr/.last_wallpapers"
DEFAULT_DIR="$HOME/Pictures/wallpapers"

# Monitors (adjust if names change)
MONITOR_DP2="DP-2"
MONITOR_DP1="DP-1"

# --- ensure notify-send is available (Arch) ---
ensure_notify() {
  if command -v notify-send >/dev/null 2>&1; then
    return 0
  fi
  if command -v pacman >/dev/null 2>&1; then
    echo "ℹ️  'notify-send' not found. Install with: sudo pacman -S libnotify"
  fi
}
ensure_notify

notify() {
  local msg="$1"
  if command -v notify-send >/dev/null 2>&1; then
    notify-send "Wallpaper" "$msg"
  fi
  echo "$msg"
}

# Start daemon if not already running (suppress WARNs)
pgrep -x swww-daemon >/dev/null || swww-daemon --no-cache 2> >(grep -v "WARN" >&2) &
sleep 1

apply_wallpaper() {
  local wall="$1"
  local monitor="$2"

  if [[ -f "$wall" ]]; then
    if swww img "$wall" --outputs "$monitor" --resize crop --transition-type none 2> >(grep -v "WARN" >&2); then
      notify "✅ $monitor → $(basename "$wall")"
    else
      notify "❌ Failed to set $monitor → $(basename "$wall")"
    fi
  else
    notify "❌ File not found for $monitor: $wall"
  fi
}

save_state() {
  echo "$1" > "$STATE_FILE"
  echo "$2" >> "$STATE_FILE"
}

reload_last() {
  if [[ -f "$STATE_FILE" ]]; then
    mapfile -t LAST < "$STATE_FILE"
    if [[ ${#LAST[@]} -eq 2 && -f "${LAST[0]}" && -f "${LAST[1]}" ]]; then
      apply_wallpaper "${LAST[0]}" "$MONITOR_DP2"
      apply_wallpaper "${LAST[1]}" "$MONITOR_DP1"
      notify "Reloaded last wallpapers"
    else
      notify "❌ No valid saved wallpapers found."
      exit 1
    fi
  else
    notify "❌ No saved wallpapers found. Run with --rand first."
    exit 1
  fi
}

# --- Main logic ---

if [[ "$1" == "--random" || "$1" == "--rand" ]]; then
  WALLPAPER_DIR="${2:-$DEFAULT_DIR}"

  if [[ ! -d "$WALLPAPER_DIR" ]]; then
    notify "❌ Wallpaper directory does not exist: $WALLPAPER_DIR"
    exit 1
  fi

  mapfile -t IMAGES < <(find "$WALLPAPER_DIR" -type f \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.webp' \))
  if [[ ${#IMAGES[@]} -lt 2 ]]; then
    notify "⚠️  Not enough images in $WALLPAPER_DIR. Reloading last..."
    reload_last
    exit 0
  fi

  WALL_DP2=$(shuf -e "${IMAGES[@]}" -n 1)
  WALL_DP1=$(shuf -e "${IMAGES[@]}" -n 1)
  while [[ "$WALL_DP2" == "$WALL_DP1" ]]; do
    WALL_DP1=$(shuf -e "${IMAGES[@]}" -n 1)
  done

  apply_wallpaper "$WALL_DP2" "$MONITOR_DP2"
  apply_wallpaper "$WALL_DP1" "$MONITOR_DP1"
  save_state "$WALL_DP2" "$WALL_DP1"
  notify "Random wallpapers applied from $(basename "$WALLPAPER_DIR")"

elif [[ "$1" == "--dp2" && -n "$2" ]]; then
  apply_wallpaper "$2" "$MONITOR_DP2"
  if [[ -f "$STATE_FILE" ]]; then
    mapfile -t LAST < "$STATE_FILE"
    save_state "$2" "${LAST[1]}"
  else
    save_state "$2" ""
  fi

elif [[ "$1" == "--dp1" && -n "$2" ]]; then
  apply_wallpaper "$2" "$MONITOR_DP1"
  if [[ -f "$STATE_FILE" ]]; then
    mapfile -t LAST < "$STATE_FILE"
    save_state "${LAST[0]}" "$2"
  else
    save_state "" "$2"
  fi

elif [[ -n "$1" && -n "$2" ]]; then
  if [[ -f "$1" && -f "$2" ]]; then
    apply_wallpaper "$1" "$MONITOR_DP2"
    apply_wallpaper "$2" "$MONITOR_DP1"
    save_state "$1" "$2"
    notify "Set explicit wallpapers"
  else
    notify "❌ One or both files not found. Reloading last..."
    reload_last
  fi

else
  reload_last
fi


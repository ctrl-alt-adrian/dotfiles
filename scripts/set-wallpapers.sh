#!/usr/bin/env bash
#
# set-wallpapers.sh
#
# 📌 Purpose:
#   Manage wallpapers per monitor in Hyprland using `swww`.
#   Supports random selection (per monitor or both), recursion depth,
#   per-monitor setting, and reloading the last used wallpapers.
#
# 🔑 Usage:
#   set-wallpapers.sh --rand [folder] [--depth N]
#   set-wallpapers.sh --dp1 <file|--rand [folder] [--depth N]>
#   set-wallpapers.sh --dp2 <file|--rand [folder] [--depth N]>
#   set-wallpapers.sh <file1> <file2>
#   set-wallpapers.sh               # reload last saved
#
# ⚙️ Options:
#   --rand [folder]    Random wallpapers (default: ~/Pictures/wallpapers)
#   --depth N          Limit recursion depth for random mode (default: unlimited)
#   --dp1              Target DP-1 only
#   --dp2              Target DP-2 only
#   -h | --help        Show this help message
#
# 💡 Notes:
#   • State is saved to ~/.config/hypr/.last_wallpapers
#   • Requires `swww` and (optionally) `notify-send`

STATE_FILE="$HOME/.config/hypr/.last_wallpapers"
DEFAULT_DIR="$HOME/Pictures/wallpapers"

MONITOR_DP2="DP-2"
MONITOR_DP1="DP-1"

show_help() {
  sed -n '2,40p' "$0" | sed 's/^# \{0,1\}//'
}

notify() {
  local msg="$1"
  if command -v notify-send >/dev/null 2>&1; then
    notify-send "Wallpaper" "$msg"
  fi
  echo "$msg"
}

# start daemon if not already running
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

pick_random_image() {
  local folder="$1"
  local depth_arg="$2"

  mapfile -t CANDIDATES < <(find "$folder" $depth_arg -type f \
    \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.webp' \) 2>/dev/null)

  [[ ${#CANDIDATES[@]} -eq 0 ]] && { notify "❌ No images found in $folder"; exit 1; }

  shuf -e "${CANDIDATES[@]}" -n 1
}

# --- main logic ---

case "$1" in
  -h|--help)
    show_help
    exit 0
    ;;

  --rand|--random)
    shift
    WALLPAPER_DIR="${1:-$DEFAULT_DIR}"
    [[ -d "$WALLPAPER_DIR" ]] || { notify "❌ Directory not found: $WALLPAPER_DIR"; exit 1; }

    DEPTH_ARG=""
    if [[ "$2" == "--depth" && -n "$3" ]]; then
      DEPTH_ARG="-maxdepth $3"
    fi

    WALL_DP2=$(pick_random_image "$WALLPAPER_DIR" "$DEPTH_ARG")
    WALL_DP1=$(pick_random_image "$WALLPAPER_DIR" "$DEPTH_ARG")
    while [[ "$WALL_DP2" == "$WALL_DP1" ]]; do
      WALL_DP1=$(pick_random_image "$WALLPAPER_DIR" "$DEPTH_ARG")
    done

    apply_wallpaper "$WALL_DP2" "$MONITOR_DP2"
    apply_wallpaper "$WALL_DP1" "$MONITOR_DP1"
    save_state "$WALL_DP2" "$WALL_DP1"
    notify "Random wallpapers applied from $(basename "$WALLPAPER_DIR")"
    ;;

  --dp1)
    shift
    if [[ "$1" == "--rand" || "$1" == "--random" ]]; then
      WALLPAPER_DIR="${2:-$DEFAULT_DIR}"
      DEPTH_ARG=""
      if [[ "$3" == "--depth" && -n "$4" ]]; then
        DEPTH_ARG="-maxdepth $4"
      fi
      RAND_IMG=$(pick_random_image "$WALLPAPER_DIR" "$DEPTH_ARG")
      apply_wallpaper "$RAND_IMG" "$MONITOR_DP1"
      mapfile -t LAST < "$STATE_FILE" 2>/dev/null || LAST=("" "")
      save_state "${LAST[0]}" "$RAND_IMG"
    else
      apply_wallpaper "$1" "$MONITOR_DP1"
      mapfile -t LAST < "$STATE_FILE" 2>/dev/null || LAST=("" "")
      save_state "${LAST[0]}" "$1"
    fi
    ;;

  --dp2)
    shift
    if [[ "$1" == "--rand" || "$1" == "--random" ]]; then
      WALLPAPER_DIR="${2:-$DEFAULT_DIR}"
      DEPTH_ARG=""
      if [[ "$3" == "--depth" && -n "$4" ]]; then
        DEPTH_ARG="-maxdepth $4"
      fi
      RAND_IMG=$(pick_random_image "$WALLPAPER_DIR" "$DEPTH_ARG")
      apply_wallpaper "$RAND_IMG" "$MONITOR_DP2"
      mapfile -t LAST < "$STATE_FILE" 2>/dev/null || LAST=("" "")
      save_state "$RAND_IMG" "${LAST[1]}"
    else
      apply_wallpaper "$1" "$MONITOR_DP2"
      mapfile -t LAST < "$STATE_FILE" 2>/dev/null || LAST=("" "")
      save_state "$1" "${LAST[1]}"
    fi
    ;;

  "")
    reload_last
    ;;

  *)
    if [[ $# -eq 2 ]]; then
      apply_wallpaper "$1" "$MONITOR_DP2"
      apply_wallpaper "$2" "$MONITOR_DP1"
      save_state "$1" "$2"
      notify "Set explicit wallpapers"
    else
      notify "❌ Invalid usage. Try --help."
      exit 1
    fi
    ;;
esac


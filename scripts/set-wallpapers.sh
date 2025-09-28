#!/usr/bin/env bash
#
# set-wallpapers.sh (multi-process swaybg, quiet logs + list/status flags)
#
# 📌 Purpose:
#   Manage wallpapers per monitor in Hyprland using `swaybg`.
#   Each monitor gets its own swaybg process, so they are independent.
#
# 🔑 Usage:
#   set-wallpapers.sh --rand [folder] [--depth N] [--mode MODE]
#   set-wallpapers.sh --dp1 <file|--rand [folder]> [--mode MODE]
#   set-wallpapers.sh --dp2 <file|--rand [folder]> [--mode MODE]
#   set-wallpapers.sh <file1> <file2>   # DP-1, DP-2
#   set-wallpapers.sh                   # reload last saved
#
# ⚙️ Options:
#   --rand [folder]    Random wallpapers (default: ~/Pictures/wallpapers)
#   --depth N          Limit recursion depth (default: unlimited)
#   --mode MODE        swaybg mode: fill (default), fit, stretch, center, tile
#   --dp1              Target DP-1 only
#   --dp2              Target DP-2 only
#   --list             Show currently saved wallpapers
#   --status           Show running status of wallpapers
#   -h | --help        Show this help message
#
# 💡 Notes:
#   • State saved to ~/.config/hypr/.last_wallpapers
#   • Requires `swaybg` and (optionally) `notify-send`

STATE_FILE="$HOME/.config/hypr/.last_wallpapers"
DEFAULT_DIR="$HOME/Pictures/wallpapers"
DEFAULT_MODE="fill"

MONITOR_DP1="DP-1"
MONITOR_DP2="DP-2"

show_help() {
  sed -n '2,50p' "$0" | sed 's/^# \{0,1\}//'
}

notify() {
  local msg="$1"
  if command -v notify-send >/dev/null 2>&1; then
    notify-send "Wallpaper" "$msg"
  fi
  echo "$msg"
}

pick_random_image() {
  local folder="$1"
  local depth_arg="$2"

  mapfile -t CANDIDATES < <(find "$folder" $depth_arg -type f \
    \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.webp' \) 2>/dev/null)

  [[ ${#CANDIDATES[@]} -eq 0 ]] && { notify "❌ No images found in $folder"; exit 1; }

  shuf -e "${CANDIDATES[@]}" -n 1
}

save_state() {
  echo "$1" > "$STATE_FILE"    # DP-1
  echo "$2" >> "$STATE_FILE"   # DP-2
}

reload_last() {
  if [[ -f "$STATE_FILE" ]]; then
    mapfile -t LAST < "$STATE_FILE"
    if [[ ${#LAST[@]} -eq 2 && -f "${LAST[0]}" && -f "${LAST[1]}" ]]; then
      apply_wallpaper "$MONITOR_DP1" "${LAST[0]}"
      apply_wallpaper "$MONITOR_DP2" "${LAST[1]}"
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

apply_wallpaper() {
  local monitor="$1"
  local wall="$2"
  local mode="${3:-$DEFAULT_MODE}"

  if [[ -f "$wall" ]]; then
    pkill -f "swaybg -o $monitor" 2>/dev/null
    swaybg -o "$monitor" -i "$wall" -m "$mode" >/dev/null 2>&1 &
    notify "✅ $monitor → $(basename "$wall")"
  else
    notify "❌ File not found for $monitor: $wall"
  fi
}

status_check() {
  if [[ -f "$STATE_FILE" ]]; then
    mapfile -t LAST < "$STATE_FILE"
    echo "📊 Wallpaper Status:"
    for i in 0 1; do
      monitor=$([[ $i -eq 0 ]] && echo "$MONITOR_DP1" || echo "$MONITOR_DP2")
      wall="${LAST[$i]}"
      if pgrep -af "swaybg -o $monitor" >/dev/null; then
        echo "  ✅ $monitor running → $wall"
      else
        echo "  ❌ $monitor not running (last saved: $wall)"
      fi
    done
  else
    echo "❌ No saved wallpapers yet."
  fi
}

# --- main logic ---

MODE="$DEFAULT_MODE"
if [[ "$*" == *"--mode"* ]]; then
  MODE="${@: -1}" # last arg
fi

case "$1" in
  -h|--help)
    show_help
    exit 0
    ;;

  --list)
    if [[ -f "$STATE_FILE" ]]; then
      mapfile -t LAST < "$STATE_FILE"
      echo "📂 Current wallpapers:"
      echo "  DP-1 → ${LAST[0]}"
      echo "  DP-2 → ${LAST[1]}"
    else
      echo "❌ No saved wallpapers yet."
    fi
    ;;

  --status)
    status_check
    ;;

  --rand|--random)
    shift
    WALLPAPER_DIR="${1:-$DEFAULT_DIR}"
    [[ -d "$WALLPAPER_DIR" ]] || { notify "❌ Directory not found: $WALLPAPER_DIR"; exit 1; }

    DEPTH_ARG=""
    if [[ "$2" == "--depth" && -n "$3" ]]; then
      DEPTH_ARG="-maxdepth $3"
    fi

    WALL_DP1=$(pick_random_image "$WALLPAPER_DIR" "$DEPTH_ARG")
    WALL_DP2=$(pick_random_image "$WALLPAPER_DIR" "$DEPTH_ARG")
    while [[ "$WALL_DP1" == "$WALL_DP2" ]]; do
      WALL_DP2=$(pick_random_image "$WALLPAPER_DIR" "$DEPTH_ARG")
    done

    apply_wallpaper "$MONITOR_DP1" "$WALL_DP1" "$MODE"
    apply_wallpaper "$MONITOR_DP2" "$WALL_DP2" "$MODE"
    save_state "$WALL_DP1" "$WALL_DP2"
    ;;

  --dp1)
    shift
    if [[ "$1" == "--rand" || "$1" == "--random" ]]; then
      WALLPAPER_DIR="${2:-$DEFAULT_DIR}"
      RAND_IMG=$(pick_random_image "$WALLPAPER_DIR")
      mapfile -t LAST < "$STATE_FILE" 2>/dev/null || LAST=("" "")
      apply_wallpaper "$MONITOR_DP1" "$RAND_IMG" "$MODE"
      save_state "$RAND_IMG" "${LAST[1]}"
    else
      mapfile -t LAST < "$STATE_FILE" 2>/dev/null || LAST=("" "")
      apply_wallpaper "$MONITOR_DP1" "$1" "$MODE"
      save_state "$1" "${LAST[1]}"
    fi
    ;;

  --dp2)
    shift
    if [[ "$1" == "--rand" || "$1" == "--random" ]]; then
      WALLPAPER_DIR="${2:-$DEFAULT_DIR}"
      RAND_IMG=$(pick_random_image "$WALLPAPER_DIR")
      mapfile -t LAST < "$STATE_FILE" 2>/dev/null || LAST=("" "")
      apply_wallpaper "$MONITOR_DP2" "$RAND_IMG" "$MODE"
      save_state "${LAST[0]}" "$RAND_IMG"
    else
      mapfile -t LAST < "$STATE_FILE" 2>/dev/null || LAST=("" "")
      apply_wallpaper "$MONITOR_DP2" "$1" "$MODE"
      save_state "${LAST[0]}" "$1"
    fi
    ;;

  "")
    reload_last
    ;;

  *)
    if [[ $# -eq 2 ]]; then
      apply_wallpaper "$MONITOR_DP1" "$1" "$MODE"
      apply_wallpaper "$MONITOR_DP2" "$2" "$MODE"
      save_state "$1" "$2"
      notify "Set explicit wallpapers"
    else
      notify "❌ Invalid usage. Try --help."
      exit 1
    fi
    ;;
esac


#!/usr/bin/env bash
#
# set-wallpapers-swww.sh
#
# 📌 Purpose:
#   Manage wallpapers per monitor in Hyprland using `swww`.
#
# 🔑 Usage:
#   set-wallpapers-swww.sh --rand [folder] [--depth N] [--mode fill|fit|stretch|center|tile]
#   set-wallpapers-swww.sh --dp1 <file|--rand [folder] [--depth N]>
#   set-wallpapers-swww.sh --dp2 <file|--rand [folder] [--depth N]>
#   set-wallpapers-swww.sh <file1> <file2>
#   set-wallpapers-swww.sh               # reload last saved
#
# ⚙️ Options:
#   --rand [folder]    Random wallpapers (default: ~/Pictures/wallpapers)
#   --depth N          Limit recursion depth for random mode
#   --dp1              Target DP-1 only
#   --dp2              Target DP-2 only
#   --mode MODE        Resize mode (default crop). [no, crop, fit, stretch]
#   -h | --help        Show this help message
#
# 💡 Notes:
#   • State saved in ~/.config/hypr/.last_wallpapers
#   • Requires `swww` running with --namespace $WAYLAND_DISPLAY
#

STATE_FILE="$HOME/.config/hypr/.last_wallpapers"
DEFAULT_DIR="$HOME/Pictures/wallpapers"
MONITOR_DP1="DP-1"
MONITOR_DP2="DP-2"
MODE="crop"

show_help() { sed -n '2,40p' "$0" | sed 's/^# \{0,1\}//'; }

notify() {
  local msg="$1"
  command -v notify-send >/dev/null && notify-send "Wallpaper (swww)" "$msg"
  echo "$msg"
}

# Ensure daemon is running
pgrep -x swww-daemon >/dev/null || \
  swww-daemon --no-cache --namespace "$WAYLAND_DISPLAY" > ~/.config/hypr/swww.log 2>&1 &
sleep 1

apply_wallpaper() {
  local wall="$1" monitor="$2"
  [[ -f "$wall" ]] || { notify "❌ File not found $wall"; return 1; }
  swww img "$wall" --outputs "$monitor" --resize "$MODE" --transition-type none 2> >(grep -v "WARN" >&2) &&
    notify "✅ $monitor → $(basename "$wall")"
}

save_state() { echo "$1" >"$STATE_FILE"; echo "$2" >>"$STATE_FILE"; }

reload_last() {
  if [[ -f "$STATE_FILE" ]]; then
    mapfile -t LAST <"$STATE_FILE"
    [[ ${#LAST[@]} -eq 2 && -f "${LAST[0]}" && -f "${LAST[1]}" ]] && {
      apply_wallpaper "${LAST[0]}" "$MONITOR_DP1"
      apply_wallpaper "${LAST[1]}" "$MONITOR_DP2"
      notify "Reloaded last wallpapers"
    } || notify "❌ Invalid saved wallpapers"
  else notify "❌ No saved wallpapers"; fi
}

pick_random_image() {
  local folder="$1" depth_arg="$2"
  mapfile -t CANDS < <(find "$folder" $depth_arg -type f \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.webp' \) 2>/dev/null)
  [[ ${#CANDS[@]} -eq 0 ]] && { notify "❌ No images in $folder"; exit 1; }
  shuf -e "${CANDS[@]}" -n 1
}

# --- main ---
[[ "$1" == "-h" || "$1" == "--help" ]] && { show_help; exit 0; }

[[ "$1" == "--mode" ]] && { shift; MODE="$1"; shift; }

case "$1" in
  --rand|--random)
    shift; DIR="${1:-$DEFAULT_DIR}"; [[ -d "$DIR" ]] || { notify "❌ No dir $DIR"; exit 1; }
    DEPTH_ARG=""; [[ "$2" == "--depth" && -n "$3" ]] && DEPTH_ARG="-maxdepth $3"
    W1=$(pick_random_image "$DIR" "$DEPTH_ARG"); W2=$(pick_random_image "$DIR" "$DEPTH_ARG"); while [[ "$W1" == "$W2" ]]; do W2=$(pick_random_image "$DIR" "$DEPTH_ARG"); done
    apply_wallpaper "$W1" "$MONITOR_DP1"; apply_wallpaper "$W2" "$MONITOR_DP2"; save_state "$W1" "$W2"
    ;;
  --dp1) shift; if [[ "$1" == --rand* ]]; then
      W=$(pick_random_image "${2:-$DEFAULT_DIR}"); apply_wallpaper "$W" "$MONITOR_DP1"; mapfile -t LAST <"$STATE_FILE" 2>/dev/null || LAST=(""""); save_state "$W" "${LAST[1]}"
    else apply_wallpaper "$1" "$MONITOR_DP1"; mapfile -t LAST <"$STATE_FILE" 2>/dev/null || LAST=(""""); save_state "$1" "${LAST[1]}"; fi ;;
  --dp2) shift; if [[ "$1" == --rand* ]]; then
      W=$(pick_random_image "${2:-$DEFAULT_DIR}"); apply_wallpaper "$W" "$MONITOR_DP2"; mapfile -t LAST <"$STATE_FILE" 2>/dev/null || LAST=(""""); save_state "${LAST[0]}" "$W"
    else apply_wallpaper "$1" "$MONITOR_DP2"; mapfile -t LAST <"$STATE_FILE" 2>/dev/null || LAST=(""""); save_state "${LAST[0]}" "$1"; fi ;;
  "") reload_last ;;
  *) [[ $# -eq 2 ]] && { apply_wallpaper "$1" "$MONITOR_DP1"; apply_wallpaper "$2" "$MONITOR_DP2"; save_state "$1" "$2"; } || notify "❌ Invalid usage";;
esac


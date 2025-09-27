symlinkit() {
  command -v fzf >/dev/null 2>&1 || { echo "❌ fzf not found"; return 1; }
  command -v tree >/dev/null 2>&1 || { echo "❌ tree not found"; return 1; }
  command -v realpath >/dev/null 2>&1 || { echo "❌ realpath not found (install coreutils)"; return 1; }

  GREEN="\033[0;32m"
  RED="\033[0;31m"
  YELLOW="\033[0;33m"
  RESET="\033[0m"

  dry_run=false
  dry_run_overwrite=false
  mode=""

  linked=0
  overwritten=0
  skipped=0

  # Parse flags
  while [[ "$1" == -* ]]; do
    case "$1" in
      --dry-run) dry_run=true ;;
      --dry-run-overwrite) dry_run=true; dry_run_overwrite=true ;;
      -o) mode="overwrite" ;;
      -m) mode="merge" ;;
      *) echo "❌ Unknown flag: $1"; return 1 ;;
    esac
    shift
  done

  # Handle arguments
  if [[ -n "$1" ]]; then
    src="$1"; shift
  else
    src=$(find "${SYMLINK_BASE_SRC:-$HOME}" -mindepth 1 -maxdepth "${SYMLINK_DEPTH:-5}" -type d -print 2>/dev/null \
          | fzf --prompt="Source dir> " --preview 'ls -la --color=always {}' --preview-window=down:15)
  fi
  [[ -z "$src" ]] && echo "❌ No source selected." && return 1

  if [[ -n "$1" ]]; then
    dest="$1"; shift
  else
    dest=$(find "${SYMLINK_BASE_DEST:-$HOME}" -mindepth 0 -maxdepth "${SYMLINK_DEPTH:-5}" -type d -print 2>/dev/null \
           | fzf --prompt="Destination dir> " --preview 'ls -la --color=always {}' --preview-window=down:15)
  fi
  [[ -z "$dest" ]] && echo "❌ No destination selected." && return 1

  # Expand and absolutize paths
  src=$(realpath -m "$(eval echo "$src")")
  dest=$(realpath -m "$(eval echo "$dest")")

  # Ensure destination exists
  $dry_run || mkdir -p -- "$dest"

  linkname=$(basename -- "$src")
  target="$dest/$linkname"

  # If target exists, pick mode interactively (if no flag given)
  if [[ -e "$target" || -L "$target" ]]; then
    if [[ -z "$mode" ]]; then
      printf "⚠️  %s already exists.\n[o]verwrite / [m]erge / [c]ancel > " "$target"
      read -n1 choice; echo
      case "$choice" in
        o|O) mode="overwrite" ;;
        m|M) mode="merge" ;;
        *) echo "❌ Cancelled."; return 1 ;;
      esac
    fi
  else
    mode="overwrite"
  fi

  # --- Overwrite Mode ---
  if [[ "$mode" == "overwrite" ]]; then
    $dry_run || { rm -rf -- "$target"; ln -s -- "$src" "$target"; }
    if $dry_run; then
      echo -e "${RED}🔄 Would overwrite symlink:${RESET} $target → $src"
      ((overwritten++))
    else
      echo -e "${RED}🔄 Overwritten symlink:${RESET} $target → $src"
    fi
  fi

  # --- Merge Mode ---
  if [[ "$mode" == "merge" ]]; then
    mkdir -p -- "$target"
    overwrite_all=false
    find "$src" -print0 | while IFS= read -r -d '' item; do
      [[ "$item" == "$src" ]] && continue
      relpath="${item#$src/}"
      dest_item="$target/$relpath"

      if [[ -d "$item" ]]; then
        $dry_run || mkdir -p -- "$dest_item"
      else
        if [[ -e "$dest_item" || -L "$dest_item" ]]; then
          if [[ "$overwrite_all" == true ]]; then
            $dry_run || { rm -rf -- "$dest_item"; ln -s -- "$item" "$dest_item"; }
            echo -e "${RED}🔄 Overwritten:${RESET} $dest_item"
            ((overwritten++))
          else
            if $dry_run; then
              if $dry_run_overwrite; then
                echo -e "${RED}🔄 Would overwrite:${RESET} $dest_item"
                ((overwritten++))
              else
                echo -e "${YELLOW}⏭️ Would skip:${RESET} $dest_item"
                ((skipped++))
              fi
            else
              printf "⚠️  Conflict: %s exists.\n[s]kip / [o]verwrite / [a]ll overwrite / [c]ancel > " "$dest_item"
              read -n1 action; echo
              case "$action" in
                s|S) echo -e "${YELLOW}⏭️ Skipped:${RESET} $dest_item"; ((skipped++)) ;;
                o|O) rm -rf -- "$dest_item"; ln -s -- "$item" "$dest_item"; echo -e "${RED}🔄 Overwritten:${RESET} $dest_item"; ((overwritten++)) ;;
                a|A) overwrite_all=true; rm -rf -- "$dest_item"; ln -s -- "$item" "$dest_item"; echo -e "${RED}🔄 Overwritten (all):${RESET} $dest_item"; ((overwritten++)) ;;
                *) echo "❌ Cancelled."; return 1 ;;
              esac
            fi
          fi
        else
          $dry_run || ln -s -- "$item" "$dest_item"
          if $dry_run; then
            echo -e "${GREEN}✅ Would link:${RESET} $dest_item"
            ((linked++))
          else
            echo -e "${GREEN}✅ Linked:${RESET} $dest_item"
          fi
        fi
      fi
    done
  fi

  echo "📂 Destination listing:"
  if $dry_run; then
    echo -e "(${YELLOW}Dry run:${RESET} no changes applied)"
    echo -e "📊 Summary: ${GREEN}$linked would link${RESET}, ${RED}$overwritten would overwrite${RESET}, ${YELLOW}$skipped would skip${RESET}"
  else
    tree -fp "$dest"
  fi
}


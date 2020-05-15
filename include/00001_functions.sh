# Get named var (usage: get "VAR_NAME")

get() {
  echo "${!1}"
}

# Executable

is-executable() {
  local BIN=$(command -v "$1" 2>/dev/null)
  if [[ ! $BIN == "" && -x $BIN ]]; then true; else false; fi
}

is-supported() {
  if [ $# -eq 1 ]; then
    if eval "$1" > /dev/null 2>&1; then true; else false; fi
  else
    if eval "$1" > /dev/null 2>&1; then
      echo -n "$2"
    else
      echo -n "$3"
    fi
  fi
}

# Add to path

prepend-path() {
  [ -d $1 ] && PATH="$1:$PATH"
}

prepend-manpath() {
  [ -d $1 ] && MANPATH="$1:$MANPATH"
}

# Show 256 TERM colors

colors() {
  local X=$(tput op)
  local Y=$(printf %$((COLUMNS-6))s)
  for i in {0..256}; do
  o=00$i;
  echo -e ${o:${#o}-3:3} $(tput setaf $i;tput setab $i)${Y// /=}$X;
  done
}

# Calculator

calc() {
  echo "$*" | bc -l;
}

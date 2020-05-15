# History

export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "

# Enable colors

export CLICOLOR=1

# Highlight section titles in man pages

export LESS_TERMCAP_md="${yellow}";

# Keep showing man page after exit

export MANPAGER='less -X';

# Case-insensitive globbing (used in pathname expansion)

shopt -s nocaseglob

# Recursive globbing with "**"

if [ ${BASH_VERSINFO[0]} -ge 4 ]; then
  shopt -s globstar
fi

# Append to the Bash history file, rather than overwriting it

shopt -s histappend

# Autocorrect typos in path names when using `cd`

shopt -s cdspell

# Do not autocomplete when accidentally pressing Tab on an empty line.

shopt -s no_empty_cmd_completion

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.

shopt -s checkwinsize

# Editor

export EDITOR="emacsclient"

# Locale

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export FZF_TMUX=1

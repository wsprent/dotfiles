# Shortcuts

alias _="sudo"
alias g="git"
alias v="vim"
alias rr="rm -rf"

alias em="emacsclient"

# Kubectl
alias k="kubectl"
alias kctx="kubectl config use-context"

# Global aliases

if $(is-supported "alias -g"); then
  alias -g G="| grep -i"
  alias -g H="| head"
  alias -g T="| tail"
  alias -g L="| less"
fi

# List declared aliases, functions

alias listaliases="alias | sed 's/=.*//'"
alias listfunctions="declare -f | grep '^[a-z].* ()' | sed 's/{$//'" # show non _prefixed functions

# dir listing/traversal

LS_COLORS=`is-supported "ls --color" --color -G`
LS_TIMESTYLEISO=`is-supported "ls --time-style=long-iso" --time-style=long-iso`
LS_GROUPDIRSFIRST=`is-supported "ls --group-directories-first" --group-directories-first`

alias l="ls -lahA $LS_COLORS $LS_TIMESTYLEISO $LS_GROUPDIRSFIRST"
alias ll="ls -lA $LS_COLORS"
alias lt="ls -lhAtr $LS_COLORS $LS_TIMESTYLEISO $LS_GROUPDIRSFIRST"
alias ld="ls -ld $LS_COLORS */"

unset LS_COLORS LS_TIMESTYLEISO LS_GROUPDIRSFIRST

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias -- -="cd -"                  # Go to previous dir with -
alias cd.='cd $(greadlink -f .)'    # Go to real dir (i.e. if current dir is linked)


alias tree="tree -A"
alias treed="tree -d"
alias tree1="tree -d -L 1"
alias tree2="tree -d -L 2"

alias cpwd='pwd|tr -d "\n"|pbcopy'

# rsync

alias rsync="rsync -vh"


# Network

alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ipl="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"

# Request using GET, POST, etc. method

for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
  alias "$method"="lwp-request -m '$method'"
done

# Recursively remove Apple meta files

alias cleanupds="find . -type f -name '*.DS_Store' -ls -exec /bin/rm {} \;"
alias cleanupad="find . -type d -name '.AppleD*' -ls -exec /bin/rm -r {} \;"

# Miscellaneous

alias quit="exit"
alias week="date +%V"

alias bokken=bokken-cli
alias bashrc=". ~/.bashrc"

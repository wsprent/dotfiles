# Start with system path
# Retrieve it from getconf, otherwise it's just current $PATH

is-executable getconf && PATH=$(`command -v getconf` PATH)

# Prepend new items to path (if directory exists)
export GOPATH=~/go

prepend-path "/bin"
prepend-path "/usr/bin"
prepend-path "$DOTFILES_DIR/bin"
prepend-path "$HOME/bin"
prepend-path "/sbin"
prepend-path "/usr/sbin"
prepend-path "/usr/local/sbin"
prepend-path "$GOPATH/bin"
prepend-path "/usr/local/bin"
prepend-path "/usr/local/opt/ruby/bin"
prepend-path "/Users/williamsprent/gcloud/google-cloud-sdk/bin/"

prepend-path "/usr/local/opt/gnu-sed/libexec/gnubin"
prepend-path "/usr/local/opt/grep/libexec/gnubin"

is-executable brew && prepend-path "$(brew --prefix coreutils)/libexec/gnubin"
is-executable brew && prepend-manpath "$(brew --prefix coreutils)/libexec/gnuman"


# Remove duplicates (preserving prepended items)
# Source: http://unix.stackexchange.com/a/40755

PATH=`echo -n $PATH | awk -v RS=: '{ if (!arr[$0]++) {printf("%s%s",!ln++?"":":",$0)}}'`

# Wrap up

export PATH

# Homebrew /opt/homebrew/bin/brew shellenv
set -gx HOMEBREW_PREFIX "/opt/homebrew";
set -gx HOMEBREW_CELLAR "/opt/homebrew/Cellar";
set -gx HOMEBREW_REPOSITORY "/opt/homebrew";
set -q PATH; or set PATH ''; set -gx PATH "/opt/homebrew/bin" "/opt/homebrew/sbin" $PATH;
set -q MANPATH; or set MANPATH ''; set -gx MANPATH "/opt/homebrew/share/man" $MANPATH;
set -q INFOPATH; or set INFOPATH ''; set -gx INFOPATH "/opt/homebrew/share/info" $INFOPATH;

# Path to your oh-my-fish.
set -g OMF_PATH $HOME/.local/share/omf
set -g OMF_CONFIG $HOME/.config/omf

set -g theme_display_ruby no

set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8

set -x PATH /usr/local/sbin $PATH
set -x EDITOR /usr/bin/vim
set -x PATH /opt/homebrew/bin $PATH

set -x PATH /usr/local/kubebuilder/bin $PATH

# Alias
alias k "kubectl"
alias ksn "kubectl config set-context (kubectl config current-contect) --namespace=$1"
alias serve "python -m SimpleHTTPServer 8000"

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish
contains /usr/local/bin $fish_user_paths; or set -Ua fish_user_paths /usr/local/bin
contains /usr/local/opt/ruby/bin $fish_user_paths; or set -Ua fish_user_paths /usr/local/opt/ruby/bin

# Karn (https://github.com/prydonius/karn)
alias git="karn update; command git $argv"
# Dancing helper
source $HOME/.config/fish/functions/dancing.fish

set -g fish_user_paths "/usr/local/opt/openjdk/bin" $fish_user_paths

# google cloud cli
source /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc 

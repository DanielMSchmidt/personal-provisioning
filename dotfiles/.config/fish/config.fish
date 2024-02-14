# Path to your oh-my-fish.
set -g OMF_PATH $HOME/.local/share/omf
set -g OMF_CONFIG $HOME/.config/omf

set -g theme_display_ruby no

set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8

set -x PATH /usr/local/sbin $PATH
set -x EDITOR /usr/bin/vim

ssh-add ~/.ssh/id_rsa

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish
contains /usr/local/bin $fish_user_paths; or set -Ua fish_user_paths /usr/local/bin
contains /usr/local/opt/ruby/bin $fish_user_paths; or set -Ua fish_user_paths /usr/local/opt/ruby/bin
contains /usr/local/opt/terraform@0.12/bin $fish_user_paths; or set -Ua fish_user_paths /usr/local/opt/terraform@0.12/bin

# Dancing helper
source $HOME/.config/fish/functions/atlas.fish
source $HOME/.config/fish/functions/dancing.fish
source $HOME/.config/fish/functions/development.fish

set -g fish_user_paths /usr/local/opt/openjdk/bin $fish_user_paths

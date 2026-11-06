if status --is-interactive
    # Use term colors except make symlinks green
    set -gx LS_COLORS "ln=01;32"

    # Some tools such as ghostty use XDG_CONFIG_HOME
    set -gx XDG_CONFIG_HOME "$HOME/.config"
end

source (status dirname)/conf/mise.fish
source (status dirname)/conf/completions.fish

source (status dirname)/conf/editor.fish
source (status dirname)/conf/alias-git.fish
source (status dirname)/conf/alias-misc.fish

source (status dirname)/conf/misc.fish

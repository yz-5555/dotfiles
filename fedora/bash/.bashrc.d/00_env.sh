function append_path() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="${PATH:+"$PATH:"}$1"
    fi
}

export EDITOR="nvim"
export STARSHIP_CONFIG_HOME="$HOME/.config/starship" # what is this for?
export STARSHIP_CONFIG="$STARSHIP_CONFIG_HOME/starship.toml"
export DOTFILES="$HOME/Documents/dotfiles"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# ssh agent
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
if [ ! -S "$SSH_AUTH_SOCK" ]; then
    eval "$(ssh-agent -a "$SSH_AUTH_SOCK")" >/dev/null
fi

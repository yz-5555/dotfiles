# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# cd
function cdconf() {
	if [ -z "$1" ]; then
		cd "$HOME/.config"
	else
		cd "$HOME/.config/$1"
	fi
}
function cdproj() {
	if [ -z "$1" ]; then
		cd "$HOME/Documents/dev/projects"
	else
		cd "$HOME/Documents/dev/projects/$1"
	fi
}
function cddot() {
	if [ -z "$1" ]; then
		cd "$HOME/Documents/dev/dotfiles"
	else
		cd "$HOME/Documents/dev/dotfiles/$1"
	fi
}
function append_path() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="${PATH:+"$PATH:"}$1"
    fi
}

# alias
alias vim=nvim
alias vimbash="nvim $HOME/.bashrc"
alias reload="source $HOME/.bashrc"

# ENV_VAR
export EDITOR="nvim"
export DDF_TARGET="$HOME/Documents/dev/dotfiles/"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# PATH
append_path "$HOME/Tools/zls/zig-out/bin" # zls
append_path "$HOME/Documents/dev/projects/ddf/target/release" # ddf

eval "$(starship init bash)"
# source -- ~/.local/share/blesh/ble.sh
. "$HOME/.cargo/env"

# ssh agent
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
if [ ! -S "$SSH_AUTH_SOCK" ]; then
    eval "$(ssh-agent -a "$SSH_AUTH_SOCK")" > /dev/null
fi

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
		cd "$HOME/documents/projects"
	else
		cd "$HOME/documents/projects/$1"
	fi
}

# alias
alias vim=nvim
alias vimbash="nvim $HOME/.bashrc"

# ENV_VAR
export EDITOR="nvim"

# PATH
export PATH="$PATH:/home/yz/apps/zls/zig-out/bin" # zls

eval "$(starship init bash)"
# source -- ~/.local/share/blesh/ble.sh
. "$HOME/.cargo/env"

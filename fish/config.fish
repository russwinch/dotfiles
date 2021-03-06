. ~/.config/fish/aliases.fish
. ~/.local.fish

set fish_greeting

# vi modes with emacs bindings
fish_hybrid_key_bindings

set -x EDITOR nvim

# fzf should use the silver searcher
set -x FZF_DEFAULT_COMMAND 'ag -g ""'

# prevent ctrl-d exiting until the 5th time
function fish_user_key_bindings
    bind \cd delete-char
    bind \cd\cd\cd\cd\cd exit
    bind --mode insert \cd delete-char
    bind --mode insert \cd\cd\cd\cd\cd exit
end

# pyenv
set -x PATH "$HOME/.pyenv/bin:$PATH"
pyenv init - | source

. ~/.config/fish/aliases.fish

set fish_greeting

set -gx EDITOR nvim

# fzf should use the silver searcher
set -gx FZF_DEFAULT_COMMAND 'ag -g ""'

# prevent ctrl-d exiting until the 5th time
function fish_user_key_bindings
    bind \cd delete-char
    bind \cd\cd\cd\cd\cd exit
end

# pyenv
set -x PATH "$HOME/.pyenv/bin:$PATH"
pyenv init - | source

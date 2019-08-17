. ~/.config/fish/aliases.fish

set fish_greeting

set -gx EDITOR nvim

# fzf should use the silver searcher
set -gx FZF_DEFAULT_COMMAND 'ag -g ""'

# pyenv
set -x PATH "$HOME/.pyenv/bin:$PATH"
pyenv init - | source

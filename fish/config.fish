set --global fish_greeting

starship init fish | source

zoxide init --cmd cd fish | source

fzf --fish | source

alias cat='bat --paging=never'

alias ls='eza --color=auto --group-directories-first --icons=auto'
alias la='ls --all'
alias ll='ls --long'
alias lt='ls --tree'

alias grep='rg'

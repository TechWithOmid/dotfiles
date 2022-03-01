if status is-interactive
    # Commands to run in interactive sessions can go here
end

# npm config
set NPM_PACKAGES "$HOME/.npm-packages"
set PATH $PATH $NPM_PACKAGES/bin
set MANPATH $NPM_PACKAGES/share/man $MANPATH  

# alias
alias ls "exa --icons"
alias lsa "exa --icons -a"
alias ll "exa -l -g --icons"
alias lla "ll -a"

alias nv "nvim"
alias v "vim"

alias w "wal -q -i ~/Pictures/Wallpapers/"

# dotfiles alias
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

export LANG=en_US.UTF-8
export PATH="/home/omid/.local/bin:$PATH"


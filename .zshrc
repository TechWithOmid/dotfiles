export ZSH="$HOME/.oh-my-zsh"
# ZSH_THEME="robbyrussell"
# plugins=(git sudo zsh-autosuggestions zsh-syntax-highlighting)
plugins=(git sudo)

# npm config
set NPM_PACKAGES "$HOME/.npm-packages"
set PATH $PATH $NPM_PACKAGES/bin
set MANPATH $NPM_PACKAGES/share/man $MANPATH  


# alias
alias nv="nvim"
alias v="vim"
alias ntd="nv ~/Documents/todo.md"
alias gtd="glow ~/Documents/todo.md"
alias w="wal -q -i"
# dotfiles alias
alias dot='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

source $ZSH/oh-my-zsh.sh
export PATH=$HOME/.local/bin:$PATH
eval "$(starship init zsh)"
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


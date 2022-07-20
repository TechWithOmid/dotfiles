export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git sudo colored-man-pages zsh-autosuggestions zsh-syntax-highlighting)

# npm config
set NPM_PACKAGES "$HOME/.npm-packages"
set PATH $PATH $NPM_PACKAGES/bin
set MANPATH $NPM_PACKAGES/share/man $MANPATH  

# PATH
export PATH="/home/omid/.cargo/bin:$PATH"

# alias
alias nv="nvim"
alias v="vim"
alias w="feh --bg-fill --randomize ~/Pictures/Wallpapers/"

# dotfiles alias
alias dot='git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

source $ZSH/oh-my-zsh.sh
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.local/bin/appimages:$PATH
source /home/omid/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

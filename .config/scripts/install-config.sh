# update the system
sudo pacman -Syyu --noconfirm

sudo pacman -S i3-gaps ttf-dejavu i3status --noconfirm
sudo pacman -S xorg xorg-xinit xterm
sudo pacman -S xorg-xeyes xorg-xclock xterm
sudo pacman -S curl wget
sudo pacman -S vim neovim
# vscode, sublime
sudo pacman -S dmenu, rofi, picom
sudo pacman -S kitty alacritt tmux
sudo pacman -S google-chrome
sudo pacman -S telegram-desktop
sudo pacman -S feh flameshot
sudo pacman -S polybar

# ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# final setup
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
dotfiles checkout

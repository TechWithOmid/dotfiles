
# Arch Linux Setup With I3

requirements:
  - i3gaps, i3status, autotilling
  - rofi, dmenu
  - picom         
  - spotify            (music player)
  - kitty or alacritty, tmux (terminal)
  - chrome or firefox  (browser)
  - telegram desktop   (messanger)
  - thunar             (file manger)
  - feh                (image viewer also use for change wallpaper)
  - flameshot          (tool for take screenshot)
  - vscode, sublime, neovim , vim

## How to setup new computer
clone the repository
```bash
git clone --bare https://github.com/techwithomid/dotfiles.git $HOME/dotfiles
```
copy the code's in your terminal
```bash
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
dotfiles checkout
```

### ToDo
- [ ] Make it useable with Fedora
- [ ] Create Installation Script


# Setup environment in a new computer

Make sure to have git installed, then:

- clone your github repository
```bash
git clone --bare https://github.com/USERNAME/dotfiles.git $HOME/.dotfiles
```
- define the alias in the current shell scope
```bash
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```
- checkout the actual content from the git repository to your $HOME
```bash
dotfiles checkout
```

**Note that if you already have some of the files you'll get an error message. You can either (1) delete them or (2) back them up somewhere else. It's up to you.**

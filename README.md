Installation Instructions

First, clone the main file:

```bash
$ git clone https://github.com/steven-IO/dotfiles.git
```

---
*Note:* The vim plugins are actually removed right now. Will figure out how I want this to work later.
Then get the vim plugins:

```bash
$ cd dotfiles
$ git submodule init
$ git submodule update
```
---

Merge or remove any of the current configuration files from the home folder with the ones in this directory and create symlinks in their place:

```bash
$ ln -s ~/dotfiles/vimrc ~/.vimrc
$ ln -s ~/dotfiles/vim ~/.vim
etc.
```

*Note:* The two files `xmonad-startup.sh` and `xmonad.desktop` should actually be put in the directory `usr/share/xsessions/`. Also, the background is currently set in xmonad-startup.sh to a picture in my wallpapers photo. That path should be to whatever background photo you want.

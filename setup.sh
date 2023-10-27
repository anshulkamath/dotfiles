#!/bin/bash
wd=$(pwd)
bin=/usr/local/bin

ln -sf "$wd/alacritty" ~/.config
ln -sf "$wd/nvim" ~/.config
ln -sf "$wd/tmux" ~/.config
ln -sf "$wd/bin" ~/.config
ln -sf "$wd/kitty" ~/.config

mkdir -p ~/.config/git
ln -sf "$wd/gitignore-global" ~/.config/git/ignore
git config --global core.excludesFile ~/.config/git/ignore

if [[ ! -d $bin ]]; then
  mkdir -p $bin
  echo $PATH | grep ":$bin:" >> /dev/null
  if [ $? -ne 0 ]; then
    echo "export PATH=\$PATH:$bin" >> ~/.bashrc
  fi
fi

for d in $(ls bin); do ln -sf $wd/bin/$d $bin; done

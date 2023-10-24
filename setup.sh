#!/bin/bash
wd=$(pwd)

ln -sf "$wd/alacritty" ~/.config
ln -sf "$wd/nvim" ~/.config
ln -sf "$wd/tmux" ~/.config
ln -sf "$wd/bin" ~/.config
ln -sf "$wd/kitty" ~/.config

if [[ ! -d /usr/local/bin ]]; then
  mkdir -p /usr/local/bin
  echo "Created /usr/local/bin. Make sure that it is in your path"
fi

ln -sf "$wd/create-session" /usr/local/bin

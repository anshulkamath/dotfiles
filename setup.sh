#!/bin/bash

wd=$(pwd)
xdg_config_home="$HOME/.config"

# link everything to $XDG_CONFIG_HOME
for d in $(ls -d */); do 
  test -L "$xdg_config_home/$d" || ln -sfn "$wd/$d" "$xdg_config_home"
done

# link all custom binaries to path
for d in $(find "bin" -type f); do chmod +x $d; done

# assert local bin is in path , which is not necessarily be true on all systems?
if [[ $PATH != *":$bin"* ]]; then
  echo "export PATH=\$PATH:$bin" >> ~/.bashrc
fi


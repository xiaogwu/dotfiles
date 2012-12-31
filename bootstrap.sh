#!/usr/bin/env bash

DOTFILES=$HOME/dotfiles

for file in $(ls -1 | grep -v "bootstrap.sh"); do
    if [ ! -L "$HOME/.$file" ]; then
        ln -sv "$DOTFILES/$file" "$HOME/.$file"
    else
        ln -siv "$DOTFILES/$file" "$HOME/.$file"
    fi
done

exit 0


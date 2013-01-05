#!/usr/bin/env bash

DOTFILES=$HOME/dotfiles

for file in $(ls -1 | grep -v "bootstrap.sh" | grep -v "README"); do
    if [ -f "$HOME/.$file" ]; then
        echo ".$file already exists in $HOME, renaming to $file.old"
        mv "$HOME/.$file" "$HOME/$file.old"
    fi
    if [ ! -L "$HOME/.$file" ]; then
        ln -sv "$DOTFILES/$file" "$HOME/.$file"
    else
        ln -siv "$DOTFILES/$file" "$HOME/.$file"
    fi
done

exit 0


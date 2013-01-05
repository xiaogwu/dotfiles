#!/usr/bin/env bash

DOTFILES=$HOME/dotfiles

for file in $(ls -1 | grep -v "bootstrap.sh" | grep -v "README"); do
    if [ -L "$HOME/.$file" ]; then
        ln -siv "$DOTFILES/$file" "$HOME/.$file"
        continue
    fi

    if [ -f "$HOME/.$file" ]; then
        echo ".$file already exists in $HOME, renaming to $file.old"
        mv "$HOME/.$file" "$HOME/$file.old"
        ln -sv "$DOTFILES/$file" "$HOME/.$file"
        continue
    fi

    ln -sv "$DOTFILES/$file" "$HOME/.$file"
done

exit 0


#!/bin/bash

# Find script directory
PLATFORM=$(uname)
if [ $PLATFORM = "Darwin" ]
then
    SCRIPT_DIR=$(greadlink -f $(dirname $BASH_SOURCE))
else
    SCRIPT_DIR=$(readlink -f $(dirname $BASH_SOURCE))
fi

# Find local name
if [ -z "$1" ]
then
    echo "Usage: ./setup.sh <localname>"
    exit 1;
fi
local_name=$1
overwrite_all="N"

function link() {
    echo "Linking $1 to $2..."
    if [ -e "$2" ] || [ -L "$2" ]
    then
        answer="Y"
        if [ $overwrite_all = "N" ]
        then
            echo "$2 already exists. Overwrite? (y/N/a)"
            read answer
        fi
        if [ $overwrite_all = "Y" ] || [ $answer = a ] || [ $answer = A ]
        then
            overwrite_all="Y"
            answer="Y"
        fi
        if [ $answer = "Y" ] || [ $answer = "y" ]
        then
            echo "Overwriting $2."
            rm $2
            ln -s "$1" "$2"
            echo "Linked $1 to $2."
        fi
    else
        ln -s "$1" "$2"
        echo "Linked $1 to $2."
    fi
}

# Setup .config directory
echo "Setting up .config directory..."
if [ -d "$HOME/.config" ]
then
    echo "$HOME/.config already exists."
else
    echo "$HOME/.config not found. Creating folder... "
    mkdir "$HOME/.config"
    echo "Done."
fi

 
# Setup nvim directory
echo "Setting up nvim directory..."
[ -d "$HOME/.config/nvim" ] || mkdir "$HOME/.config/nvim"

# Link all files / directory under nvim
for file in "$SCRIPT_DIR/.config/nvim/"*
do
    filename=${file##*/}
    link "$SCRIPT_DIR/.config/nvim/$filename" "$HOME/.config/nvim/$filename"
done

# Setup local configuration
if [ ! -d "$SCRIPT_DIR/.config/nvim/localruntime/$local_name" ]
then
    mkdir "$SCRIPT_DIR/.config/nvim/localruntime/$local_name"
fi
# Link active local config
link "$local_name" "$SCRIPT_DIR/.config/nvim/localruntime/active"

# Setup tmux directory
echo "Setting up tmux directory..."
[ -d "$HOME/.config/tmux" ] || mkdir "$HOME/.config/tmux"

# Link .tmux.conf
link "$SCRIPT_DIR/.config/tmux/.tmux.conf" "$HOME/.config/tmux/.tmux.conf"
# Link local
link "$SCRIPT_DIR/.config/tmux/local" "$HOME/.config/tmux/local"
# Link active local config
[ -e $SCRIPT_DIR/.config/tmux/local/$local_name.tmux.conf ] || touch $SCRIPT_DIR/.config/tmux/local/$local_name.tmux.conf
link "$local_name.tmux.conf" "$SCRIPT_DIR/.config/tmux/local/active.tmux.conf"
# Link $HOME/.tmux.conf
link "$HOME/.config/tmux/.tmux.conf" "$HOME/.tmux.conf"
# Link tmuxline
link "$SCRIPT_DIR/.config/tmux/tmuxline" "$HOME/.config/tmux/tmuxline" 

# # Link nvim configurations
# [ -L "$HOME/.config/nvim/init.vim" ] || ln -s "$SCRIPT_DIR/.config/nvim/init.vim" "$HOME/.config/nvim/init.vim"
# [ -f "$HOME/.config/nvim/localruntime/$LOCALNAME" ] || touch "$HOME/.config/nvim/localruntime/$LOCALNAME"
# [ -L "$HOME/.config/nvim/localruntime/active" ] || ln -s "$HOME/.config/nvim/localruntime/$LOCALNAME" "$HOME/.config/nvim/localruntime/activei"

# # Link tmux configurations
# [ -L "$HOME/.config/tmux" ] || ln -s "$SCRIPT_DIR/.config/tmux" "$HOME/.config/tmux"
# [ -L "$HOME/.tmux.conf" ] || ln -s "$HOME/.config/tmux/.tmux.conf" "$HOME/.tmux.conf"
# [ -f "$HOME/.config/tmux/local/$LOCALNAME.tmux.conf" ] || touch "$HOME/.config/tmux/local/$LOCALNAME.tmux.conf"
# [ -L "$HOME/.config/tmux/local/active.tmux.conf" ] || ln -s "$HOME/.config/tmux/local/$LOCALNAME.tmux.conf" "$HOME/.config/tmux/active.tmux.conf"


#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
# Editor
export EDITOR='nvim'
export VISUAL='nvim'

# Node JS
export NODE_ENV='development'

# Promptline
source ~/.promptline/promptline.sh

# Vim binding
bindkey -v

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-ocean.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# Home bin
if [ -d "$HOME/bin" ]
then
  PATH="$HOME/bin:$PATH"
fi

# Term
set $TERM = 'xterm'

# Module CD
modulecd() {
  cd "$HOME/drive/study/NUS/modules/$@/";
}

fd() {
  local dir
  dir=$(find ${1:-*} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

PATH=$PATH:~/bin
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

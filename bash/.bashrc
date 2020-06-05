#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Exports
export PATH="$PATH:/home/gibbs/.gem/ruby/2.6.0/bin:/home/gibbs/.gem/ruby/2.7.0/bin:${HOME}/bin:$HOME/.config/composer/vendor/bin:/home/gibbs/.local/bin"
export ELECTRON_TRASH=gio
export FBFONT=/usr/share/kbd/consolefonts/ter-216n.psf.gz

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Java
export JAVA_HOME=/usr/lib/jvm/default

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

if [ -e ~/.bashrc.aliases ] ; then
   source ~/.bashrc.aliases
fi

BROWSER=/usr/bin/chromium
EDITOR=/usr/bin/vim

# Path to the bash it configuration
export BASH_IT="/home/gibbs/.bash_it"

# Lock and Load a custom theme file.
# Leave empty to disable theming.
# location /.bash_it/themes/
export BASH_IT_THEME='powerline-naked'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

stty -ixon

# Load Bash It
source "$BASH_IT"/bash_it.sh
export PATH="$PATH:/opt/mssql-tools/bin"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Modified version where you can press
#   - CTRL-O to open with `open` command,
#   - CTRL-E or Enter key to open with the $EDITOR
fo() {
  local out file key
  IFS=$'\n' out=("$(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e)")
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
  fi
}

# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fe() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

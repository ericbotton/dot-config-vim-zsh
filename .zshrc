export EDITOR=vim
export TZ="America/New_York"
# color man
export LESS_TERMCAP_mb=$'\E[01;31m'             # begin blinking
export LESS_TERMCAP_md=$'\E[01;31m'             # begin bold
export LESS_TERMCAP_me=$'\E[0m'                 # end mode
export LESS_TERMCAP_se=$'\E[0m'                 # end standout-mode
export LESS_TERMCAP_so=$'\E[01;44;33m'          # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'                 # end underline
export LESS_TERMCAP_us=$'\E[01;32m'             # begin underline
# Aliases
alias ls='ls -v --color=auto'
alias ll='ls --group-directories-first -lhF'
alias l.='ls --group-directories-first -AdF .*'
alias ll.='ls --group-directories-first -AdlhF .*'
alias lart='ls -lArt --color=auto'
alias afile='stat -c "%x" '
alias mfile='stat -c "%y" '
alias cp='cp -vi'
alias mv='mv -vi'
alias rm='rm -vi'
alias psa='ps -eww -o "%U %p %a" | grep -v "\[.*\]"'
alias dfh='df -BM | grep /dev/sd | sort -n -k4'
alias atree='pstree -alnph'
alias rsync='rsync --progress'
alias starwars='telnet towel.blinkenlights.nl'
alias apt='sudo apt'
alias apts='sudo apt-cache search'
alias dropcaches='sudo echo 3 | sudo tee /proc/sys/vm/drop_caches'
# Functions
fregex () {
  if [[ $# -eq 1 ]]; then
    _DIR="."
    _REGEX="$1"
  elif [[ $# -eq 2 ]]; then
    _DIR="$1"
    _REGEX="$2"
  fi
  find "$_DIR" -iregex ".*$_REGEX.*"
}
whatinstalled() {
  which "$@" | xargs -r readlink -f | xargs -r dpkg -S ;
}
pstop() {
  PROC="$1"
  ps auxww | grep-v "ps auxww" | awk -v PROC="$PROC" '$0 ~ PROC { print $2 }' | xargs kill -STOP
}
pcont() {
  PROC="$1"
  psa | awk -v PROC="$PROC" '$0 ~ PROC { print $2 }' | xargs kill -CONT
}
export PATH="$PATH:$HOME/Projects/android-studio/bin"
# -----------------------------------------------------------------------------
# -*- mode: zsh; sh-indentation: 2; indent-tabs-mode: nil; sh-basic-offset: 2; -*-
# vim: ft=zsh sw=2 ts=2 et
# -----------------------------------------------------------------------------

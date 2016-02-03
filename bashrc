# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# set a fancy prompt (non-color, unless we know we "want" color)
color_prompt=yes

if [ "$color_prompt" = yes ]; then
    PS1='\[\033[01;32m\]Gandi.cli\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='Gandi.cli:\w\$ '
fi
unset color_prompt

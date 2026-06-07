# ~/.bashrc

source ~/.commonrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# Automatically cd into typed directory.
shopt -s autocd

# auto ls after cd
cd() { builtin cd "$@";ls;}

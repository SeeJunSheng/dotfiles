# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='\[\e[38;2;0;236;255m\]\u\[\e[38;2;255;153;0m\]@\[\e[38;2;0;255;133m\]\h \[\e[38;2;205;124;255m\]\w\[\e[0m\]\$ '

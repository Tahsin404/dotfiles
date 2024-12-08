#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias p='sudo pacman'
alias y='yay'
alias fetch='bestfetch'
alias f='ranger'
alias vim='nvim'
alias phone='aft-mtp-mount ~/mnt'
alias uphone='fusermount -u ~/mnt'
alias neo='cmatrix'
alias pipes='pipes.sh -p 10 -r 0'
PS1='[\u@\h \W]\$ '
eval "$(starship init bash)"
colorscript -e suckless
# colorscript -r

export PATH=$PATH:/home/xelius/.spicetify

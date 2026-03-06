#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias get='sudo pacman -Syu'
alias remove='sudo pacman -Rns'
alias yremove='yay -Rns'
alias install='yay -Syu'
alias fetch='fastfetch'
alias f='ranger'
alias vim='nvim'
alias ls='ls -lah'
alias phone='aft-mtp-mount ~/mnt'
alias uphone='fusermount -u ~/mnt'
alias neo='cmatrix'
alias restow='cd ~/dotfiles && stow -R -v -t ~ */ && cd -'
alias pipes='pipes.sh -p 10 -r 0'
PS1='[\u@\h \W]\$ '
eval "$(starship init bash)"
# colorscript -e suckless
# colorscript -r

export PATH=$PATH:/home/xelius/.spicetify
export EDITOR=nvim

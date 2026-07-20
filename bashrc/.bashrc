#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ------------------------------------
# Environment Variables & Editor
# ------------------------------------
export PATH=$PATH:/home/xelius/.spicetify
export EDITOR=nvim

# REDACTED: Please generate a new key and paste it here
export GEMINI_API_KEY="INSERT YOUR API"

# ------------------------------------
# Navigation & File Management
# ------------------------------------
alias ..='cd ..'
alias ...='cd ../..'
alias ls='ls -lah --color=auto' # Combined your two 'ls' aliases
alias grep='grep --color=auto'
alias f='ranger'

# ------------------------------------
# Safety Nets
# ------------------------------------
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# ------------------------------------
# Archive & Compression
# ------------------------------------
alias uzip='unzip'
alias urar='unrar x'
alias utar='tar -xvf'

# ------------------------------------
# Package Management (Pacman & Yay)
# ------------------------------------
alias get='sudo pacman -Syu'
alias remove='sudo pacman -Rns'
alias install='yay -Syu' # Note: This runs a full system update before installing
alias yremove='yay -Rns'
alias superupdate='sudo reflector --country Bangladesh,India,Singapore --download-timeout 10 --latest 10 --sort rate --save /etc/pacman.d/mirrorlist && yay -Syyu'
alias clean='yay -Sc' # Cleans package cache for both pacman and yay

# ------------------------------------
# Devices & Mounts
# ------------------------------------
alias phone='aft-mtp-mount ~/mnt'
alias uphone='fusermount -u ~/mnt'

# ------------------------------------
# System Info & Monitoring
# ------------------------------------
alias df='df -h'
alias free='free -h'
alias fetch='fastfetch'

# ------------------------------------
# Custom Scripts & Fun
# ------------------------------------
alias vim='nvim'
alias neo='cmatrix'
alias pipes='pipes.sh -p 10 -r 0'
alias restow='cd ~/dotfiles && stow -R -v -t ~ */ && cd -'

# ------------------------------------
# Prompt Setup (Starship)
# ------------------------------------
PS1='[\u@\h \W]\$ '
eval "$(starship init bash)"
# colorscript -e suckless
# colorscript -r

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

if [[ -f ~/.GEMINI_API_KEY ]]; then
  source ~/.GEMINI_API_KEY
fi

# ------------------------------------
# Navigation & File Management
# ------------------------------------
alias ..='cd ..'
alias ...='cd ../..'
alias ls='ls -lh --color=auto' # Combined your two 'ls' aliases
alias grep='grep --color=auto'
alias f='ranger'
delete() {
  local force_flag=""
  local recursive_flag=""

  # Loop through arguments to check for custom keywords
  while [[ "$1" =~ ^(force|folder)$ ]]; do
    if [ "$1" = "force" ]; then
      force_flag="f"
    elif [ "$1" = "folder" ]; then
      recursive_flag="r"
    fi
    shift # Remove the keyword from arguments so only the file/folder path remains
  done

  # Combine flags if any were triggered (e.g., -rf or -r)
  local flags=""
  if [ -n "$force_flag" ] || [ -n "$recursive_flag" ]; then
    flags="-${recursive_flag}${force_flag}"
  fi

  # Execute rm with the dynamic flags and the remaining target path
  if [ -n "$flags" ]; then
    rm "$flags" "$@"
  else
    rm "$@"
  fi
}

# ------------------------------------
# Safety Nets
# ------------------------------------
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# ------------------------------------
# Archive & Compression
# ------------------------------------
zipfolder() {
  zip -r "$1.zip" "$1"
}

tarfolder() {
  tar -czvf "$1.tar.gz" "$1"
}

rarfolder() {
  rar a "$1.rar" "$1"
}

alias uzip='unzip'
alias urar='unrar x'
alias utar='tar -xvf'

cpp() {
  enscript -C -Ecpp --color -o temp.ps "$1" && ps2pdf temp.ps "${1%.cpp}.pdf" && rm temp.ps
}

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

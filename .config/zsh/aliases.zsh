source /usr/share/nvm/init-nvm.sh

alias camera="vlc v4l2://:input-slave=alsa://:v4l-vdev=\"/dev/video1\""
alias k="kubectl"
alias rocminfo="/opt/rocm/bin/rocminfo"
alias ssh='kitty +kitten ssh'
alias hyprlogs='cat /tmp/hypr/$(ls -t /tmp/hypr/ | head -n 3 | tail -n 1)/hyprland.log'
alias ls='ls --color=auto'
alias l.='ls -d .*'
alias ll='ls -lah'
alias pacman='sudo pacman'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias diff='colordiff'
alias ping='ping -c 5'
alias fastping='ping -c 100 -s.2'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias rm='rm -I --preserve-root'
alias root='sudo -i'
alias su='sudo -i'
alias wget='wget -c'
alias top='atop'

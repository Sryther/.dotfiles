source /usr/share/nvm/init-nvm.sh

alias camera="vlc v4l2://:input-slave=alsa://:v4l-vdev=\"/dev/video1\""
alias k="kubectl"
alias rocminfo="/opt/rocm/bin/rocminfo"
alias ssh='kitty +kitten ssh'
alias hyprlogs='cat /tmp/hypr/$(ls -t /tmp/hypr/ | head -n 3 | tail -n 1)/hyprland.log'

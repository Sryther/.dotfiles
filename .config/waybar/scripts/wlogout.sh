wlogout -c 5 -r 5 -p layer-shell &> /dev/null

kill $(pgrep waybar) &> /dev/null
waybar &> /dev/null

#!/bin/bash

_playing_=false

for player in $(playerctl --list-all); do
    if [ "$(playerctl -p $player status)" = "Playing" ]; then
        _playing_=true
    fi
done

if [ "$_playing_" = "true" ]; then
    playerctl --all-players pause
else
    playerctl --all-players play
fi

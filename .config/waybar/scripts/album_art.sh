#!/bin/bash

album_art=$(playerctl -p spotify metadata mpris:artUrl 2> /dev/null)
album_name_and_artist=$(playerctl -p spotify metadata xesam:album 2> /dev/null)-$(playerctl -p spotify metadata xesam:artist 2> /dev/null)

mkdir -p /tmp/covers

if [ "${album_art}" = "" ] || [[ -z $album_art ]]; then
   echo "/tmp/covers/empty"
   exit 0
fi

path="/tmp/covers/${album_name_and_artist}.jpeg"

if [ -f "${path}" ]; then
    echo "${path}"
    exit 0
fi

curl -s  "${album_art}" --output "${path}"
echo "${path}"

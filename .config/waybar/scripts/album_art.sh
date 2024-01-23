#!/bin/bash
album_art=$(playerctl -p spotify metadata mpris:artUrl)
album_name_and_artist="$(playerctl -p spotify metadata xesam:album)-$(playerctl -p spotify metadata xesam:artist)"

mkdir -p /tmp/covers

if [[ -z $album_art ]]; then
   # spotify is dead, we should die too.
   echo ""
   exit 1
fi

path="/tmp/covers/${album_name_and_artist}.jpeg"

if [ -f "${path}" ]; then
    echo "${path}"
    echo "<img width=\"126\" src\"${path}\"/>"
    exit 0
fi

curl -s  "${album_art}" --output "${path}"
echo "${path}"
echo "<img width=\"126\" src=\"${path}\"/>"

#!/bin/bash

player=$1
if [ "$player" = "" ]; then
  player=spotify
fi
album_art=$(playerctl -p $player metadata mpris:artUrl 2> /dev/null)
album_name_and_artist=$(playerctl -p $player metadata xesam:album 2> /dev/null)-$(playerctl -p $player metadata xesam:artist 2> /dev/null)

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

if [[ ! "$album_art" =~ "file://" ]]; then
  curl -s "${album_art}" --output "${path}"
else
  path=$(echo $album_art | sed 's/file:\/\///')
fi

echo "${path}"

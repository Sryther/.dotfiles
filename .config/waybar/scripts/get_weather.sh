#!/usr/bin/env bash
# get_weather.sh

text=$(curl -s "wttr.in/$1?format=1")
if [[ $? == 0 ]]
then
    text=$(echo "$text" | sed -E "s/\s+/ /g")
    tooltip=$(curl -s "wttr.in/$1?format=4")
    if [[ $? == 0 ]]
    then
        tooltip=$(echo "$tooltip" | sed -E "s/\s+/ /g")
        echo "{\"text\":\"$text\", \"tooltip\":\"$tooltip\"}"
        exit
    fi
fi

echo "{\"text\":\"\", \"tooltip\":\"\"}"

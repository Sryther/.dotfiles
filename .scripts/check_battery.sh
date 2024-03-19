#!/bin/bash

BATTINFO=`acpi -b`

if [[ `echo $BATTINFO | grep Discharging` && `echo $BATTINFO | cut -f 5 -d " "` < 00:30:00 ]] ; then
    dunstify -t 10000 "Battery level critical" "${BATTINFO}"
fi

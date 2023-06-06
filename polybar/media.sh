#!/bin/bash

title=$(playerctl --player=mpd -s metadata title)
artist=$(playerctl --player=mpd -s metadata artist)
status=$(playerctl --player=mpd -s status)

# If no artist is found, just display the title
if [[ -z "$artist" ]]; then
    output="$title"
else
    output="$artist - $title"
fi

# Red if paused, white if playing, blank if nothing is playing
if [[ "$status" == "Playing" ]]; then
    echo "%{F#ebdbb2}$output%{F-}"
elif [[ "$status" == "Paused" ]]; then
    echo "%{F#fb4934}$output%{F-}"
else
    echo ""
fi

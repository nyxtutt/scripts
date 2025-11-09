#!/bin/bash
# Greeting script

# Variables
NAME=$(getent passwd $USER | cut -d: -f5 | awk '{print $1}')
TIME=$(date +"%H:%M")
CURRENT_HOUR=$(date +"%H")
TEMPERATURE=$(curl -s "wttr.in/?i&format=%t")

# Selects the greeting
if (( 10#$CURRENT_HOUR >= 5 && 10#$CURRENT_HOUR < 12 )); then
  GREETING="Good morning"
elif (( 10#$CURRENT_HOUR >= 12 && 10#$CURRENT_HOUR < 17 )); then
  GREETING="Good day"
elif (( 10#$CURRENT_HOUR >= 17 && 10#$CURRENT_HOUR < 21 )); then
  GREETING="Good evening"
else
  GREETING="Good night"
fi

# Outputs info
echo -e "$GREETING, $(gum style --bold "$NAME")!"
echo -e "It's currently $(gum style --bold "$TIME"). and it's $(gum style --bold "$TEMPERATURE") outside."
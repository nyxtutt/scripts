#!/bin/bash
# Greeting script

# Variables
NAME="Nyx"
TIME=$(date +"%H:%M")
CURRENT_HOUR=$(date +"%H")
UPDATES=$(checkupdates | wc -l)
TEMPERATURE=$(curl -s "wttr.in/dfw?format=%t")

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
echo -e "It's currently $(gum style --bold "$TIME")."
echo -e "You have $(gum style --bold "$UPDATES") updates available, and it's $(gum style --bold "$TEMPERATURE") outside."
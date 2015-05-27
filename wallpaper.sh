#!/bin/bash

#
# Script to select a random picture as the background picture from a directory of pictures

#
# Authors:
#   Srijan R. Shetty <srijan.shetty+code@gmail.com>
#

# Directory Containing Pictures
DIR="/home/srijan/Pictures/wallpapers"

# Necessary for cron to work
# export DBUS_SESSION_BUS_ADDRESS environment variable
PID=$(pgrep gnome-session)
export DBUS_SESSION_BUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS "/proc/$PID/environ" | cut -d= -f2-)

# Select a random jpg file from directory
PIC=$(ls --sort=time $DIR/*.jpg | sort -R | head -1)

# Command to set Background Image on elementary OS
gsettings set org.gnome.desktop.background picture-uri "file://$PIC"

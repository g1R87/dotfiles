#!/bin/bash

# This script runs Hollywood and keeps the terminal open until the user exits.

# 1. Lock the screen immediately (ensures security)
# Use your distribution's primary screen locker command.
# For GNOME/Pop!_OS, it's typically 'gnome-screensaver-command' or 'loginctl lock-session'.
# We use 'dm-tool lock' as a robust option in GNOME environments.
dm-tool lock

# 2. Wait a moment for the locker to engage
sleep 1

# 3. Launch the Hollywood show in a new terminal window
# -e: executes the command
# -T: sets the title
# -g: sets the geometry (optional, but looks better)
# gnome-terminal is usually available in Pop!_OS
gnome-terminal --title="HACKING IN PROGRESS" --geometry=120x40 -e "bash -c 'hollywood; exec bash'" &

# 4. Save the PID of the launched terminal
HOLLYWOOD_PID=$!

# 5. Bring the terminal window to the front (useful in i3)
wmctrl -a "HACKING IN PROGRESS"

# 6. Wait for the terminal process to finish (when the user presses F6/Ctrl+C)
wait $HOLLYWOOD_PID

# 7. Relock the screen again for security (optional, but safe)
# This step ensures the screen is locked if the user cancels the Hollywood session
# without logging in.
dm-tool lock

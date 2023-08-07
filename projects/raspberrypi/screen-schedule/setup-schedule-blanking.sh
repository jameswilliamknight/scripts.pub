#!/usr/bin/env bash

# Check if xset exists
if ! command -v xset &> /dev/null; then
    echo "xset could not be found. Please ensure you're running this on a system with X installed."
    exit 1
fi

# Commands to keep the screen always on
cmd_energy_save="xset s 120"

# Commands to enable screensaver and power-saving mode
cmd_always_on="xset s reset && xset s off"

# Add cron jobs

# Remove any existing jobs related to xset (to avoid duplicates)
(crontab -l | grep -v 'xset' | crontab -)

# Add the new jobs
(crontab -l ; echo "0 23 * * * $cmd_energy_save") | crontab -
(crontab -l ; echo "30 6 * * * $cmd_always_on") | crontab -

echo "Cron jobs set up successfully!"

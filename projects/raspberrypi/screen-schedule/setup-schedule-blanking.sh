#!/usr/bin/env bash

# Check if xset exists
if ! command -v xset &> /dev/null; then
    echo "xset could not be found. Please ensure you're running this on a system with X installed."
    exit 1
fi

# Commands to keep the screen always on
on_cmd="xset s off && xset -dpms"

# Commands to enable screensaver and power-saving mode
off_cmd="xset +dpms && xset s on"

# Add cron jobs

# Remove any existing jobs related to xset (to avoid duplicates)
(crontab -l | grep -v 'xset' | crontab -)

# Add the new jobs
(crontab -l ; echo "0 23 * * * $on_cmd") | crontab -
(crontab -l ; echo "30 6 * * * $off_cmd") | crontab -

echo "Cron jobs set up successfully!"

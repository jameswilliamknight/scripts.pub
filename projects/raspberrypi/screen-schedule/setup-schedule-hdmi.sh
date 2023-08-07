#!/usr/bin/env bash

# Check if vcgencmd exists
if ! command -v vcgencmd &> /dev/null; then
    echo "vcgencmd could not be found. Please ensure you're running this on a Raspberry Pi with Pi OS."
    exit 1
fi

# Add cron jobs

# Remove any existing jobs related to display_power (to avoid duplicates)
(crontab -l | grep -v 'vcgencmd display_power' | crontab -)

# Add the new jobs
(crontab -l ; echo "0 23 * * * /usr/bin/vcgencmd display_power 0") | crontab -
(crontab -l ; echo "30 6 * * * /usr/bin/vcgencmd display_power 1") | crontab -

echo "Cron jobs set up successfully!"

#!/bin/bash

# example
# . ~/src/scripts.pub/Bash/bin/ubuntu-budgie/update-wallpaper.sh ~/gDrive/Wallpapers/Space/cbECbBb.jpg 



sourceimage="${1}"
destfolder="/usr/share/backgrounds"
dest="${destfolder}/Xplo_by_Hugo_Cliff.png"

sudo cp -f $sourceimage $dest

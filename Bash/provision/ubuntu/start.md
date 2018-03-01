# Laptop setup

Setting up Ubuntu from scratch on hardware.

```sh
cd "${HOME}" ; mkdir src ; cd src ; mkdir _provision ; cd _provision
# ${HOME}/src/_provision
provisionpuburl="https://github.com/jameswilliamknight/scripts.pub/raw/master/Bash/provision"
wget "${provisionpuburl}/ubuntu/github-bootstrap.sh"
wget "${provisionpuburl}/add-github-pubkey.sh"
# chmod +x github-bootstrap.sh ; chmod +x add-github-pubkey.sh
mkdir ubuntu ; cd ubuntu
# ${HOME}/src/_provision/ubuntu
wget "${provisionpuburl}/ubuntu/bootstrapper.sh"
wget "${provisionpuburl}/ubuntu/start.md"
chmod +x bootstrapper.sh
#
# TODO: Test. Also, don't run dodgy scripts you've found on the internet, you imbecile.
. bootstrapper.sh
```


## Introduction

I have recently freed up my personal laptop and have the chance to use it as a Linux daily driver (mostly for home use).


## Documentation Checklist / TODO / Meta

These notes are to improve the document itself.

1. Automate this process
    1. Design a **bootstrapper** script that is:
        - generic
        - hosted on my website
        - surrounded by the bare minimum documentation
        - bare minimum of dependencies
        - may bootstrap higher level scripting languages, e.g. Python.
1. Link to this documentation from my [personal website](www.jknightdev.com).


## Script Run Order

- `Scripts.pub/Bash/provision/ubuntu/bootstrapper.sh` - run from a fresh ubuntu install
- `Scripts/Bash/provision/ubuntu/installer.sh` - installer for third party software and personal configurations (not yet included in scripts.pub.git)


## Raw log of events

1. Using Dell XPS 9550 with an i7 6700HQ, 16gb RAM and 512 NVMe SSD.
1. UEFI BIOS tweaks
    1. Disabled Secure Boot
    1. Changed RAID to AHCI (allows Linux to detect laptop hard disk)
1. Installed Ubuntu GNOME 17.04 x64
    1. Encrypted home directory
    1. Did not install updates and 3rd party software
1. Started writing this documentation once I didn't know which of my scripts to use.
1. Moved documentation to public scripts repository on github.

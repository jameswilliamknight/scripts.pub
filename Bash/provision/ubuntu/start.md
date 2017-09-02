# Laptop setup

Setting up Ubuntu from scratch on hardware.

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
1. Host this documentation and relevant (cleansed) scripts on my website.
    - move relevant files to `github.com:jameswilliamknight/Scripts.pub.git`

## Script Run Order

- `Scripts/Bash/provision/ubuntu/bootstrapper.sh` - run from a fresh ubuntu install
- `Scripts/Bash/provision/ubuntu/installer.sh` - installer for third party software and personal configurations

## Raw log of events

1. Using Dell XPS 9550 with an i7 6700HQ, 16gb RAM and 512 NVMe SSD.
1. UEFI BIOS tweaks
    1. Disabled Secure Boot
    1. Changed RAID to AHCI (allows Linux to detect laptop hard disk)
1. Installed Ubuntu GNOME 17.04 x64
    1. Encrypted home directory
    1. Did not install updates and 3rd party software
1. Started writing this documentation once I didn't know which of my scripts to use.

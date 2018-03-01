# Laptop setup

Setting up Ubuntu from scratch on hardware or a virtual machine.

## Interactive CLI Setup

```sh
# Warning: running random commands you find lying around,
#          on the internet without understanding them can
#          be a highly dangerous proposition indeed.
#          Also, it's not tested yet ✌️
#
# Refresh this page before copying command:
wget -q "https://github.com/jameswilliamknight/scripts.pub/raw/master/Bash/provision/ubuntu/web-bootstrapper.sh" --no-cache ; chmod +x web-bootstrapper.sh ; source web-bootstrapper.sh
```
[see: web-bootstrapper.sh](https://github.com/jameswilliamknight/scripts.pub/blob/master/Bash/provision/ubuntu/web-bootstrapper.sh)

## Example one-liner

- **90% Automated**

```sh
wget -q "https://github.com/jameswilliamknight/scripts.pub/raw/master/Bash/provision/ubuntu/web-bootstrapper.sh" --no-cache ; chmod +x web-bootstrapper.sh ; source web-bootstrapper.sh  --token "7305d1f3e18d1f4cd20bc6bbe448e6ec106e757c" --email "myemail@gmail.com" --pc-name "my-vm-ubuntu-1804-nightly" --github-username "mygithubusername" --github-password "mygithubpassword" --passphrase "this-feature-is-in-progress" ; cd "${HOME}/src/" ; git clone git@github.com:mygithubusername/scripts.git
```


## Documentation Checklist / TODOs

1. Link to this documentation from my [personal website](www.jknightdev.com).


## Dell XPS 15 9550

1. UEFI BIOS tweaks
    1. Disabled Secure Boot
    1. Changed RAID to AHCI (allows Linux to detect laptop hard disk)
1. Installed Ubuntu
    1. Encrypted home directory
    1. Did not install updates and 3rd party software

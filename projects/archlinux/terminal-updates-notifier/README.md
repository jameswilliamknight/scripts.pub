# Terminal Updates Notification in Arch Linux

> ⚠️ Heavy Disclaimer, this hasn't been tested yet ⚠️

## Install

```sh
source ./install.sh
```

## TODO

### Symbolic Link

```
# add to script
ln -sf ./bin/download-packages /usr/bin/local/download-packages
ln -sf ./bin/is-offline-updates-ready /usr/bin/local/is-offline-updates-ready

# update cron job to point towards these
```
#!/usr/bin/env bash
#
# Summary
#
#   generates a user ssh key via an experimental process. Extracted to test.

P="expect"
for P; do
    dpkg -s "$P" >/dev/null 2>&1 && {
        # echo "$P is installed."
        exit 0;
    } || {
        # echo "$P is not installed."
        exit 1;
    }
done

email=$1
passphrase=$2

DATE=`date '+%Y-%m-%d %H:%M:%S'`
printf "Date: ${DATE}\nHome: ${HOME}\n\n" >> ~/bootstrap.log

# Creating RSA Key Pair
#set -x
XYZ=$(expect -c "
spawn ssh-keygen -t rsa -b 4096 -C \"$email\" -f \"${HOME}/.ssh/id_rsa\"
expect \"Enter passphrase (empty for no passphrase):\"
send \"${passphrase}\r\"
expect \"Enter same passphrase again:\"
send \"${passphrase}\r\"
")
#set +x

privatekeyfile="${HOME}/.ssh/id_rsa"
if [ ! -f "${privatekeyfile}" ]; then
    logthis "private key file='${privatekeyfile}' failed to create. Aborting"
    return 1;
fi

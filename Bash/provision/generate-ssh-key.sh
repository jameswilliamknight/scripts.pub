#!/usr/bin/env bash
#
# Summary
#
#   generates a user ssh key via an experimental process. Extracted to test.
if [ ! -f "logger.sh" ]; then
    me=`basename "$0"`
    errormessage="critical error in '${me}': missing: logger.sh"
    logthis "${errormessage}"
    logthis "${errormessage}" >> "${HOME}/bootstrap.error.log"
    return 1;
fi
. logger.sh ; loggerstarted "scripts.pub\Bash\provision\generate-ssh-key.sh"

# P="expect"
# for P; do
#     dpkg -s "$P" >/dev/null 2>&1 && {
#         logthis "$P is installed."
#         #exit 0;
#     } || {
#         logthis "$P is not installed. exiting."
#         exit 1;
#     }
# done

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

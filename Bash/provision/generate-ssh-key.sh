email=$1
passphrase=$2

DATE=`date '+%Y-%m-%d %H:%M:%S'`
printf "Date: ${DATE}\nHome: ${HOME}\n\n" >> ~/bootstrap.log

# Creating RSA Key Pair
set -x
XYZ=$(expect -c "
spawn ssh-keygen -t rsa -b 4096 -C \"$email\" -f \"${HOME}/.ssh/id_rsa\"
expect \"Enter passphrase (empty for no passphrase):\"
send \"${passphrase}\r\"
expect \"Enter same passphrase again:\"
send \"${passphrase}\r\"
")

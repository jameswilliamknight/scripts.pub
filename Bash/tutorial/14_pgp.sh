#!/bin/bash
#
# Summary
#   Learning how to generate a PGP (Pretty Good Privacy) Key.
#   https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Security_Guide/sect-Security_Guide-Encryption-GPG-Creating_GPG_Keys_using_the_Command_Line.html

sudo apt install -y gpa gnupg2
#
# Use this one for all the options.
gpg2 --full-gen-key
#
#gpg2 --gen-key

#james-VirtualBox% gpg2 --full-gen-key
#gpg (GnuPG) 2.1.15; Copyright (C) 2016 Free Software Foundation, Inc.
#This is free software: you are free to change and redistribute it.
#There is NO WARRANTY, to the extent permitted by law.
#
#Please select what kind of key you want:
#   (1) RSA and RSA (default)
#   (2) DSA and Elgamal
#   (3) DSA (sign only)
#   (4) RSA (sign only)
#Your selection? 1
#RSA keys may be between 1024 and 4096 bits long.
#What keysize do you want? (2048) 2048
#Requested keysize is 2048 bits
#Please specify how long the key should be valid.
#         0 = key does not expire
#      <n>  = key expires in n days
#      <n>w = key expires in n weeks
#      <n>m = key expires in n months
#      <n>y = key expires in n years
#Key is valid for? (0) 1y
#Key expires at Thu 20 Sep 2018 18:42:08 NZST
#Is this correct? (y/N) y
#
#GnuPG needs to construct a user ID to identify your key.
#
#Real name: James
#Email address: j3k.2004@gmail.com
#Comment: This is a test
#You selected this USER-ID:
#    "James (This is a test) <j3k.2004@gmail.com>"
#
#Change (N)ame, (C)omment, (E)mail or (O)kay/(Q)uit? O
#We need to generate a lot of random bytes. It is a good idea to perform
#some other action (type on the keyboard, move the mouse, utilize the
#disks) during the prime generation; this gives the random number
#generator a better chance to gain enough entropy.
#We need to generate a lot of random bytes. It is a good idea to perform
#some other action (type on the keyboard, move the mouse, utilize the
#disks) during the prime generation; this gives the random number
#generator a better chance to gain enough entropy.
#gpg: key 667B767DB3358F2F marked as ultimately trusted
#gpg: revocation certificate stored as '/home/james/.gnupg/openpgp-revocs.d/4803624A50D1D8030A0F03EB667B767DB3358F2F.rev'
#public and secret key created and signed.
#
#pub   rsa2048 2017-09-20 [SC] [expires: 2018-09-20]
#      4803624A50D1D8030A0F03EB667B767DB3358F2F
#uid                      James (This is a test) <j3k.2004@gmail.com>
#sub   rsa2048 2017-09-20 [E] [expires: 2018-09-20]
#
#james-VirtualBox%

cat /home/james/.gnupg/openpgp-revocs.d/4803624A50D1D8030A0F03EB667B767DB3358F2F.rev

#james-VirtualBox% cat /home/james/.gnupg/openpgp-revocs.d/4803624A50D1D8030A0F03EB667B767DB3358F2F.rev
#This is a revocation certificate for the OpenPGP key:
#
#pub   rsa2048 2017-09-20 [S] [expires: 2018-09-20]
#      4803624A50D1D8030A0F03EB667B767DB3358F2F
#uid          James (This is a test) <j3k.2004@gmail.com>
#
#A revocation certificate is a kind of "kill switch" to publicly
#declare that a key shall not anymore be used.  It is not possible
#to retract such a revocation certificate once it has been published.
#
#Use it to revoke this key in case of a compromise or loss of
#the secret key.  However, if the secret key is still accessible,
#it is better to generate a new revocation certificate and give
#a reason for the revocation.  For details see the description of
#of the gpg command "--gen-revoke" in the GnuPG manual.
#
#To avoid an accidental use of this file, a colon has been inserted
#before the 5 dashes below.  Remove this colon with a text editor
#before importing and publishing this revocation certificate.
#
#:-----BEGIN PGP PUBLIC KEY BLOCK-----
#Comment: This is a revocation certificate
#
#iQEfBCABCAAJBQJZwg32Ah0AAAoJEGZ7dn2zNY8v3yYH/RGrBk3RNaSWqwNvqXjh
#5Dy/22gaXsfKH9DfHZFZifgEHlFsCV/HIwfHvs9iNNrTWu3wmVWHmkVHwDjktNYW
#zOF0ox2Z3tB2al1e1iZlYhW9DsXkr+2FYSvKTLH6rSATCCM2bKyqJMtDWHtBP/34
#+xw3z0IrHvDKpyXoySxHn0teyZ/Of1pW8z5jmM22TnE48h39vEBn+p97fGi+FpVX
#TF5ELiYCiVf11f45uMgpstHMTVBo4LtSRHEhSyNN81BSln6ql0v3DVzESJ9Y7UDc
#6oesEVXhrfmTcRbZgjl96sggRAcm8btyNVTF+1aH2yWydzo0HZA60Z46K5cURoOu
#Mng=
#=Zvvz
#-----END PGP PUBLIC KEY BLOCK-----
#james-VirtualBox%

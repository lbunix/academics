#!/bin/bash

# GLOBALS
date="$(date +%m-%d-%Y_%H-%M-%S)"

remoteUser="loc"
remoteAddress="192.168.101.165"
sshKey="/home/loc/.ssh/rsync.key"

# GLOBALS

backupDirectories=(
    "/etc"
    "/home"
    "/root"
    "/var"
)

backup_folder="/home/$remoteUser/Documents/backups/$date"

/usr/bin/ssh -i "$sshKey" -o BatchMode=yes "${remoteUser}@${remoteAddress}" "mkdir -p -- '$backup_folder'"

/usr/bin/rsync -ae "/usr/bin/ssh -i $sshKey -o BatchMode=yes" "${backupDirectories[@]}" "${remoteUser}@${remoteAddress}:${backup_folder}/" > /dev/null

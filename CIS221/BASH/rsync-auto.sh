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

ssh -i "$sshKey" -o BatchMode=yes "${remoteUser}@${remoteAddress}" "mkdir -p -- '$backup_folder'"

rsync -ae "ssh -i /$HOME/.ssh/rsync.key" "${backupDirectories[@]}" "${remoteUser}@${remoteAddress}:${backup_folder}/" > /dev/null

#!/bin/bash

# GLOBALS
date="$(date +%m-%d-%Y_%H-%M-%S)"

# GLOBALS

while :
do
    echo -e "\n========== rsync =========="
    echo -en "\nWhat is the remote username? "
    read remoteUser

    echo -en "\nWhat is the IP address of the remote server? "
    read remoteAddress

    if [[ -z "$remoteUser" || -z "$remoteAddress" ]]
    then
        echo -e "\nIncomplete entry. Please enter all fields."
        continue
    else
        break
    fi
done

backupDirectories=(
    "/etc"
    "/home"
    "/root"
    "/var"
)

backup_folder="/home/$remoteUser/Documents/backups/$date"

ssh "${remoteUser}@${remoteAddress}" "mkdir -p -- '$backup_folder'"

if [[ $? -ne 0 ]]
then
    echo -e "\nRemote server connection failed."
    exit 1
fi

echo -e "\nStarting backup.."

sudo rsync -zavh -e ssh "${backupDirectories[@]}" "${remoteUser}@${remoteAddress}:${backup_folder}/" > /dev/null

if [[ $? -eq 0 ]]
then
    echo -e "\nBackup successful!"
else
    echo -e "\nBackup failed."
    exit 1
fi

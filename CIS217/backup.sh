#!/bin/bash

backupDate="$(date +%m-%d-%Y_%H-%M-%S)"
userHome="/home/$USER"
backupDir="${userHome}/backups"
backupFinal="${USER}_Backup_${backupDate}.tar.gz"

echo -e "\n## Starting backup of user: $USER ##"
sleep 1

if [ ! -d "$backupDir" ]
then

mkdir "$backupDir"
chmod 700 "$backupDir"

fi

tar -czf "${backupDir}/${backupFinal}" -C "$userHome" .

echo -e "\nBackup process complete."
echo -e "\nBackup created: $backupFinal\n"

ls -lh "${backupDir}/${backupFinal}"

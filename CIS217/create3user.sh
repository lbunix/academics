#!/bin/bash

baseNum=0
username="user"
pass="temp"

while [ "$baseNum" -le 3 ]
do
  echo -e "\nCreating users..."
  sleep 2
  userCreated="${username}${baseNum}"
  passCreated="${pass}${baseNum}"

  sudo useradd -m "$userCreated"
  echo "${userCreated}:${passCreated}" | sudo chpasswd
  echo -e "\nUser create: ${userCreated} with password: ${passCreated}"
  ((baseNum++))

done

echo -e "\nCompleted user creation."

echo -e "\nWould you like to view the created users?(y/n) "
read ANSWER

case $ANSWER in
y | Y ) echo -e "\nBelow is the list of users created:\n"
	tail /etc/passwd
	exit 0
	;;
n | N ) echo -e "\nOkay goodbye."
	exit 0
	;;
* )	echo -e "Error:Error:Error. Ending prompt."
	exit 0
	;;
esac

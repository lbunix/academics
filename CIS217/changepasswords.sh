#!/bin/bash

sessionQuit="If you would like to quit session, please input (q/Q). "

while :
do
echo -e "\nHere is a list of users: \n"
echo -e "COMMENCING TAIL /etc/passwd:\n============================\n"
tail /etc/passwd

echo -e "\nWhich user's password would you like to modify? \n"
echo -e "${sessionQuit}"
read entry

	if [[ "${entry}" = "q" || "${entry}" = "Q" ]]
	then
	  echo -e "\n\nEnding session. Good bye"
	  exit 0
	fi

	echo -en "\nYou have submitted ${entry}. Is this correct (y/n)? "
	read confirm

	while :
	do
		case "${confirm}" in
		y|Y )
		  echo -e "\nGreat."
		  sudo passwd "${entry}"
		  sleep 1
		  echo -e "\n\nAccount ${entry}'s password has been modified.\n"
		  sleep 1
		  break
		;;
		n|N )
		  echo -e "\nPlease corrct the submission\n"
		  break
		;;
		* )
		  echo -e "\nIncorrect submission.\n"
		  break
		;;
		esac
	done
done


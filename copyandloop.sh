#!/bin/bash

### FILE COPYING SCRIPT

echo -e "\n\n======================== NOW COMMENCING FILE COPY SCRIPT ========================\n"

baseNum=1
sessionQuit="If you would like to quit session, please input (q/Q)."
fileSearch=$(ls -p --hide='*.sh' | grep -v / | xargs echo)
folderSearch=$(ls -d */ --hide='*.sh' | xargs echo)

echo -en "Within this directory, please tell me which file you'd like to copy: ${fileSearch}\nFile selected: "
read fileSelect

while :
do

  if [ "${fileSelect}" = "q" ]
  then
    echo -e "Ending session. Good bye"
    exit 0
  fi

  case "${fileSearch}" in
*"${fileSelect}"* )
	echo -en "You've selected ${fileSelect}. Is this correct (y/n)? "
	read confirm

	while :
	do
	  case "${confirm}" in
	    y|Y)
	      echo -en "\nGreat, which folder would you like to copy this to? ${folderSearch}\nFolder selected: "
	      read confirmCopy

	      finalFile="${fileSelect}-$baseNum"

	      if [ ! -d "${confirmCopy}" ]
	      then
	        mkdir "${confirmCopy}"
	      fi

              echo -e "\nAwesome. I have copied your file over to your requested folder: ${confirmCopy}"

              while [ -f "${confirmCopy}/${finalFile}" ]
              do
                ((baseNum++))
              finalFile="${fileSelect}-$baseNum"
              done

              cp "$fileSelect" "${confirmCopy}/${finalFile}"
	      break 2
	    ;;
	    n|N)
	      echo -en "\n${sessionQuit} Otherwise, please re-enter the correct filename (${fileSearch}): "
	      read -r fileSelect
	      break
	    ;;
	    q|Q)
	      echo "Ending session. Good bye."
	      exit 0
	    ;;
	    * )
	      echo -e "\nInvalid input. Please try again."
	      exit 0
	    ;;
	  esac
	done
  ;;
  * )
    echo -en "\nThat file does not exist. \n${sessionQuit} Otherwise, input the correct file name: "
    read -r fileSelect
  esac
done

### USER CREATION LOOPS

sleep 1
echo -e "\n\n======================== NOW COMMENCING USER CREATION LOOP SCRIPT ========================\n"
sleep 1

users="CIS215user."
pass="temp"

echo -e "\nI will now commence the creation of 10 user accounts with passwords."
sleep 2
echo -e "Loading...\n"
sleep 1

while [ "$baseNum" -le 10 ]
do
  userCreated="${users}${baseNum}"
  passCreated="${pass}${baseNum}"

  sudo useradd -m "$userCreated"
  echo "${userCreated}:${passCreated}" | sudo chpasswd
  echo -e "I have created the user: ${userCreated} on this machine with password: ${passCreated}"
  ((baseNum++))
done

echo -e "\nBelow, we can tail /etc/passwd to confirm this worked.\n"
tail /etc/passwd
sleep 2

### CUSTOM USER DELETION SCRIPT

sleep 1
echo -e "\n\n======================== NOW COMMENCING USER DELETION SCRIPT ========================\n"
sleep 1

users="CIS215user."

sleep 1
echo -en "\nNow that the 10 users have been created, would you like to remove them from the system (y/n)? "
read confirmDel

while :
do
  case $confirmDel in
  y|Y )
	echo -en "\nYou've chosen the option for ${users}* to be searched for and destroyed.\nPlease confirm that this is correct (y/n): "
	read confirmSelect

	case $confirmSelect in
	y|Y )
	  echo -e "\nSounds good, let's go ahead and remove the users."
	  echo -e "\nDeleting..."
	  sleep 2
	  echo -e "\nRemoving...\n"
	  sleep 1

	  for n in {1..10};
	  do
	  num="${users}${n}"
	  sudo deluser --remove-home "${num}"
	  done

	  echo -e "\n\nCompleted. All ${users} have been successfully removed."
	  break
	;;
	n|N )
	  echo -e "Whoa there, this is just homework. This wizard won't be deleting anything else.\nI'm skipping this script!"
	  break
	;;
	* )
	  echo -e "You have chosen to be nonsensical-- Good bye!"
          break
	esac

  ;;
  n|N )
	echo -e "That's okay, we can return back to this script to rid of those accounts!"
	break
  ;;
  * )
	echo -e "You have chosen to be nonsensical-- Good bye!"
	break
  esac
done

echo -e "\nBelow, we can tail /etc/passwd again to confirm that this worked.\n"
tail /etc/passwd
sleep 2

### SIMPLE CUSTOM

sleep 1
echo -e "\n\n======================== NOW COMMENCING ICE CREAM SCRIPT ========================\n\n"
sleep 1

echo -en "Anyways. What's your name? "
read name

echo -en "\nAnd what is your favorite ice cream? "
read iceCream

faveFolder="${name}'s favorite ice cream"
otherIceCream=("Chocolate" "Vanilla" "Napoleon" "Rocky Road")

echo -e "\nCool! I saved your favorite ice cream in a file under a new folder called: ${faveFolder}"
sleep 1
echo -e "\nSurprise! There are other ice cream on the list as well :)"

if [ ! -d "${faveFolder}" ]
then
  mkdir "${faveFolder}"
fi

echo "${otherIceCream[@]}" >> "${faveFolder}/ice_cream_list.txt"
echo "${iceCream}" >> "${faveFolder}/ice_cream_list.txt"

echo -e "\nLet's see what's inside!\n"
cat "${faveFolder}/ice_cream_list.txt"

sleep 1
echo -e "\n\n======================== NOW COMMENCING THANK YOU MESSAGE  ========================\n"

echo -e "Thanks for running this massive script!\n"

exit 0


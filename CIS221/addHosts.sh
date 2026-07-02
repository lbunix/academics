#!/bin/bash

octect='(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9][0-9]?)'

echo -en "==========\nAppend /etc/hosts Script\n==========\n"

echo -en "\nInput an IP that you'd like to add to /etc/hosts: "
read ipEntry

while :
do
  if [[ "$ipEntry" =~ ^$octect\.$octect\.$octet\.$octect$ ]]
  then
      echo -e "\nPlease input a correct IP."
      continue
  else
      break
  fi
done

while :
do
  echo -en "\nInput the hostname to the IP: "
  read hostName

  echo -en "\nPlease confirm if the hostname is correct, "$hostName". \n(y|Y) or (n|N): "
  read hostConfirm

  case "$hostConfirm" in
      y|Y)
	  echo -e "\nLet's confirm if that IP is not already in the file."

	  if awk -v ip="$ipEntry" '$1 == ip { found=1 } END { exit !found }' /etc/hosts
	  then
	      echo -e "\nThe IP already exists in /etc/hosts."
	      continue
	  else
	      echo -e "\nI will go ahead and add the IP and hostname to /etc/hosts"
	      break
	  fi
	 ;;
      n|N)
	  echo -e "\nPlease re-enter the hostname."
	  continue
	 ;;
       *)
	  echo -e "\nInvalid entry. Please try again."
	  continue
	 ;;
  esac
done

echo "$ipEntry $hostName" | sudo tee -a /etc/hosts > /dev/null
echo -e "\nYour entry has successfully been added to /etc/hosts."

cat "/etc/hosts"

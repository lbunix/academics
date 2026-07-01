#!/bin/bash

baseFolder="../Lab 1/"

echo -en "==========================\nNAME PARSER\n=======================\n"

echo -en "\nHere are the files from the previous assignment:\n"
ls "$baseFolder"

while true
do

echo -e "\nWhich file would you like to search in?"

read search

  if [[ "$search" == "q" || "$search" == "Q" ]]
  then
    echo -e "Ending session."
    exit 0
  fi

fileSearch=${search}
finalSearch="${baseFolder}${fileSearch}"

  if [ ! -f "${finalSearch}" ]
  then
    echo -e "\nThat file does not exist. Please enter a valid entry."
    continue
  fi

echo -e "\nWhat name would you like to look up? "

read search2

  if [[ "$search2" == "q" || "$search2" == "Q" ]]
  then
    echo -e "Ending session."
    exit 0
  fi

  if [ -z "$search2" ]
  then
    echo -e "\nPlease enter a valid entry."
    continue
  fi

nameSearch=${search2}

echo -e "\nResults:"
grep -iF -- "$nameSearch" "$finalSearch"

echo -en "\nIf your session is satisfied, in the next prompt please enter q or Q\n"

done

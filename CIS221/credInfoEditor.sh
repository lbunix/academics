#!/bin/bash

baseFolder="../Lab 1/"

echo -e "==========================\nNAME EDITOR\n=======================\n"

echo -e "\nHere are the files from the previous assignment:\n"
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

    break
done

while true
do

  echo -e "\nWould you like to remove an entry (r|R), add an entry (a|A), or quit session (q|Q)?\n"
  cat "${finalSearch}"
  echo -en "\n(?): "
  read entry

  entrySubmit=${entry}

  case "${entrySubmit}" in
    r|R)

    while true
    do

      echo -e "\nWhich lines would you like to remove?\n"
      cat -n "${finalSearch}"
      read entryRemove

      if [[ ! "$entryRemove" =~ ^[0-9]+([[:space:]][0-9]+)*$ ]]
      then
	  echo -e "\nInvalid entry. Numbers only."
	  continue
      fi

      sedEntry=()

      for num in $entryRemove
      do
	sedEntry+=(-e "${num}d")
      done

      sed -i "${sedEntry[@]}" "$finalSearch"

      echo -e "\nThe selected line(s) have been removed:\n"
      tail -n 10 "${finalSearch}"
      break
    done
        ;;

    a|A)

      echo -en "\nPlease enter the person's full name: "
      read name

      upperName=""

      for word in $name
      do
	word="${word^}"
	upperName="${upperName:+$upperName }$word"
      done

	while true
	do

          echo -en "\nPlease enter the person's card type (Visa, American Express, Mastercard, Discover): "
          read type

	  case "$type" in
	      Visa|"American Express"|Mastercard|Discover)
		  break
		  ;;
	      * )
		  echo -e "\nInvalid Entry, please input the correct card type."
		  continue
		  ;;
	  esac
	done

	while true
	do

          echo -en "\nPlease enter the complete card number (1111 222222 33333): "
          read cardNumber

          if [[ "$cardNumber" =~ ^[0-9]{4}[[:space:]][0-9]{6}[[:space:]][0-9]{5}$ ]]
          then
	      break
          else
	      echo -e "\nInvalid card number. Format: 4 digits space 6 digits space 5 digits."
	      continue
          fi
	done

	echo "$upperName $type $cardNumber" >> "$finalSearch"
	echo -e "Entry Added."

	tail -n 5 "$finalSearch"
        ;;

    q|Q)
      echo -e "Ending session."
      exit 0
        ;;
     * )
        echo -en "\nInvalid input. Please try again."
        continue
  esac
done

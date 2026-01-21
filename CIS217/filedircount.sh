#!/bin/bash

list=$(ls /)

echo -e "Let's count the FILES of a directory in the ROOT.\n"

while :
do

	while :
	do

		echo -e "Please select a folder from the list below:\n"
		echo "${list}"
		echo -en "\nFolder selection: "
		read fileSelect

		if [ ! -d "/${fileSelect}" ]
		then
			echo -e "\nThe directory you have chosen does not exist. Input a valid folder."
			break
		else
			echo -e "You have selected: ${fileSelect}\n"
			ls /"${fileSelect}" | echo -e "There are: $(wc -l) files in ${fileSelect}\n"
			fileCount=$(find "/${fileSelect}" -type f | wc -l)
			break 2
		fi
	done
done

echo -e "Let's count the SUBDIRECTORIES of a directory in the ROOT.\n"

while :
do

	while :
	do

		echo -e "Please select a folder from the list below:\n"
		echo "${list}"
		echo -en "\nFolder Selection: "
		read dirSelect


		if [ ! -d "/${dirSelect}" ]
		then
	                echo -e "\nThe directory you have chosen does not exist. Input a valid folder."
	                break
		else
	                echo -e "You have selected: ${dirSelect}\n"
	                ls /"${dirSelect}"/ | echo -e "There are: $(wc -l) folders in ${dirSelect}"
	                dirCount=$(find "/${dirSelect}" -type d | wc -l)
	                break 2
		fi
	done
done

echo -e "\n==========================================================================="

echo -e "\nLet's add the total of the files in the first selection and the total of the subdirectories in the second selection.\n"
echo -e "\nCalculating...\n"
totalCount=$((fileCount + dirCount))
echo -e "\nYour total count is: ${totalCount}\n"

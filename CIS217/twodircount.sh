#!/bin/bash

list=$(ls /)

echo -e "Let's count the files and subdirectories of one directory in the ROOT.\n"

while :
do

	while :
	do

		echo -e "Please select a folder from the list below:\n"
		echo "${list}"
		echo -en "\nFolder selection: "
		read dir1Select

		if [ ! -d "/${dir1Select}" ]
		then
			echo -e "\nThe directory you have chosen does not exist. Input a valid folder."
			break
		else
			echo -e "You have selected: ${dir1Select}\n\n"
			dir1Count=$(find "/${dir1Select}" -type d 2>/dev/null | wc -l)
			file1Count=$(find "/${dir1Select}" -type f 2>/dev/null | wc -l)
			echo -e "There are ${dir1Count} directories in /${dir1Select}\n"
			echo -e "There are ${file1Count} files in /${dir1Select}\n"
			break 2
		fi
	done
done

echo -e "\nLet's count the files and subdirectories of ANOTHER directory in the ROOT.\n"

while :
do

	while :
	do

		echo -e "Please select a folder from the list below:\n"
		echo "${list}"
		echo -en "\nFolder Selection: "
		read dir2Select


		if [ ! -d "/${dir2Select}" ]
		then
	                echo -e "\nThe directory you have chosen does not exist. Input a valid folder."
	                break
		else
	                echo -e "You have selected: ${dir2Select}\n\n"
                        dir2Count=$(find "/${dir2Select}" -type d 2>/dev/null | wc -l)
                        file2Count=$(find "/${dir2Select}" -type f 2>/dev/null | wc -l)
                        echo -e "There are ${dir2Count} directories in /${dir2Select}\n"
                        echo -e "There are ${file2Count} files in /${dir2Select}\n"
	                break 2
		fi
	done
done

echo -e "\n==========================================================================="

echo -e "\nLet's add the total of the files in the first selection and the total of the subdirectories in the second selection.\n"
echo -e "\nCalculating...\n"
totaldirCount=$((dir1Count + dir2Count))
totalfileCount=$((file1Count + file2Count))
echo -e "\nYour total file count is: ${totalfileCount}\n"
echo -e "\nYour total directory count is: ${totaldirCount}\n"

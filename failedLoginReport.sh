#!/bin/bash

mainDir="results"
baseFile="file"
baseNum=1
finalFile="$baseFile-$baseNum"
logs="/var/log/auth.log"
words="failed|invalid|authentication failure"
match=$(sudo grep -Ei -c "$words" "$logs")

echo -en "Please input your name: "
read user

echo -e "Thanks ${user}! I will go ahead and process that for you."
echo -en "\nProcessing..."
    sleep 1

if [ ! -d "$mainDir" ]
then
  mkdir ${mainDir}
fi

while [ -f  "${mainDir}/${finalFile}" ]
do
  ((baseNum++))
  finalFile="$baseFile-$baseNum"
done

if [ $match -gt 1 ]
then
  echo -e "Hello ${user}. Today's date is $(date +"%m-%d-%Y").\nThere were exactly $match failed attempts." > ${mainDir}/${finalFile}
elif [ $match -eq 1 ]
then
  echo -e "Hello ${user}. Today's date is $(date +"%m-%d-%Y").\nThere was only 1 failed attempt!" > ${mainDir}/${finalFile}
else
  echo -e "Hello ${user}. Today's date is $(date +"%m-%d-%Y").\nNo login attempts failed has been detected!" > ${mainDir}/${finalFile}
fi

echo -e "\nI have gone ahead and created the results file for you under folder named: results!"
sleep 1
echo -e "\nHave a good day!\n"

exit 0

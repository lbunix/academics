#!/bin/bash

startNum=$0
RANDOM=$$

while :
do
    echo -en "\nWhat's the max number you'd like to guess against the machine? "
    read maxGuess

    if [[ ! $maxGuess =~ ^[0-9]+$ ]];
    then
        echo ""
        echo "Incorrect input. Please input a number."
        continue

    else
        break
    fi
done

while :
do
    echo -en "\nGuess a number between 0 - ${maxGuess}: "
    read numGuess

    if [[ ! $numGuess =~ ^[0-9]+$ ]]
    then
        echo ""
        echo "Incorrect input. Please input a number."
        continue

    elif [[ "$numGuess" -gt "$maxGuess" ]]
    then
        echo ""
        echo "Incorrect input. Please input a number between 0 and ${maxGuess}."
        continue

    else
        break
    fi
done

echo -e "\nComputer generating a number..."

finalGuess=$((${maxGuess}+1))
compGen=$(($RANDOM%$finalGuess))

if [[ "$numGuess" -eq "$compGen" ]]
then
    echo -e "\nYour number matched with the computer!"
    echo -e "\nYour number: ${numGuess} vs Computer's number: ${compGen}\n"
else
    echo -e "\nYour number did not match the computer's"
    echo -e "\nYour number: ${numGuess} vs Computer's number: ${compGen}\n"
fi

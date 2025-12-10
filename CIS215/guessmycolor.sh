#!/bin/bash

fave="blue"
colors=("red" "blue" "green" "yellow" "red" "white" "black")
totalGuess=1

echo -e "guess the color"

echo -en "How many plays: "
read playtime

echo -e "Here's the list: "
for list in ${colors[@]}
do
        echo -e "$list"
done

while [ $totalGuess -le $playtime ]
do
        echo -en "\nPick a color! "
        read guess

        if [ $guess = $fave ]
        then
                echo -e "correct, you win"
                exit 0
        else
        echo -en "Incorrect. Try again: "
        ((totalGuess++))
        fi
done

echo -e "game over!"

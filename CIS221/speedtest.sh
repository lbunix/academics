#!/bin/bash

# GLOBALS
outputFolder="$PWD/results"
date="$(date +%m-%d-%Y_%H-%M-%S)"

# GLOBALS

echo -e "\n=================="
echo -e "Speed tester"
echo -e "==================\n"

while :
do
    echo -en "Speedtest silence mode (s|S), verbose mode (v|V), or quit (q|Q)? "
    read -r mode

    if [ ! -d "${outputFolder}" ]
    then
        mkdir -p "${outputFolder}"
    fi

    case "${mode}" in
        s|S)
            outputFile="speedtest-log(simple)_$date.txt"

            echo
            echo -e "Conducting silence speed test now.\n"
            echo -e "===================================\n"
            speedtest-cli --simple | tee "$outputFolder/$outputFile"

            echo -e "Output file created: $outputFile"

            exit 0
            ;;
        v|V)
            outputFile="speedtest-log(verbose)_$date.txt"

            echo
            echo -e "Conducting verbose speed test now.\n"
            echo -e "===================================\n"
            speedtest-cli | tee "$outputFolder/$outputFile"

            echo -e "Output file created: $outputFile"

            exit 0
            ;;
        q|Q)
            echo
            echo -e "Ending session.\n"

            exit 0
            ;;
        *  )
            echo
            echo -e "Invalid input. Please try again.\n"
            echo -e "If you would like to quit, enter q or Q."

            continue
    esac
done

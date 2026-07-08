#!/bin/bash

# Globals

octect='(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9][0-9]?)'
baseCount=$0

# Globals

# Script Start

while :
do

    echo -en "\nScan via domain (d|D) or IP address (i|I)? > "
    read scanType

case "${scanType}" in
    d|D)
        while :
        do
            echo -en "\nEnter the domain you would like to scan > "
            read domainInput

            if [[ "$domainInput" == "q" || "$domainInput" == "Q" ]]
            then
                echo -e "\nEnding program."
                exit 0
            fi

            target=$(dig +short A "$domainInput" | grep -m 1 -E '^[0-9]+(\.[0-9]+){3}$')

            if [[ -z "$target" ]]
            then
                echo -e "\nUnable to resolve."
                echo -e "\n\nTry a different domain or quit (q|Q)."
            else
                break 2
            fi
         done
        ;;

    i|I)
        while :
        do
            echo -en "\nEnter the IP that you would like to scan > "
            read ipInput

            if [[ "$ipInput" == "q" || "$ipInput" == "Q" ]]
            then
                echo -e "\nEnding program."
                exit 0
            fi

            if [[ ! "$ipInput" =~ ^$octect\.$octect\.$octect\.$octect$ ]]
            then
                echo ""
                echo -e "Please input a correct IP address."
                continue
            else
                echo ""
                echo -e "Initiating port scan."

                target=${ipInput}

                break 2
            fi
        done
        ;;
    *  )
        echo -e "\nInvalid entry."
        continue
        ;;
esac
done

echo -e "\n\nScanning $target..."

openPorts=$(nmap "$target" | grep "/tcp" | grep "open" | wc -l)

if [[ "$openPorts" -eq 0 ]]
then
    echo "There are no open ports for $target."
else
    echo "For target: $target, there are $openPorts open port(s)."
fi

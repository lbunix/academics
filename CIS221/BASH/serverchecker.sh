#!/bin/bash

# GLOBALS
octet='(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9]?[0-9])'
ip="^${octet}\.${octet}\.${octet}\.${octet}$"

count=1
targets=()

# GLOBALS

echo -e "\n======================"
echo -e "Domain Upper Checker"
echo -e "======================\n"

echo -e "Enter 5 domains/ IP Addresses.\n"

until [ "$count" -gt 5 ]
do
    echo -en "\nDomain# $count: "
    read -r domains

    target=""

    if [[ "$domains" =~ $ip ]]
    then
        target="$domains"

    elif [[ "$domains" =~ [A-Za-z] ]]
    then
        target=$(dig +short A "$domains" | grep -m 1 -E '^[0-9]+(\.[0-9]+){3}$')

    fi

    targets+=("$target")
    count=$((count + 1))
done

echo -e "\nAll five addresses entered. Starting pings...\n"

for target in "${targets[@]}"
do
    echo "Pinging $target..."
    echo "If ping does not reach, then you have input an incorrect domain/ IP address."
    ping -c 2 "$target" &
done

wait

echo -e "\n======================"
echo -e "Ping session complete."
echo -e "======================\n"

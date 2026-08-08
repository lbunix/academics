#!/bin/bash

# GLOBALS ################################

quit = "no"

title() {
    echo ""
    echo "==================="
    echo "    Menu Script    "
    echo "==================="
    echo ""
}

menu=(
    "1) Copy a file"
    "2) Show your local IP address"
    "3) Who is currently logged in"
    "4) Confirm that a server is up"
    "5) Pattern Checker Menu"
    "6) Roll a dice"
    "7) "
    "8) Exit program"
    ""
    "-------------------------------"
)

# GLOBALS ################################

# MENU OPTIONS ################################

copyFile() {

while :
do
    echo -en "\nInput the file including the full path >  "
    read fileSelect

    echo -en "\nYou have select: $fileSelect. Is this correct? (y/N) > "
    read selectFileConfirm

    case "$selectFileConfirm" in
	y|Y|yes|YES )
	    while :
	    do
		echo -en "\n\nInput the full path that you would like to copy the file to > "
		read folderSelect

		echo -en "\nYou would like to copy file $fileSelect to $folderSelect. Is this correct? (y/N) > "
		read selectFolderConfirm

		if [[ "$selectFolderConfirm" == y || "$selectFolderConfirm" == Y ]]
		then
		    echo "Copying file to destination..."
		    cp "$fileSelect" "$folderSelect/"

		    if [ ! -d "${folderSelect}" ]
		    then
			mkdir "${folderSelect}"
		    fi

		    echo "File copy successful"
		    break 3
		elif [[ "$selectFolderConfirm" == n || "$selectFolderConfirm" == N ]]
		then
		    continue
		else
		    echo "\nIncorrect Input. y|Y or n|N."
		    continue
		fi
	    done
		;;
	n|N|no|NO )
	    continue
	    ;;
	* )
	    echo "\nIncorrect Input. Please try again."
	    continue
	    ;;
    esac
done

}

showIP() {

ip a | grep "inet "

}

loggedOnStat() {

who

}

serverStatus() {

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

}

rollDice() {

# GLOBALS

dice=(
    1
    2
    3
    4
    5
    6
    7
    8
    9
    10
    11
    12
)

diceOne="${dice[$((RANDOM % ${#dice[@]}))]}"
diceTwo="${dice[$((RANDOM % ${#dice[@]}))]}"

echo "Die #1: $diceOne"
echo "Die #2: $diceTwo"

total=$((diceOne + diceTwo))

echo "Combined roll = $total"

}
netToolsMenu=(
    "===== Net Tools ====="
    "1) Run Traceroute"
    "2) Local IP address configuration"
    "3) Eth health & speeds"
    "4) Exit program"
    ""
    "-------------------------------"
)

netTools() {

# GLOBALS
quit = "no"

# GLOBALS

while [[ "$quit" != "yes" ]]
do
    while :
    do
        for list in "${netToolsMenu[@]}"
        do
            echo $list
        done

        echo -en "\nSelect an option (number) > "
        read -a userSelect

        if [[ ! "$userSelect" =~ ^[0-9] ]]
        then
            echo -e "\nNot a valid entry. Please enter a number from the options."
            continue
        elif [[ "$userSelect" == "q" || "$userSelect" == "Q" ]]
	then
	    "$quit" = "yes"
	else
            break
        fi
    done

    case "$userSelect" in
        1)
	    # GLOBALS
	    target=""
	    ip="^${octet}\.${octet}\.${octet}\.${octet}$"

	    # GLOBALS

    	    if [[ "$domains" =~ $ip ]]
    	    then
        	target="$domains"

    	    elif [[ "$domains" =~ [A-Za-z] ]]
    	    then
        	target=$(dig +short A "$domains" | grep -m 1 -E '^[0-9]+(\.[0-9]+){3}$')

    	    fi
    esac

    for target in "${targets[@]}"
    do
        echo "Pinging $target..."
        echo "If ping does not reach, then you have input an incorrect domain/ IP address."
        ping -c 2 "$target" &
    done
done
	    break 3
	;;
	2)
	    ip a
	    echo -e "\nEnd session with q/Q"
	    break 3
	;;
	3)
	    ip link show
	    echo -e "\nEnd session with q/Q"
	    break
	;;
	4)
	    echo "Ending session."
	    exit
	;;
	*)
	    echo "Incorrect input. Please select from one of the NUMBERED options."
	    break 3
}

exitProgram() {
echo "Ending session."
quit="yes"
}

# MENU OPTIONS ################################

while [[ "$quit" != "yes" ]]
do

    while :
    do
        title

        for list in "${menu[@]}"
        do
            echo $list
        done

        echo -en "\nSelect an option (number) > "
        read -a userSelect

        if [[ ! "$userSelect" =~ ^[0-9] ]]
        then
            echo -e "\nNot a valid entry. Please enter a number from the options."
            continue
        else
            break
        fi
    done

    case "$userSelect" in
        1)
	    copyFile
	;;
	2)
	    showIP
	;;
	3)
	    loggedOnStat
	;;
	4)
	    serverStatus
	;;
	5)
	    rollDice
	;;
	6)
	    netTools
	;;
	7)
	    echo -e "Ending session.\n"
	    "$quit" = "yes"
	;;
	*)
	    echo -e "\nIncorrect input. Select a NUMBERED option from the menu.\n"
	    break
	;;
    esac
done

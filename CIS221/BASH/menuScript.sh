#!/bin/bash

# GLOBALS ################################

quit="no"

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
    "5) Net Tools Menu"
    "6) Roll a dice"
    "7) Secret Image"
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

# GLOBALS

while :
do
    echo -en "Enter the Domain/IP Address to check it's status > "
    read target

    echo "\nPinging $target..."
    echo "### If ping does not reach, then you have input an incorrect domain/ IP address. ###"
    ping -c 4 "$target"

done

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
netToolsQuit="no"

# GLOBALS

while [[ "$netToolsQuit" != "yes" ]]
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

    case "$userSelect" in
        1)
	    echo -en "Enter an IP or domain you would like to trace > "
	    read target

            echo "\nTracing $target..."
            echo "### If trace does not reach, then you have input an incorrect domain/ IP address. ###"
	    echo ""
            traceroute "$target"
	;;
	2)
	    ip a
	    echo -e "\nEnd session with q/Q"
	;;
	3)
	    ip link show
	    echo -e "\nEnd session with q/Q"
	;;
	4)
	    echo "Ending session."
	    netToolsQuit="yes"
	;;
	*)
	    echo "Incorrect input. Please select from one of the NUMBERED options."
	;;
    esac
done
}

ascii=(

"     .    _    +     .  ______   .          ."
"  (      /|\      .    |      \      .   +"
"      . |||||     _    | |   | | ||         ."
" .      |||||    | |  _| | | | |_||    ."
"    /\  ||||| .  | | |   | |      |       ."
" __||||_|||||____| |_|_____________\__________"
" . |||| |||||  /\   _____      _____  .   ."
"   |||| ||||| ||||   .   .  .         ________"
"  . \|`-'|||| ||||    __________       .    ."
"     \__ |||| ||||      .          .     ."
"  __    ||||`-'|||  .       .    __________"
" .    . |||| ___/  ___________             ."
"    . _ ||||| . _               .   _________"
" _   ___|||||__  _ \\--//    .          _"
"      _ `---'    .)=\oo|=(.   _   .   .    ."
" _  ^      .  -    . \.|"

)

asciiPrint() {

for picture in "${ascii[@]}"
do
    echo $picture
done

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
	    asciiPrint
	;;
	8)
	    exitProgram
	;;
	*)
	    echo -e "\nIncorrect input. Select a NUMBERED option from the menu.\n"
	    break
	;;
    esac
done

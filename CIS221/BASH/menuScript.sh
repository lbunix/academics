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

clear

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
		    echo -e "\nIncorrect Input. y|Y or n|N."
		    continue
		fi
	    done
		;;
	n|N|no|NO )
	    continue
	    ;;
	* )
	    echo -e "\nIncorrect Input. Please try again."
	    continue
	    ;;
    esac
done

}

showIP() {

clear

echo ""
ip a | grep "inet "

}

loggedOnStat() {

clear

echo ""
who

}

serverStatus() {

while :
do
    echo -en "\nEnter the Domain/IP Address to check it's status > "
    read target

    if [[ "$target" == q || "$target" == Q ]]
    then
	break
    fi

    echo ""
    ping -c 4 "$target"

    echo ""
    echo "### You may quit with q|Q ###"

done

clear
}

rollDice() {

clear

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

echo ""
echo "Die #1: $diceOne"
echo "Die #2: $diceTwo"

total=$((diceOne + diceTwo))

echo ""
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

clear

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
    read netToolsSelect

    if [[ ! "$netToolsSelect" =~ ^[1-4] ]]
    then
        echo -e "\nNot a valid entry. Please enter a number from the options.\n"
        continue
    elif [[ "$netToolsSelect" == "q" || "$netToolsSelect" == "Q" ]]
    then
	"$netToolsQuit" = "yes"
    fi

    case "$netToolsSelect" in
        1)
	    clear

	    if ! command -v traceroute > /dev/null 2>&1
	    then
		echo -e "\nTraceroute is not installed."

		echo -en "Would you like to install Traceroute? (y/N) > "
		read installConfirm

		if [[ "$installConfirm" == y || "$installConfirm" == Y ]]
		then
		    sudo apt update
		    sudo apt install -y traceroute
		else
		    echo -e "\nThis option cannot be conducted."
		    echo -e "Returning to net tools menu.\n"
		    continue
		fi
	    fi

	    echo ""
	    echo -en "Enter an IP or domain you would like to trace > "
	    read target

            echo -e "\nTracing $target..."
            echo "### If trace does not reach, then you have input an incorrect domain/ IP address. ###"
	    echo ""
            traceroute "$target"
	    echo ""
	;;
	2)
	    clear
	    echo ""
	    ip a
	    echo ""
	;;
	3)
	    clear
	    echo ""
	    ip link show
	    echo ""
	;;
	4)
	    echo -e "\nEnding session.\n"
	    netToolsQuit="yes"
	    clear
	;;
	*)
	    echo -e "\nIncorrect input. Please select from one of the NUMBERED options.\n"
	;;
    esac
done
}

asciiPrint() {

clear

echo ""
cat <<'E0F'

     .    _    +     .  ______   .          .
  (      /|\      .    |      \      .   +
      . |||||     _    | |   | | ||         .
 .      |||||    | |  _| | | | |_||    .
    /\  ||||| .  | | |   | |      |       .
 __||||_|||||____| |_|_____________\__________
 . |||| |||||  /\   _____      _____  .   .
   |||| ||||| ||||   .   .  .         ________
  . \|`-'|||| ||||    __________       .    .
     \__ |||| ||||      .          .     .
  __    ||||`-'|||  .       .    __________
 .    . |||| ___/  ___________             .
    . _ ||||| . _               .   _________
 _   ___|||||__  _ \\--//    .          _
      _ `---'    .)=\oo|=(.   _   .   .    .
 _  ^      .  -    . \.|

E0F
}

exitProgram() {

echo ""
echo "Ending session."
quit="yes"

}

# MENU OPTIONS ################################

clear

while [[ "$quit" != "yes" ]]
do
    clear

    title

    for list in "${menu[@]}"
    do
        echo $list
    done

    echo -en "\nSelect an option (number) > "
    read userSelect

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
	    netTools
	;;
	6)
	   rollDice
	;;
	7)
	    asciiPrint
	;;
	8)
	    exitProgram
	;;
	*)
	    echo -e "\nIncorrect input. Select a NUMBERED option from the menu.\n"
	;;
    esac

    if [[ "$quit" != "yes" ]]
    then
	    echo
	    read -p "Press ENTER to return to the menu"
    fi
done

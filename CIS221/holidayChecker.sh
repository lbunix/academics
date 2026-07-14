#!/bin/bash

# Globals
months=("January" "February" "March" "April" "May" "June" "July" "August" "September" "October" "November" "December")
jan=("New Year's Day" "Martin Luther King Jr Day")
feb=("Valentine's Day" "President's Day")
mar=("St. Patrick's Day")
apr=("Easter Sunday")
may=("Mother's Day" "Memorial Day")
jun=("Juneteenth National Independence Day" "Father's Day")
jul=("Independence Day - 4th of July!")
aug=("No holidays for this month!")
sep=("Labor Day")
oct=("Halloween - SpoOoOoky")
nov=("Veterans Day" "Thanksgiving")
dec=("Christmas Eve & Christmas Day! - Ho Ho Ho" "New Year's Eve")

# Globals

echo -e "======================================="
echo -e "United States Public Holiday List Tool"
echo -e "======================================="

while :
do

    echo -e "\nPlease select a month from the list below:"

    for monthList in ${months[@]}
    do
        echo -e "$monthList"
    done

    echo -e "\n======================================="
    echo -en "\nIf you'd like to quit the tool, input q, Q, quit, or Quit."
    break
done

while :
do

    echo -en "\n\nSelect a month to see its holidays > "
    read monthSel

    case "${monthSel}" in
        jan|Jan|january|January)

            echo -e "\nThe public holidays in January are: "
            echo ""
            printf ' - %s\n' "${jan[@]}"
            continue
            ;;
        feb|Feb|february|February)

            echo -e "\nThe public holidays in February are: "
            echo ""
            printf ' - %s\n' "${feb[@]}"
            continue
            ;;
        mar|Mar|march|March)

            echo -e "\nThe public holidays in March are: "
            echo ""
            printf ' - %s\n' "${mar[@]}"
            continue
            ;;
        apr|Apr|april|April)

            echo -e "\nThe public holidays in April are: "
            echo ""
            printf ' - %s\n' "${apr[@]}"
            continue
            ;;
        may|May)

            echo -e "\nThe public holidays in May are: "
            echo ""
            printf ' - %s\n' "${may[@]}"
            continue
            ;;
        jun|Jun|june|June)

            echo -e "\nThe public holidays in June are: "
            echo ""
            printf ' - %s\n' "${jun[@]}"
            continue
            ;;
        jul|Jul|jul|July)

            echo -e "\nThe public holidays in July are: "
            echo ""
            printf ' - %s\n' "${jul[@]}"
            continue
            ;;
        aug|Aug|august|August)

            echo -e "\nThe public holidays in August are: "
            echo ""
            printf ' - %s\n' "${aug[@]}"
            continue
            ;;
        sep|Sep|September|September)

            echo -e "\nThe public holidays in September are: "
            echo ""
            printf ' - %s\n' "${sep[@]}"
            continue
            ;;
        oct|Oct|october|October)

            echo -e "\nThe public holidays in October are: "
            echo ""
            printf ' - %s\n' "${oct[@]}"
            continue
            ;;
        nov|Nov|november|November)

            echo -e "\nThe public holidays in November are: "
            echo ""
            printf ' - %s\n' "${nov[@]}"
            continue
            ;;
        dec|Dec|december|December)

            echo -e "\nThe public holidays in December are: "
            echo ""
            printf ' - %s\n' "${dec[@]}"
            continue
            ;;
        q|Q|quit|Quit|QUIT)
            echo -e "\nClosing tool.\n"
            exit 0
            ;;
        * )
            echo -e "\nInvalid input. If you would like to quit, input: q, Q, quit, or Quit."
            echo -e "\nOtherwise, please try again.\n"
            continue
    esac
done

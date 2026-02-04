#!/bin/bash

ipaddr=$(ip a | grep inet | grep -v -e "127" -e "inet6")

echo -e "\n### Initiating Net Check Script ###\n\n"
sleep 2

echo -e "This is your current IP: \n$ipaddr\n"
echo -en "Let's check the DNS of a website. Please input the website URL: "
read site

echo -e "The DNS information of the site you had input is: "
host -t ns "$site"
sleep 1

echo -e "\nLet's run a trace to the site you had chosen.\n"
echo -e "Checking...\n\n"
sleep 2

traceroute "${site}"





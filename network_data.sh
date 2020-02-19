#!/bin/bash
###################################################
# Descriotion:
#	 Bash script to display network info:
# 	- Network Card
#	- IP Address
#	- MAC Address
#	using ifconfig command by defualt, if ifconfig not
#	installed use iproute2 command insted
# Date: 02/03/19
# Version: 0.0.2
###################################################

get_ifconfig() {
	for nc in $(ifconfig | cut -d ' ' -f1 | tr ':' '\n' | awk NF)
	do
		ip=$(ifconfig $nc | grep '\binet\b' | awk '{print $2}')
		mac=$(ifconfig $nc | grep ether | awk '{print $2}')
		printf '\t%s\t\t%s\t\t%s\n' $nc $ip $mac	
	done
}
get_iproute2() {
	for nc in $(ip -0 link sh | awk -F': ' '{print $2}')
	do
		ip=$(ip addr sh $nc | grep '\binet\b' | awk '{print $2}')
		mac=$(ip link sh $nc | grep ether | awk '{print $2}')
		printf '\t%s\t\t%s\t%s\n' $nc $ip $mac
	done
}

printf "====================================================================\n"
printf "=== \tNet\t\tIP\t\t\tMAC\t\t ===\n"
printf "====================================================================\n"

if [ -e /usr/sbin/ifconfig -o -e /sbin/ifconfig ];then
	get_ifconfig
else
	get_iproute2
fi





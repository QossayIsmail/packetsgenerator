#!/bin/bash

ipaddress=$1
ports=$2
n=1
pfsenseip="10.0.0.6"
rm resultPackets.txt
touch resultPackets.txt
rm RESFIRE.txt
touch RESFIRE.txt
while [ $n -le 3000 ]
do

ip=`shuf $ipaddress -n 1`
port=`shuf $ports -n 1`

portNumber=$( echo "$port" | cut -d'/' -f1)
Xprotocol=$( echo "$port" | cut -d'/' -f2)
protocol="--$Xprotocol"

nping -c 1 $protocol -g $portNumber -p $portNumber   -S   $ip  -dest-ip  $pfsenseip  >> RESFIRE.txt
echo "nping -c 1 $protocol -g $portNumber -p $portNumber   -S $ip  -dest-ip  $pfsenseip">> resultPackets.txt

n=$(( n+1 ))
done

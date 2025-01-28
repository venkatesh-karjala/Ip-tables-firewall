#!/bin/bash

# Anti-Spoofing Rules for IPTables
IPT="/sbin/iptables"

echo "Blocking spoofed packets..."
$IPT -A INPUT -s 10.0.0.0/8 -j DROP
$IPT -A INPUT -s 172.16.0.0/12 -j DROP
$IPT -A INPUT -s 192.168.0.0/16 -j DROP
$IPT -A INPUT -s 127.0.0.0/8 ! -i lo -j DROP
$IPT -A INPUT -s 224.0.0.0/4 -j DROP
$IPT -A INPUT -d 224.0.0.0/4 -j DROP
$IPT -A INPUT -d 255.255.255.255 -j DROP

echo "Anti-spoofing rules applied."

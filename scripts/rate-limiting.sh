#!/bin/bash

# Rate Limiting Rules for IPTables
IPT="/sbin/iptables"

echo "Adding rate limiting for SSH..."
$IPT -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --set
$IPT -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --update --seconds 60 --hitcount 3 -j DROP

echo "Rate limiting rules applied."

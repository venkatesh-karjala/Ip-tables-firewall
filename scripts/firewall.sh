#!/bin/bash

# IPTables Firewall Script
# Author: Your Name
# Date: YYYY-MM-DD

# Define variables
IPT="/sbin/iptables"
LOG_PREFIX="IPTables-Dropped: "

# Flush existing rules
echo "Flushing existing rules..."
$IPT -F
$IPT -X
$IPT -Z

# Set default policies
echo "Setting default policies..."
$IPT -P INPUT DROP
$IPT -P FORWARD DROP
$IPT -P OUTPUT ACCEPT

# Allow loopback traffic
echo "Allowing loopback traffic..."
$IPT -A INPUT -i lo -j ACCEPT
$IPT -A OUTPUT -o lo -j ACCEPT

# Allow established and related connections
echo "Allowing established and related connections..."
$IPT -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# Allow SSH (port 22)
echo "Allowing SSH..."
$IPT -A INPUT -p tcp --dport 22 -j ACCEPT

# Allow HTTP (port 80) and HTTPS (port 443)
echo "Allowing HTTP and HTTPS..."
$IPT -A INPUT -p tcp --dport 80 -j ACCEPT
$IPT -A INPUT -p tcp --dport 443 -j ACCEPT

# Log dropped packets
echo "Logging dropped packets..."
$IPT -A INPUT -m limit --limit 5/min -j LOG --log-prefix "$LOG_PREFIX" --log-level 4

# Drop all other incoming traffic
echo "Dropping all other incoming traffic..."

# Save rules to persist across reboots (Debian/Ubuntu specific)
echo "Saving rules..."
iptables-save > /etc/iptables/rules.v4

echo "Firewall rules applied successfully!"

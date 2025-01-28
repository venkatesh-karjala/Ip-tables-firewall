#!/bin/bash

# IPTables Firewall Script
# Author: Venkatesh karjala
# Date: 2025-01-28

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

# Optional Features Integration
if [[ $1 == "--enable-rate-limit" ]]; then
    echo "Applying rate-limiting rules..."
    ./scripts/rate_limiting.sh
fi

if [[ $1 == "--enable-anti-spoofing" ]]; then
    echo "Applying anti-spoofing rules..."
    ./scripts/anti_spoofing.sh
fi

if [[ $1 == "--block-ports" ]]; then
    echo "Blocking specified ports..."
    ./scripts/block_ports.sh
fi


# Log dropped packets
echo "Logging dropped packets..."
$IPT -A INPUT -m limit --limit 5/min -j LOG --log-prefix "$LOG_PREFIX" --log-level 4

# Drop all other incoming traffic
echo "Dropping all other incoming traffic..."

# Save rules to persist across reboots (Debian/Ubuntu specific)
echo "Saving rules..."
iptables-save > /etc/iptables/rules.v4

echo "Firewall rules applied successfully!"

#!/bin/bash

# Port Blocking Rules for IPTables
IPT="/sbin/iptables"

# Define ports to block (customize as needed)
BLOCKED_PORTS=(23 25 445)

# Block each port
for PORT in "${BLOCKED_PORTS[@]}"; do
    echo "Blocking port $PORT..."
    $IPT -A INPUT -p tcp --dport $PORT -j DROP
    $IPT -A INPUT -p udp --dport $PORT -j DROP

done

# Confirm blocking
echo "Blocked ports: ${BLOCKED_PORTS[*]}"

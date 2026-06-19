#!/bin/bash
# ANCiber FEX013 - Custom Network Port Scanner Targeting Infrastructure Ports

# Define critical ports as requested in FEX013
TARGET_PORTS=(21 22 80 443 50 90)

# Scans IP range from 192.168.1.1 to 192.168.1.100
NETWORK_PREFIX="192.168.1"

echo "[+] Initializing infrastructure scout network scan..."
echo "[+] Target network: $NETWORK_PREFIX.1 to $NETWORK_PREFIX.100"

for ip_host in {1..100}; do
    TARGET_IP="$NETWORK_PREFIX.$ip_host"
    
    # Check if host is up before scanning ports (speeds up script)
    if ping -c 1 -W 1 "$TARGET_IP" &> /dev/null; then
        echo -e "\n[*] Host $TARGET_IP is ONLINE. Scanning ports..."
        
        for port in "${TARGET_PORTS[@]}"; do
            # Using bash network redirection with timeout
            if timeout 1 bash -c "echo > /dev/tcp/$TARGET_IP/$port" 2>/dev/null; then
                echo "    [!] Port $port is OPEN"
            fi
        done
    fi
done

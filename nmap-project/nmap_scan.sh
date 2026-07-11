#!/bin/bash
# Automated Nmap vulnerability scanning script for rapid security audits

TARGET=$1
OUTPUT_NAME=$2

if [ -z "$TARGET" ] || [ -z "$OUTPUT_NAME" ]; then
    echo "Usage: ./nmap_scan.sh <IP/Subnet> <Report_Name>"
    exit 1
fi

echo "[+] Initiating comprehensive vulnerability scan for: $TARGET"

# Execute Nmap scan exporting to XML with an embedded bootstrap stylesheet reference
nmap -sS -sV -O --script vulners --stylesheet https://raw.githubusercontent.com/honze-net/nmap-bootstrap-xsl/master/nmap-bootstrap.xsl -oX reports/${OUTPUT_NAME}.xml $TARGET

echo "[+] Scan completed successfully. Native report saved to reports/${OUTPUT_NAME}.xml"

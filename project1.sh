#!/bin/bash

# Group member 1: Ian Grahn
# Group member 2: Calvin Lindemann
# ERAU CI 201 / 01PC
# This script ...

# Main Menu Function
main_menu () {
  echo "---------- Main Menu ----------"
}
# Ping Sweep Function
ping_sweep () {
  echo "---------- Ping Sweep ----------"
}

# Port Scan. Scans a target IP for open ports
function portScan() {
    echo "--- Port Scan ---"
    date >> portscanresults.txt

    read -p "IP addr to scan (no CIDR notation): " target_ip

    for port in {1..100}; do
        nc -z $target_ip $port

        scan_success=$?

        if [[ $scan_success == 0 ]]; then
            echo "$port: OPEN!" >> portscanresults.txt
        else
            echo "$port: closed" >> portscanresults.txt
        fi
    done
}

# Print Scan Results Function
function printScanResults() {
    echo "--- Print Scan Results ---"

    select scan_result in "Ping Sweep Results" "Clear Ping Sweep Results" "Port Scan Results" "Clear Port Scan Results" "Exit"; do
        echo "$scan_result:"

        if [[ $scan_result == "Ping Sweep Results" ]]; then
            cat pingsweepresults.txt
        elif [[ $scan_result == "Clear Ping Sweep Results" ]]; then
            echo "Cleared!"
        elif [[ $scan_result == "Port Scan Results" ]]; then
            cat portscanresults.txt
        elif [[ $scan_result == "Clear Port Scan Results" ]]; then
            echo "Cleared!"
        elif [[ $scan_result == "Exit" ]]; then
            return
        fi

    done
}

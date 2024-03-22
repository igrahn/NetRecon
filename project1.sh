#!/bin/bash

# Group member 1: Ian Grahn
# Group member 2: Calvin Lindemann
# ERAU CI 201 / 01PC
# This script ...

# Main Menu Function
function main_menu() {
  echo "---------- Main Menu ----------"
  choices=("1) Ping Sweep" "2) Port Scan" "3) Print Screen Results" "4) Exit")
  select option in "${choices[@]}"; do
    case $option in

      1)
        pingSweep
        ;;
      2)
        portScan
        ;;
      3)
        printScanResults
        ;;
      4)
        exitProgram
        ;;
      *)
        echo "Invalid choice!"
        ;;
    esac
  done
}


# Ping Sweep Function
function pingSweep() {
  echo "---------- Ping Sweep ----------"
  echo -e "\n"
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
    echo "What would you like to do?"

    select scan_result in "Ping Sweep Results" "Clear Ping Sweep Results" "Port Scan Results" "Clear Port Scan Results" "Return to Main Menu"; do
        echo "$scan_result:"

        if [[ $scan_result == "Ping Sweep Results" ]]; then
            cat pingsweepresults.txt
        elif [[ $scan_result == "Clear Ping Sweep Results" ]]; then
            echo "" > pingsweepresults.txt
            echo "Cleared!"
        elif [[ $scan_result == "Port Scan Results" ]]; then
            cat portscanresults.txt
        elif [[ $scan_result == "Clear Port Scan Results" ]]; then
            echo "" > portscanresults.txt
            echo "Cleared!"
        elif [[ $scan_result == "Return to Main Menu" ]]; then
            return
        fi

    done
}


# Main Program

main_menu

#!/bin/bash

# Group member 1: Ian Grahn
# Group member 2: Calvin Lindemann
# ERAU CI 201 / 01PC
# This script ...

# Main Menu Function
function main_menu() {
  echo "---------- Main Menu ----------"
  choices=("Ping Sweep" "Port Scan" "Print Screen Results" "Exit")

  select option in "${choices[@]}"; do
    case $option in

      "Ping Sweep")
        pingSweep
        ;;
      "Port Scan")
        portScan
        ;;
      "Pring Screen Results")
        printScanResults
        ;;
      "Exit")
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
  echo -e "The ping sweep functionality will require you to enter the chosen IP address in 3 separate parts. 
  			For example, 192.15.104.5, you will enter 192, then 15, then 104. The program will then sweep
  				the given IP. \n"
  read -p "Enter first IP address number: " sweepIp_1
  read -p "Enter first IP address number: " sweepIp_2
  read -p "Enter first IP address number: " sweepIp_3
  
  target_ip="${sweepIp_1}.${sweepIp_2}.${sweepIp_3}"
  
  echo -e "Searching ${target_ip}.1 to ${target_ip}.100...\n" | tee pingsweepresults.txt
  for port in {1..100}; do
  	target="${target_ip}.${port}"
  	ping -c 1 -w 1 "$target"
  	if [ $? -eq 0 ]; then
  		echo -e "${target} is open\n" | tee pingsweepresults.txt
    else
      echo -e "${target}\n" | tee pingsweepresults.txt
  	fi
  done
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

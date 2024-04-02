#!/bin/bash

# Group member 1: Ian Grahn
# Group member 2: Calvin Lindemann
# ERAU CI 201 / 01PC
# This script serves as a tool for network reconnaissance
#     with various tools for developers.

# Main Menu Function
function mainMenu() {
  echo -e "\n---------- Main Menu ----------"
  choices=("Ping Sweep" "Port Scan" "Print Screen Results" "Exit")

  select option in "${choices[@]}"; do
    case $option in
      "Ping Sweep")
        pingSweep
        ;;
      "Port Scan")
        portScan
        ;;
      "Print Screen Results")
        printScanResults
        ;;
      "Exit")
        exitProgram
        ;;
      *)
        echo -e "Invalid choice!\n"
        ;;
    esac
  done
}

# Ping Sweep Function
function pingSweep() {
  echo -e "\n---------- Ping Sweep ----------"
  echo -e "The ping sweep functionality will require you
to enter the chosen IP address in 3 separate parts.
For example, 192.15.104.5, you will enter 192, then 15, then 104.
The program will then sweep the given IP. \n"
  read -p "Enter first IP address number: " sweepIp_1
  read -p "Enter first IP address number: " sweepIp_2
  read -p "Enter first IP address number: " sweepIp_3

  #Error checking
  if [[ ! $sweepIp_1 =~ ^[0-9]+$ || ! $sweepIp_2 =~ ^[0-9]+$ || ! $sweepIp_3 =~ ^[0-9]+$ ]]; then
      echo -e "\nError: You must input an integer for all three values! Aborting ping sweep!.\n"
      mainMenu
  fi

  target_ip="${sweepIp_1}.${sweepIp_2}.${sweepIp_3}"

  date >> pingsweepresults.txt
  echo -e "Searching ${target_ip}.1 to ${target_ip}.100...\n" | tee -a pingsweepresults.txt
  for port in {1..100}; do
  	target="${target_ip}.${port}"
  	if ping -c 1 -W 2 "$target" &> /dev/null; then
  		echo -e "${target} is active!\n" | tee -a pingsweepresults.txt
    else
      echo -e "${target}\n" | tee -a pingsweepresults.txt
  	fi
  done
  mainMenu
}

# Port Scan. Scans a target IP for open ports
function portScan() {
    echo -e "\n---------- Port Scan ----------"
    date >> portscanresults.txt

    read -p "IP address to scan (no CIDR notation): " target_ip

    for port in {1..100}; do
      nc -z $target_ip $port

      if [[ $? == 0 ]]; then
        echo "$port: OPEN!" | tee -a portscanresults.txt
      else
        echo "$port: closed" | tee -a portscanresults.txt
      fi
    done
    mainMenu
}

# Print Scan Results Function
function printScanResults() {
  echo -e "\n-------- Print Scan Results --------"
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
      mainMenu
    fi
  done
}

function exitProgram() {
  condition="n"
  while [[ $condition != "y" ]]; do
    read -p "Are you sure you want to exit? (Y/N): " choice
    choice=$(echo "$choice" | tr '[:upper:]' '[:lower:]')
    if [[ $choice == "y" ]]; then
      echo "Exiting program..."
      condition="y"
      echo -e "Success!\n"
      exit 0
    elif [[ $choice == "n" ]]; then
      echo -e "Program will not exit...\n"
      mainMenu
    else
      echo -e "Invalid selection or other error. Try again.\n"
    fi
  done
}

# Main Program
mainMenu

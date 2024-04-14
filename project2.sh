#!/bin/bash
# Group member 1: Ian Grahn
# Group member 2: Calvin Lindemann
# ERAU CI 201 / 01PC
# @TODO: add description.

#Main Menu Function
function mainMenu() {
  echo -e "\n---------------Main Menu---------------\n"
choices=("Disk Management" "File Management" "Network Management" "Process Management" "User Account Management" "Utilities" "Exit")

select option in "${choices[@]}"; do
  case $option in
    "Disk Management")
      diskManagement
      ;;
    "File Management")
      fileManagement
      ;;
    "Network Management")
      networkManagement
      ;;
    "Process Management")
      processManagement
      ;;
    "User Account Management")
      userAccountManagement
      ;;
    "Utilities")
      utilities
      ;;
    "Exit")
      exit 0
      ;;
    *)
      echo -e "Invalid Selection!\n"
      mainMenu
      ;;
    esac
  done
}

function diskManagement() {
  echo -e "\n---------------Disk Management---------------\n"
  choices=("Display device info" "Display disk partition info" "Display block device info" "Display mounted disk info" "Main menu")
  select option in "${choices[@]}"; do
    case $option in
      "Display device info")
        echo "-----------------------------"
        echo "Device name:" 
        uname
        echo "Device stats:" 
        uptime
        echo "-----------------------------"
        echo -e "\n"
        echo "Press any key to continue..."
        read -n 1 -s
        diskManagement
      ;;
      "Display disk parititon info")
        eecho "-----------------------------"
        echo "Disk Partition Info:" 
        fdisk
        echo "-----------------------------"
        echo -e "\n"
        echo "Press any key to continue..."
        read -n 1 -s
        diskManagement
      ;;
      "Display block device info")
        echo "-----------------------------"
        echo "Block Device Info:" 
        lsblk
        echo "-----------------------------"
        echo -e "\n"
        echo "Press any key to continue..."
        read -n 1 -s
        diskManagement
      ;;
      "Display mounted disk info")
        echo "-----------------------------"
        echo "Mounted Disk Info:" 
        df
        echo "-----------------------------"
        echo -e "\n"
        echo "Press any key to continue..."
        read -n 1 -s
        diskManagement
      ;;
      "Main menu")
        mainMenu
      ;;
      *)
      echo -e "Invalid Selection!\n"
        diskManagement
      ;;
    esac
  done
}

function fileManagement() {
  echo -e "\n---------------File Management---------------\n"
  choices=("Present working directory" "List directory contents" "Create a file" "Change file permissions" "Remove a file" "Read a file" "Main menu")
  select option in "${choices[@]}"; do
    case $option in
      "Present working directory")
  
      ;;
      "List directory contents")
  
      ;;
      "Create a file")
  
      ;;
      "Change file permissions")
  
      ;;
      "Remove a file")
  
      ;;
      "Read a file")
  
      ;;
      "Main menu")
      mainMenu
      ;;
    esac
  done
}

mainMenu

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
      exit
      ;;
    *)
      echo -e "Invalid Selection!\n"
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
        echo "Device name: " 
        uname
        echo -e "\n"
        echo "Device stats:"
        uptime
        echo -e "\n"
      ;;
      "Display disk parititon info")
  
      ;;
      "Display block device info")
  
      ;;
      "Display mounted disk info")
  
      ;;
      "Main menu")
      mainMenu
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

function networkManagement() {

}

mainMenu

#!/bin/bash
# Group member 1: Ian Grahn
# Group member 2: Calvin Lindemann
# ERAU CI 201 / 01PC
# @TODO: add description.

#Main Menu Function
function mainMenu(){
choices=("Disk Management" "File Management" "Network Management" "Process Management" "User Account Management" "Utilities")

select option in "${choices[@]}"; do
  case $option in
    "Disk Management")
      diskManagement
      ;;
    "File Management")
      fileManagement
      ;;
    "Network Management")
      fileManagement
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
    *)
      echo -e "Invalid Selection!\n"
      ;;
    esac
  done
}

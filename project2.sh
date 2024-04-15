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
      clear
      diskManagement
      ;;
    "File Management")
      clear
      fileManagement
      ;;
    "Network Management")
      clear
      networkManagement
      ;;
    "Process Management")
      clear
      processManagement
      ;;
    "User Account Management")
      clear
      userAccountManagement
      ;;
    "Utilities")
      clear
      utilities
      ;;
    "Exit")
      clear
      exit 0
      ;;
    *)
      clear
         echo "---------------------------------------------"
      echo -e "\n------------Invalid Selection!-------------"
      mainMenu
      ;;
    esac
  done
}

function diskManagement() {
  echo "---------------------------------------------"
  echo -e "---------------Disk Management---------------\n"
  choices=("Display device info" "Display disk partition info" "Display block device info" "Display mounted disk info" "Main menu")
  select option in "${choices[@]}"; do
    case $option in
      "Display device info")
        clear
        echo "--------------------------------------------"
        echo "-------------Device Information-------------"
        echo -n "Current user: "
        whoami
        echo -n "Kernel name: " 
        uname
        echo -n "Device uptime: " 
        uptime
        echo "--------------------------------------------"
        echo "Press any key to continue..."
        read -n 1 -s
        clear
        diskManagement
      ;;
      "Display disk partition info")
        clear
        echo "--------------------------------------------"
        echo "---------Disk Partition Information---------"
        fdisk
        echo "--------------------------------------------"
        echo "Press any key to continue..."
        read -n 1 -s
        clear
        diskManagement
      ;;
      "Display block device info")
        clear
        echo "--------------------------------------------"
        echo "----------Block Device Information----------"
        lsblk
        echo "--------------------------------------------"
        echo "Press any key to continue..."
        read -n 1 -s
        clear
        diskManagement
      ;;
      "Display mounted disk info")
        clear
        echo "--------------------------------------------"
        echo "----------Mounted Disk Information----------"
        df
        echo "--------------------------------------------"
        echo "Press any key to continue..."
        read -n 1 -s
        clear
        diskManagement
      ;;
      "Main menu")
        clear
        mainMenu
      ;;
      *)
        clear
        echo "---------------------------------------------"
        echo -e "\n------------Invalid Selection!-------------"
        diskManagement
      ;;
    esac
  done
}

function fileManagement() {
     echo "---------------------------------------------"
  echo -e "---------------File Management---------------\n"
  choices=("Present working directory" "List directory contents" "Create a file" "Change file permissions" "Remove a file" "Read a file" "Main menu")
  select option in "${choices[@]}"; do
    case $option in
      "Present working directory")
      echo -n "Current working directory:"
      pwd
      ;;
      "List directory contents")
      echo "Current directory contents: "
      ls
      ;;
      "Create a file")
        clear
        echo "--------------------------------------------"
        echo "----------------File Creator----------------"
        echo -n "Enter a file name: "
        read file
        echo -n "Enter a file extension (i.e .txt, .c, .sh ...): "
        read ext
        fileCreate="$file$ext"
        nano "$fileCreate"
        clear
        fileManagement
      ;;
      "Change file permissions")
  
      ;;
      "Remove a file")
        clear
        echo "--------------------------------------------"
        echo "----------------File Remover----------------"
        cd ~
        echo -n "Current directory: " 
        pwd
        ls -F | grep "/$"
        echo -n "Enter parent directory, or enter q to exit: "
        read directory
        if [ $directory = "q" ]; then
          clear
          fileManagement
        fi
        cd $directory
        clear
        echo "--------------------------------------------"
        echo "----------------File Remover----------------"
        echo -n "Current directory: " 
        pwd
        echo -e "\n"
        ls
        echo -n -e "\nEnter a file to remove (include extention), or enter q to exit: "
        read file
        if [ $file = "q" ]; then
          clear
          fileManagement
        fi
        rm $file
        echo "File removal complete!"
        echo -e "\nPress any key to return to file management..."
        read -n 1 -s
        clear
        fileManagement
      ;;
      "Read a file")
      mainMenu
      ;;
      "Main menu")
      clear
      mainMenu
      ;;
      *)
         echo "---------------------------------------------"
      echo -e "\n------------Invalid Selection!-------------"
        fileManagement
      ;;
    esac
  done
}

function networkManagement() {
  echo -e "\n---------------File Management---------------\n"
  choices=("ifconfig" "ping" "traceroute" "nslookup" "View network interfaces" "View network routing table" "View current system users" "View client machine information" "Main menu")
  select option in "${choices[@]}"; do
    case $option in
      "ifconfig")
  
      ;;
      "ping")
  
      ;;
      "traceroute")
  
      ;;
      "nslookup")
  
      ;;
      "View network interfaces")
  
      ;;
      "View network routing table")
  
      ;;
      "View current system users")
      
      ;;
      "View client machine information")
      
      ;;
      "Main menu")

      ;;
      *)
         echo "---------------------------------------------"
      echo -e "\n------------Invalid Selection!-------------"
        networkManagement
      ;;
    esac
  done
}

#Main menu functionality
clear
mainMenu

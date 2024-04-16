#!/bin/bash
# Group member 1: Ian Grahn
# Group member 2: Calvin Lindemann
# ERAU CI 201 / 01PC
# @TODO: add description.

#Main Menu Function
function mainMenu() {
     echo "---------------------------------------------"
  echo -e "------------------Main Menu------------------\n"
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
      echo -e "\n-------------Invalid Selection!--------------"
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
        echo -e "\n-------------Invalid Selection!--------------"
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
        clear
        echo "--------------------------------------------"
        echo "----------Present Working Directory---------"
        echo -n "Current working directory: "
        pwd
        echo -e "\nPress any key to return to file management..."
        read -n 1 -s
        clear
        fileManagement
      ;;
      "List directory contents")
        clear
        echo "--------------------------------------------"
        echo "--------------Directory Viewer--------------"
        cd ~
        ls -F | grep "/$"
        echo -n -e "\nEnter desired directory: "
        read directory
        cd $directory
        clear
        echo "--------------------------------------------"
        echo "--------------Directory Viewer--------------"
        echo -n "Current directory contents of "
        pwd
        ls
        echo -e "\nPress any key to return to file management..."
        read -n 1 -s
        clear
        fileManagement
      ;;
      "Create a file")
        clear
        echo "--------------------------------------------"
        echo "----------------File Creator----------------"
        cd ~
        echo -n "Current directory: " 
        pwd
        ls -F | grep "/$"
        echo -n "Enter desired directory, or enter q to exit: "
        read directory
        if [ $directory = "q" ]; then
          clear
          fileManagement
        fi
        cd $directory
        clear
        echo "--------------------------------------------"
        echo "----------------File Creator----------------"
        echo -n "Current directory: " 
        pwd
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
        #TODO
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
        clear
        echo "--------------------------------------------"
        echo "----------------File Reader-----------------"
        cd ~
        ls -F | grep "/$"
        echo -n -e "\nEnter desired directory: "
        read directory
        cd $directory
        clear
        echo "--------------------------------------------"
        echo "----------------File Reader-----------------"
        echo -n "Current directory contents of "
        pwd
        ls
        echo -n "Which file would you like to view?: "
        read file
        clear
        echo "--------------------------------------------"
        echo "----------------File Reader-----------------"
        echo -e "Showing contents of $file:\n"
        cat $file
        echo -e "\nPress any key to return to file management..."
        read -n 1 -s
        clear
        fileManagement
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
        #TODO
      ;;
      "ping")
        clear
        echo "--------------------------------------------"
        echo "----------------Network Ping----------------"
        echo -n "Enter an IP to ping (i.e 8.8.8.8): " 
        read address
        echo -n "How many requests?: "
        read requests
        if [[ ! $requests =~ ^[0-9]+$ ]]; then
          clear
          echo -e "\nEnter an integer!"
          echo "--------------------------------------------"
          networkManagement
        fi
        echo -e "Pinging $address...\n"
        command="-c $requests $address"
        ping $command
        echo -e "\nPress any key to continue..."
        read -n 1 -s
        clear
        networkManagement 
      ;;
      "traceroute")
        clear
        echo "--------------------------------------------"
        echo "-------------Network Traceroute-------------"
        echo -n "Enter an IP to trace (i.e 8.8.8.8): " 
        read address
        echo -n "How many queries? (default is 3): "
        read queries
        if [[ ! $queries =~ ^[0-9]+$ ]]; then
          clear
          echo -e "\nEnter an integer!"
          echo "--------------------------------------------"
          networkManagement
        fi
        command="-q $queries $address"
        echo -e "Executing traceroute...\n"
        traceroute $command
        echo -e "\nPress any key to continue..."
        read -n 1 -s
        clear
        networkManagement
      ;;
      "nslookup")
        clear
        echo "--------------------------------------------"
        echo "-------------Name Server Lookup-------------"
        echo -n "Enter a domain to lookup (i.e google.com): "
        read domain
        echo -e "Showing results for $domain\n"
        nslookup $domain
        echo -e "\nPress any key to continue..."
        read -n 1 -s
        clear
        networkManagement
      ;;
      "View network interfaces")
        clear
        echo "--------------------------------------------"
        echo "-----------Network Routing Table------------"
        ip a
      ;;
      "View network routing table")
        clear
        echo "--------------------------------------------"
        echo "-----------Network Routing Table------------"
        netstat -rn
        echo "--------------------------------------------"
        echo -e "\nPress any key to continue..."
        read -n 1 -s
        clear
        networkManagement
      ;;
      "View current system users")
        clear
        echo "--------------------------------------------"
        echo "-----------Current System Users-------------"
        who
        echo "--------------------------------------------"
        echo -e "\nPress any key to continue..."
        read -n 1 -s
        clear
        networkManagement
      ;;
      "View client machine information")
        #TODO
      ;;
      "Main menu")
        clear
        mainMenu
      ;;
      *)
           echo "---------------------------------------------"
      echo -e "\n-------------Invalid Selection!--------------"
        networkManagement
      ;;
    esac
  done
}

#Main menu functionality
clear
mainMenu


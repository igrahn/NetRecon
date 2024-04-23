#!/bin/bash
# Group member 1: Ian Grahn
# Group member 2: Calvin Lindemann
# ERAU CI 201 / 01PC
# This program is an indepth linux management program, allowing the user to access information ranging from disk management, to network and process management.

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
        accountManagement
        ;;
      "Utilities")
        clear
        generalUtils
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
        clear
        echo "--------------------------------------------"
        echo "-------------File Permissions---------------"
        cd ~
        ls -F | grep "/$"
        echo -n -e "\nEnter desired directory: "
        read directory
        cd $directory
        clear
        echo "--------------------------------------------"
        echo "-------------File Permissions---------------"
        echo -n "Current directory contents of "
        pwd
        ls
        echo -n "Which file would you like to modify?: "
        read file
        clear
        echo "--------------------------------------------"
        echo "-------------File Permissions---------------"
        echo -e "Permission manager for $file:\n"
        choices=("777" "755" "700" "666" "644" "600" "555" "444")
        select option in "${choices[@]}"; do
          case $option in
            "777")
              clear
              chmod="777"
              echo "Changing file permissions to: everyone can read, write, and execute."
              chmod $chmod $file
              echo "Permission modification of $chmod for $file is complete."
              echo -e "\nPress any key to return to file management..."
              read -n 1 -s
              clear
              fileManagement
            ;;
            "755")
              clear
              chmod="755"
              echo "Changing file permissions to: owner can do anything, others can read and execute."
              chmod $chmod $file
              echo "Permission modification of $chmod for $file is complete."
              echo -e "\nPress any key to return to file management..."
              read -n 1 -s
              clear
              fileManagement
            ;;
            "700")
              clear
              chmod="700"
              echo "Changing file permissions to: only owner can read, write, and execute."
              chmod $chmod $file
              echo "Permission modification of $chmod for $file is complete."
              echo -e "\nPress any key to return to file management..."
              read -n 1 -s
              clear
              fileManagement
            ;;
            "666")
              clear
              chmod="666"
              echo "Changing file permissions to: everyone can read and write, but not execute."
              chmod $chmod $file
              echo "Permission modification of $chmod for $file is complete."
              echo -e "\nPress any key to return to file management..."
              read -n 1 -s
              clear
              fileManagement
            ;;
            "644")
              clear
              chmod="644"
              echo "Changing file permissions to: owner can read and write, others can only read."
              chmod $chmod $file
              echo "Permission modification of $chmod for $file is complete."
              echo -e "\nPress any key to return to file management..."
              read -n 1 -s
              clear
              fileManagement
            ;;
            "600")
              clear
              chmod="600"
              echo "Changing file permissions to: only owner can read and write."
              chmod $chmod $file
              echo "Permission modification of $chmod for $file is complete."
              echo -e "\nPress any key to return to file management..."
              read -n 1 -s
              clear
              fileManagement
            ;;
            "555")
              clear
              chmod="555"
              echo "Changing file permissions to: everyone can read and execute, but not write."
              chmod $chmod $file
              echo "Permission modification of $chmod for $file is complete."
              echo -e "\nPress any key to return to file management..."
              read -n 1 -s
              clear
              fileManagement
            ;;
            "444")
              clear
              chmod="444"
              echo "Changing file permissions to: everyone can only read, no writing or executing."
              chmod $chmod $file
              echo "Permission modification of $chmod for $file is complete."
              echo -e "\nPress any key to return to file management..."
              read -n 1 -s
              clear
              fileManagement
            ;;
            *)
              clear
              echo "Invalid permissions specified."
              fileManagement
            ;;
          esac
        done
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
        clear
        echo "--------------------------------------------"
        echo "-----------Network Interface Info-----------"
        ifconfig
        echo "--------------------------------------------"
        echo "Press any key to continue..."
        read -n 1 -s
        clear
        networkManagement
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
        echo "--------------------------------------------"
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
        clear
        echo "--------------------------------------------"
        echo "--------Client Machine Information----------"
        echo "Current hardware info: "
        hwinfo --short
        echo "--------------------------------------------"
        echo -e "\nPress any key to continue..."
        read -n 1 -s
        clear
        networkManagement
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

function processManagement() {
  select option in "Display Processes" "Display Processes (by usage)" "Terminate a Process" "Display Disk Usage" "Display Free Disk Space" "Display System Uptime" "Return to Main Menu"; do
    case $option in
      "Display Processes")
        top
        ;;
      "Display Processes (by usage)")
        top
        ;;
      "Terminate a Process")
        read -p "Process ID > " process
        kill $process
        ;;
      "Display Disk Usage")
        df -h
        ;;
      "Display Free Disk Space")
        df -h
        ;;
      "Display System Uptime")
        uptime
        uptime -p
        ;;
      "Return to Main Menu")
        mainMenu
        ;;
    esac
  done
}

function userAccountManagement() {
  select option in "Add User" "Delete User" "Lock User Password" "Investigate User" "Find User" "Add Group" "Delete Group" "Find Group" "Return to Main Menu"; do
    case $option in
      "Add User")
        read -p "New username > " newUser
        useradd $newUser
        ;;
      "Delete User")
        read -p "User to delete > " delUser
        read -p "Are you sure you want to delete $delUser?" confirmation

        if [[ $confirmation != "Y" || $confirmation != "y" || $confirmation != "yes" ]]; then
          echo "Not deleting"
          accountManagement
        else
          userdel $delUser
        fi
        ;;
      "Lock User Password")
        read -p "User to lock > " lockUser
        passwd -l $lockUser
        ;;
      "Investigate User")
        read -p "User to investigate > " invUser
        finger $invUser
        ;;
      "Find User")
        read -p "User to query > " queryUser

        id $queryUser > /dev/null 2>&1

        if [[ $? == 0 ]]; then
          echo "$queryUser exists on this system"
        else
          echo "$queryUser does not exist on this system"
        fi
        ;;
      "Add Group")
        read -p "New group > " newGroup
        groupadd $newGroup
        ;;
      "Delete Group")
        read -p "Group to delete > " delGroup
        read -p "Are you sure you want to delete $delGroup?" confirmation

        if [[ $confirmation != "Y" || $confirmation != "y" || $confirmation != "yes" ]]; then
          echo "Not deleting"
          accountManagement
        else
          groupdel $delUser
        fi
        ;;
      "Find Group")
        read -p "Group to query > " queryGroup

        if grep -q -E "^$queryGroup:" /etc/group; then
          echo "$queryGroup exists on this system"
        else
          echo "$queryGroup does not exist on this system"
        fi
        ;;
      "Return to Main Menu")
        mainMenu
        ;;
    esac
  done
}

function utilities() {
  select option in "Date/Time" "Calendar" "View Manual Page" "Determine File Type" "Determine Command Type" "Sort File" "Search File" "Return to Main Menu"; do
    case $option in
      "Date/Time")
        date
        ;;
      "Calendar")
        cal
        ;;
      "View Manual Page")
        read -p "Program name > " prog
        man $prog
        ;;
      "Determine File Type")
        read -p "File to investigate > " file
        file $file
        ;;
      "Determine Command Type")
        read -p "Command > " cmd
        type $cmd
        ;;
      "Sort File")
        read -p "File to sort > " file
        cat $file | sort
        ;;
      "Search File")
        read -p "File to search > " file
        read -p "Search term > " search
        cat $file | grep $search
        ;;
      "Return to Main Menu")
        mainMenu
        ;;
    esac
  done
}

# Clear the screen and open the main menu
clear
mainMenu

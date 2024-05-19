#!/bin/bash
while true; do
    echo "  _____ _____     _____     _ _  "
    echo " | __  |   __|___|     |___|_| | "
    echo " |    -|   __|___| | | | .'| | | "
    echo " |__|__|_____|   |_|_|_|__,|_|_| "
    echo " Simplified tool to recall email using GAMADV-XTD3"
    echo " Created by: OepilCore"
    echo "==============================================="

    echo "1.) Recall email from all user"
    echo "2.) Recall email from specified user"
    echo "0.) Exit"
    echo -n "Please select a number: "
    read number

    if [ "$number" = 0 ]; then
        echo "Exiting..."
        break
    elif [ "$number" = 1 ]; then
        echo -n "Insert message ID: "
        read msid
        echo "You entered message ID: $msid"
        echo -n "Do you want to proceed? (Y/N): "
        read confirm
        if [ "$confirm" = "Y" ] || [ "$confirm" = "y" ]; then
            gam all users delete messages query "$msid" doit
        else
            echo "Returning to main menu..."
            continue
        fi
    elif [ "$number" = 2 ]; then
        echo -n "Insert specified user email: "
        read specuser
        echo -n "Insert message ID: "
        read msid
        echo "You entered specified user email: $specuser and message ID: $msid"
        echo -n "Do you want to proceed? (Y/N): "
        read confirm
        if [ "$confirm" = "Y" ] || [ "$confirm" = "y" ]; then
            gam user "$specuser" delete messages query "rfc822msgid:$msid" doit
        else
            echo "Returning to main menu..."
            continue
        fi
    else
        echo "There is no option for that"
    fi
done

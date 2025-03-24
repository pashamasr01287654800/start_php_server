#!/bin/bash

# Define colors
MAGENTA="\e[35m"
RESET="\e[0m"

# Prompt for port number with a default value
while true; do
    echo -ne "${MAGENTA}Enter the port number (Press Enter to use default: 8080): ${RESET}"
    read PORT
    PORT=${PORT:-8080}  # Set default port if empty
    if [[ "$PORT" =~ ^[0-9]+$ ]]; then
        break
    else
        echo "Invalid input. Please enter a valid numeric port number."
    fi
done

# Prompt for website folder path
while true; do
    echo -ne "${MAGENTA}Enter the full path to the website folder: ${RESET}"
    read FOLDER
    if [[ -n "$FOLDER" && -d "$FOLDER" ]]; then
        break
    else
        echo "Invalid input. Please enter a valid existing folder path."
    fi
done

# Start the PHP server
echo -e "${MAGENTA}Starting PHP server on port $PORT...${RESET}"
php -S 0.0.0.0:$PORT -t "$FOLDER"

# Display the access link
echo -e "${MAGENTA}Server is running at: http://0.0.0.0:$PORT/${RESET}"

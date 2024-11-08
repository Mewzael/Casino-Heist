#!/bin/bash

# Check for Docker
if ! command -v docker &> /dev/null; then
  echo "Docker is not installed or not in PATH."
  exit 1
fi

# Chmod 777 for all required script
chmod 777 ./deploy_http.sh
chmod 777 ./deploy_https.sh
chmod 777 ./deploy_quick_start.sh
chmod 777 ./Frontend/start.sh
chmod 777 ./Frontend/install.sh
chmod 777 ./Frontend/changer.py
chmod 777 ./Backend/start_http.sh
chmod 777 ./Backend/start.sh
chmod 777 ./Challenges/deploy.sh

# Clearing Header interpreter
sed -i -e 's/\r$//' ./deploy_http.sh
sed -i -e 's/\r$//' ./deploy_https.sh
sed -i -e 's/\r$//' ./deploy_quick_start.sh
sed -i -e 's/\r$//' ./Frontend/start.sh
sed -i -e 's/\r$//' ./Frontend/install.sh
sed -i -e 's/\r$//' ./Frontend/changer.py
sed -i -e 's/\r$//' ./Backend/start_http.sh
sed -i -e 's/\r$//' ./Backend/start.sh 
sed -i -e 's/\r$//' ./Challenges/deploy.sh

# Print Welcome Message
echo """
  ___   __   ____  __  __ _   __     _  _  ____  __  ____  ____ 
 / __) / _\ / ___)(  )(  ( \ /  \   / )( \(  __)(  )/ ___)(_  _)
( (__ /    \\___ \ )( /    /(  O )  ) __ ( ) _)  )( \___ \  )(  
 \___)\_/\_/(____/(__)\_)__) \__/   \_)(_/(____)(__)(____/ (__) 

WELCOME TO CASINO HEIST!
HOW MAY WE HELP YOU TODAY?
0. Quick Start - Casino Heist
1. Manage Challenges
2. Deploy HTTPS Casino Heist (require Nginx & certbot)
3. Deploy HTTP Casino Heist (local)

"""

read -p ">> " option
if [ "$option" -eq 0 ]; then
    ./deploy_quick_start.sh
elif [ "$option" -eq 1 ]; then
    cd ./Challenges
    ./deploy.sh
elif [ "$option" -eq 2 ]; then
    ./deploy_https.sh
elif [ "$option" -eq 3 ]; then
    ./deploy_http.sh
else
    echo "Invalid Options Selected!"
    exit 1
fi


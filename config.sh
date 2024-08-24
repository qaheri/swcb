#!/bin/bash
cd /root/
pkill -9 -f run.py
datee=$(date +"%Y-%m-%d_%T")
mv /root/axelbot /root/releases/axelbot_$datee
# rm -r axelbot
git clone https://github.com/qaheri/axelbot
git config --global credential.helper store
cd /root/axelbot
sudo chmod +x config2.sh
sudo chmod +x configft.sh

read -p "First time config [1]
Non First time config [2]
Choose: " choice

choice2=$(echo "$choice" | tr -d ' ')

if [ $choice2 == "1" ]; then
    bash /root/axelbot/configft.sh
elif [ $choice2 == "2" ]; then
    bash /root/axelbot/config2.sh
fi
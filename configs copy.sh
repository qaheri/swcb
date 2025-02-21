#!/bin/bash
cd /root/
pkill -9 -f run.py
datee=$(date +"%Y-%m-%d_%T")
mv /root/VIPChannelSUB /root/releases/VIPChannelSUB_$datee
git clone https://github.com/qaheri/VIPChannelSUB
git config --global credential.helper store
cd /root/VIPChannelSUB
sudo chmod +x config2.sh
sudo chmod +x configft.sh

read -p "First time config [1]
Non First time config [2]
Choose: " choice

choice2=$(echo "$choice" | tr -d ' ')

if [ $choice2 == "1" ]; then
    bash /root/VIPChannelSUB/configft.sh
elif [ $choice2 == "2" ]; then
    bash /root/VIPChannelSUB/config2.sh
fi
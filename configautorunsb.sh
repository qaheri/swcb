#!/bin/bash
cd /root/
pkill -9 -f run.py
datee=$(date +"%Y-%m-%d_%T")
mv /root/VIPChannelSUB /root/releases/VIPChannelSUB_$datee
rm -r VIPChannelSUB
git clone https://github.com/qaheri/VIPChannelSUB
git config --global credential.helper store
cd /root/VIPChannelSUB
sudo chmod +x config2.sh
sudo chmod +x configft.sh

bash /root/VIPChannelSUB/autorun.sh
#!/bin/bash
cd /root/
pkill -9 -f run.py
datee=$(date +"%Y-%m-%d_%T")
mv /root/axelbot /root/releases/axelbot_$datee
# rm -r axelbot
git clone https://github.com/qaheri/axelbot-makers
mv /root/axelbot-makers /root/axelbot
git config --global credential.helper store
cd /root/axelbot
sudo chmod +x config2.sh
sudo chmod +x configft.sh

bash /root/axelbot/autorun.sh
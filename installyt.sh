#!/bin/bash
sudo apt-get -y install python3-pip
sudo pip install telegram
# sudo apt-get install unzip -y
sudo apt-get install curl -y
pkill -f sp3.py
rm -r axelytbot
# curl -O https://github.com/python-telegram-bot/python-telegram-bot/archive/refs/tags/v13.7.zip
# unzip python-telegram-bot-13.7_2.zip -d /root
# cd python-telegram-bot-13.7
# python3 setup.py install
pip install python-telegram-bot==13.7
cd /root/
git clone https://github.com/qaheri/axelytbot
git config --global credential.helper store
cd /root/axelytbot
# line="@reboot python3 /root/axelytbot/sp3.py >/dev/null 2>&1"
# (crontab -u $(whoami) -l; echo "$line" ) | crontab -u $(whoami) -
nohup python3 /root/axelytbot/sp3.py &
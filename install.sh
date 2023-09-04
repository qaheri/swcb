#!/bin/bash
sudo apt-get -y install python3-pip
sudo pip install telegram
sudo apt-get install unzip -y
sudo apt-get install curl -y
pkill -f main.py
rm -r Starwarscolbot/
curl -O https://github.com/python-telegram-bot/python-telegram-bot/archive/refs/tags/v13.7.zip
unzip python-telegram-bot-13.7_2.zip -d /root
cd python-telegram-bot-13.7
python3 setup.py install
cd /root/
git clone https://github.com/qaheri/Starwarscolbot
git config --global credential.helper store
cd /root/Starwarscolbot
# line="@reboot python3 /root/Starwarscolbot/main.py >/dev/null 2>&1"
# (crontab -u $(whoami) -l; echo "$line" ) | crontab -u $(whoami) -
nohup python3 /root/Starwarscolbot/main.py &
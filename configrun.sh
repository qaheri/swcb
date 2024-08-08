#!/bin/bash
cd /root/
pkill -9 -f run.py
rm -r axelbot
git clone https://github.com/qaheri/axelbot
git config --global credential.helper store
cd /root/axelbot
sudo chmod +x config2.sh
sudo chmod +x configft.sh

bash /root/axelbot/config2.sh
#!/bin/bash
cd /root/
pkill -9 -f run.py
rm -r axelbot
git clone https://github.com/qaheri/axelbot-makers
mv /root/axelbot-makers /root/axelbot
git config --global credential.helper store
cd /root/axelbot
sudo chmod +x config2.sh
sudo chmod +x configft.sh

python3 run.py
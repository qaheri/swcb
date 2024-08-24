#!/bin/bash

# Download the Gost script from GitHub
temp_dir=$(mktemp -d)
cd "$temp_dir" || exit
wget https://github.com/qaheri/swcb/raw/main/gost_i_c.sh
sudo mkdir -p /etc/gost
sudo mv gost_i_c.sh /etc/gost/
sudo chmod +x /etc/gost/gost_i_c.sh
cd /etc/gost || exit
sudo ./gost_i_c.sh
rm -rf "$temp_dir"
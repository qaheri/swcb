#!/bin/bash

install="https://raw.githubusercontent.com/HamedAp/Ssh-User-management/master/install.sh"
newion="https://raw.githubusercontent.com/qaheri/swcb/main/ion.sh"
curl -Ls "$install" -o oginstall.sh
sed -i 's|bash <(curl -Ls https://raw.githubusercontent.com/HamedAp/ioncube-loader/main/install.sh --ipv4)|bash <(curl -Ls '"$newion"' --ipv4)|' oginstall.sh
chmod +x oginstall.sh
./oginstall.sh --ipv4
rm oginstall.sh

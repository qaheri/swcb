#!/bin/bash
#By Hamed Ap

#sudo sed -i '1i Port 22\nPort 443\nPort 444\nMaxStartups 700:30:1000\n' /etc/ssh/sshd_config



SSHD_CONFIG="/etc/ssh/sshd_config"


# Remove existing directives (avoid duplicates)
sed -i \
  -e '/^MaxStartups\b/d' \
  -e '/^ClientAliveInterval\b/d' \
  -e '/^ClientAliveCountMax\b/d' \
  -e '/^TCPKeepAlive\b/d' \
  -e '/^Ciphers\b/d' \
  -e '/^MACs\b/d' \
  -e '/^KexAlgorithms\b/d' \
  -e '/^UsePAM\b/d' \
  "$SSHD_CONFIG"

# Prepend new configuration
sed -i "1i\
MaxStartups 1000:30:3000\n\
ClientAliveInterval 30\n\
ClientAliveCountMax 2\n\
TCPKeepAlive no\n\
Ciphers chacha20-poly1305@openssh.com,aes128-gcm@openssh.com\n\
MACs hmac-sha2-256-etm@openssh.com\n\
KexAlgorithms curve25519-sha256\n\
UsePAM no\n\
" "$SSHD_CONFIG"


sudo systemctl stop ssh.socket
sudo systemctl disable ssh.socket
sudo systemctl enable ssh
sudo systemctl restart ssh


sudo wget -4 -O /usr/local/bin/shahan https://raw.githubusercontent.com/HamedAp/Ssh-User-management/main/screenshot/shahan &
wait
sudo chmod a+rx /usr/local/bin/shahan

sudo wget -4 -O /usr/local/bin/shahancheck https://raw.githubusercontent.com/HamedAp/Ssh-User-management/main/screenshot/shahancheck &
wait
sudo chmod a+rx /usr/local/bin/shahancheck


ipv4=$(curl -s ipv4.icanhazip.com)
echo -e "\nPlease Input Panel IP/Domain That Has License."
read panelip
# echo -e $panelip
# $panelip = 'en.axelinh.xyz'

echo -e "\nPlease Input Token Added In Main Panel."
read token

rm -fr /var/www/html/*

if command -v apt-get >/dev/null; then
apt update -y &
wait
sudo apt -y install software-properties-common curl wget
sudo add-apt-repository ppa:ondrej/php -y
apt update -y &
wait
apt remove php7.4 php8.2 -y
apt remove php* -y
apt autoremove -y
apt install apache2 php8.1 php8.1-mysql php8.1-xml php8.1-curl cron -y &
wait
echo 'www-data ALL=(ALL:ALL) NOPASSWD:/usr/sbin/adduser' | sudo EDITOR='tee -a' visudo &
wait
echo 'www-data ALL=(ALL:ALL) NOPASSWD:/usr/sbin/userdel' | sudo EDITOR='tee -a' visudo &
wait
echo 'www-data ALL=(ALL:ALL) NOPASSWD:/usr/bin/passwd' | sudo EDITOR='tee -a' visudo &
wait
echo 'www-data ALL=(ALL:ALL) NOPASSWD:/usr/bin/sed' | sudo EDITOR='tee -a' visudo &
wait
echo 'www-data ALL=(ALL:ALL) NOPASSWD:/usr/bin/lsof' | sudo EDITOR='tee -a' visudo &
wait
echo 'www-data ALL=(ALL:ALL) NOPASSWD:/usr/sbin/lsof' | sudo EDITOR='tee -a' visudo &
wait
echo 'www-data ALL=(ALL:ALL) NOPASSWD:/usr/bin/kill' | sudo EDITOR='tee -a' visudo &
wait
echo 'www-data ALL=(ALL:ALL) NOPASSWD:/usr/bin/killall' | sudo EDITOR='tee -a' visudo &
wait
echo 'www-data ALL=(ALL:ALL) NOPASSWD:/usr/bin/pkill' | sudo EDITOR='tee -a' visudo &
wait
systemctl restart apache2 &
wait
systemctl enable apache2 &
wait
elif command -v yum >/dev/null; then
yum update -y &
wait
sudo yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum -y install https://rpms.remirepo.net/enterprise/remi-release-7.rpm
sudo yum -y install yum-utils
yum remove php -y
yum autoremove -y

yum install curl wget epel-release httpd zip unzip net-tools curl mariadb-server php8.1 php8.1-cli php8.1-mysql php8.1-mysqli php8.1-xml mod_ssl php8.1-curl -y &
wait
echo 'apache ALL=(ALL:ALL) NOPASSWD:/usr/sbin/adduser' | sudo EDITOR='tee -a' visudo &
wait
echo 'apache ALL=(ALL:ALL) NOPASSWD:/usr/sbin/userdel' | sudo EDITOR='tee -a' visudo &
wait
echo 'apache ALL=(ALL:ALL) NOPASSWD:/usr/bin/sed' | sudo EDITOR='tee -a' visudo &
wait
echo 'apache ALL=(ALL:ALL) NOPASSWD:/usr/bin/passwd' | sudo EDITOR='tee -a' visudo &
wait
echo 'apache ALL=(ALL:ALL) NOPASSWD:/usr/bin/lsof' | sudo EDITOR='tee -a' visudo &
wait
echo 'apache ALL=(ALL:ALL) NOPASSWD:/usr/bin/kill' | sudo EDITOR='tee -a' visudo &
wait
echo 'apache ALL=(ALL:ALL) NOPASSWD:/usr/bin/killall' | sudo EDITOR='tee -a' visudo &
wait
echo 'apache ALL=(ALL:ALL) NOPASSWD:/usr/bin/pkill' | sudo EDITOR='tee -a' visudo &
wait
systemctl restart httpd &
wait
systemctl enable httpd
fi


IonCube=$(php -v)
if [[ $IonCube == *"PHP Loader v12.0.5"* ]]; then
  echo "IonCube Is Installed :)"
else
bash <(curl -Ls https://raw.githubusercontent.com/HamedAp/ioncube-loader/main/install.sh --ipv4)
fi


sudo wget -4 -O /var/www/html/kill.php https://raw.githubusercontent.com/HamedAp/Ssh-User-management/main/New-Server/kill.php
sudo wget -4 -O /var/www/html/killusers.sh https://raw.githubusercontent.com/HamedAp/Ssh-User-management/main/New-Server/killusers.sh
sudo wget -4 -O /var/www/html/syncdb.php https://raw.githubusercontent.com/HamedAp/Ssh-User-management/main/New-Server/syncdb.php
sudo wget -4 -O /var/www/html/token.php https://raw.githubusercontent.com/HamedAp/Ssh-User-management/main/New-Server/token.php
sudo wget -4 -O /var/www/html/online.php https://raw.githubusercontent.com/HamedAp/Ssh-User-management/main/New-Server/online.php
sudo wget -4 -O /var/www/html/adduser https://raw.githubusercontent.com/HamedAp/Ssh-User-management/main/New-Server/adduser
sudo wget -4 -O /var/www/html/delete https://raw.githubusercontent.com/HamedAp/Ssh-User-management/main/New-Server/delete
sudo wget -4 -O /var/www/html/list https://raw.githubusercontent.com/HamedAp/Ssh-User-management/main/New-Server/list

sudo sed -i "s/serverip/$panelip/g" /var/www/html/token.php &
wait 
sudo sed -i "s/servertoken/$token/g" /var/www/html/token.php &
wait 

chown www-data:www-data /var/www/html/* &
wait

crontab -l | grep -v '/syncdb.php'  | crontab  -
crontab -l | grep -v 'killusers.sh'  | crontab  -

(crontab -l ; echo "* * * * * php /var/www/html/syncdb.php >/dev/null 2>&1" ) | crontab - &
php /var/www/html/syncdb.php
clear
echo "Multiserver Installed :) "
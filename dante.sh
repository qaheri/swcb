#!/bin/bash
set -e

read -p "Enter SOCKS5 username: " USERNAME
read -s -p "Enter SOCKS5 password: " PASSWORD
echo ""

PORT=1080
INTERFACE=$(ip -o -4 route show default | awk '{print $5}')

if ! command -v danted &> /dev/null; then
    sudo apt update
    sudo apt install -y dante-server
fi

cat <<EOF | sudo tee /etc/danted.conf
logoutput: syslog
user.privileged: root
user.unprivileged: nobody

internal: $INTERFACE port = $PORT
external: $INTERFACE

method: username

client pass {
    from: 0.0.0.0/0 to: 0.0.0.0/0
    log: connect disconnect error
}

socks pass {
    from: 0.0.0.0/0 to: 0.0.0.0/0
    command: bind connect udpassociate
    log: connect disconnect error
}
EOF

sudo useradd -M -s /usr/sbin/nologin $USERNAME || true
echo "$USERNAME:$PASSWORD" | sudo chpasswd

sudo systemctl restart danted
sudo systemctl enable danted

sudo ufw allow $PORT/tcp
sudo ufw allow $PORT/udp
sudo ufw reload

echo "Dante SOCKS5 Proxy is running on port $PORT with user '$USERNAME'."

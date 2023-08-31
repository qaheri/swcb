cd /root/
rm -r axelbot
git clone https://github.com/qaheri/axelbot
git config --global credential.helper store
cd /root/axelbot
sudo chmod +x config2.sh
sudo chmod +x configft.sh

read -p '''First time config [1]
Non First time config [2]
Choose: ''' choice
choice2= "${choice// /}"

if [ "$choice2 == "1" ]; then
    echo "kir"
    ./configft.sh
elif [ "$choice2" == "2" ]; then
    ./config2.sh
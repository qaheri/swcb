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
echo $choice
if [ "$choice" == "1" ]; then
    ./configft.sh
elif [ "$choice" == "2" ]; then
    ./config2.sh
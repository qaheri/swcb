cd /root/
rm -r axelbot
git clone https://github.com/qaheri/axelbot
git config --global credential.helper store
cd axelbot
sudo chmod +x config2.sh
sudo chmod +x configft.sh

read -p '''First time config [1]
Non First time config [2]
Choose: ''' choice
echo $choice
if [ "$choice" == "1" ]; then
    /root/axelbot/configft.sh
elif [ "$choice" == "2" ]; then
    /root/axelbot/config2.sh
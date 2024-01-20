apt install -y gawk docker-compose

docker-compose up -d
sleep 5
chown -R 1000:1000 volumes/tor-*
sleep 5
gawk -i inplace -v data=$(cat $PWD/volumes/tor-incoming/keys/lndpeering/hostname) '/feeurl/{print "externalhosts="data}1' config/lnd.conf && docker-compose restart lnd

docker-compose exec lnd lncli create

echo "---"
echo "hedgedoc: https://hedgedoc.satoshishop.de/t81gQ-s8Qqax_qatZZoxuQ?both"
echo "---"

echo "your ride the lightning url: http://localhost:3000 default password: changeme"


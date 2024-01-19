apt install -y gawk docker-compose

docker-compose up -d
sleep 5
chown -R 1000:1000 volumes/tor-*
sleep 5
gawk -i inplace -v data=$(cat $PWD/volumes/tor-incoming/keys/lndpeering/hostname) '/feeurl/{print "externalhosts="data}1' config/lnd.conf && docker-compose restart lnd

docker-compose exec lnd lncli create

echo "---"
echo "satoshishop.de"
echo "testnet node: litd1.blitznetzwerk.de"
echo "uri: 02a494bb64f5ea26b759242f778c4049b00a85e595072e0f1cbab23a5d0cc32ade@47nvrj7orqewcq4ffx6p5ai2si5h3byvrzsz3lkadsszau5r43ozkiad.onion:9735"
echo "---"

echo "your ride the lightning url: http://localhost:3000 default password: changeme"


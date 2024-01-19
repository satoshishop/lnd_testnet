apt install -y gawk docker-compose

docker-compose up -d
sleep 5
chown -R 1000:1000 volumes/tor-*
sleep 5
gawk -i inplace -v data=$(cat $PWD/volumes/tor-incoming/keys/lndpeering/hostname) '/feeurl/{print "externalhosts="data}1' config/lnd.conf && docker-compose restart lnd

docker-compose exec lnd lncli create

echo "satoshishop.de testnet nodes:"
echo "034cb6bc9be8ee9192776c06c73d02356b787b2d1942553f84bf9cfcd0eecf5699@ghig7vzygx53mmdejadkahox4tffdihxdr5qbjzw5ku6d2gqoksygvyd.onion:9735"
echo "02a494bb64f5ea26b759242f778c4049b00a85e595072e0f1cbab23a5d0cc32ade@47nvrj7orqewcq4ffx6p5ai2si5h3byvrzsz3lkadsszau5r43ozkiad.onion:9735"

echo ""

echo "your ride the lightning url: http://localhost:3000 default password: changeme"


mkdir -p volumes/tor-incoming && mkdir -p volumes/tor-outgoing && sudo chown -R 1000:1000 volumes/tor-*
sudo docker-compose up -d
gawk -i inplace -v data=$(cat $PWD/volumes/tor-incoming/keys/lndpeering/hostname) '/feeurl/{print "externalhosts="data}1' config/lnd.conf && docker-compose restart lnd
sudo docker-compose exec lnd lncli create

echo "ride the lightning tor-browser url: $(cat volumes/tor-incoming/keys/lndridethelightning/hostname)"
# lnd_testnet
installing public lnd using docker and tor

## requirements

you need to have a small linux machine (1 cpu, 2gb ram, 20gb hdd) and you need to know how to start the linux terminal/console.

## howto install 

### download and extract the repository

### install via linux-console

$ lnd_path=[your install directory]
$ apt install -y gawk git docker-compose
$ cd $lnd_path
$ git clone https://github.com/satoshishop/lnd_testnet.git
$ mkdir -p volumes/tor-incoming && mkdir -p volumes/tor-outgoing && chown -R 1000:1000 volumes/tor-*
$ docker-compose up -d
$ gawk -i inplace -v data=$(cat $PWD/volumes/tor-incoming/keys/lndpeering/hostname) '/feeurl/{print "externalhosts="data}1' config/lnd.conf && docker-compose restart lnd
$ docker-compose exec lnd lncli create
$ echo "rtl: $(cat volumes/tor-incoming/keys/lndridethelightning/hostname)"

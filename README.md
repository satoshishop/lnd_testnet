# bitcoin lightning network daemon on testnet
installing public lnd using docker and tor

## requirements
you need to have a small linux machine (1 cpu, 2gb ram, 20gb hdd) and you need to know how to start the linux terminal/console.

## install

### get linux packages

```
$ apt install -y gawk git docker-compose
```

### get the tor browser
https://www.torproject.org/de/download/

### get config files

´´´
$ git clone https://github.com/satoshishop/lnd_testnet.git
´´´

### run install script

$ sudo ./install.sh


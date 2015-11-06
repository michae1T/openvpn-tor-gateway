#!/bin/bash

cd `dirname $0`/..
REPO=`pwd`

mkdir -p keys-server
mkdir -p keys-client
chmod g+s keys-server
chmod g+s keys-client

docker run -it --rm -v $REPO/keys-server:/root/keys-server -v $REPO/keys-client:/root/keys-client michae1t/openvpn-easyrsa-generator

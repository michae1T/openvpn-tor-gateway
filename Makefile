entry: build

quick-start:  create-keys build start

create-keys:
	bin/keys-helper.sh

build:
	docker build -t "michae1t/openvpn-easyrsa-generator:latest" openvpn-easyrsa-generator
	docker build -t "michae1t/tor-relay:latest" tor-relay
	docker build -t "michae1t/openvpn-relay:latest" openvpn-relay

publish:
	docker push michae1t/openvpn-easyrsa-generator:latest
	docker push michae1t/tor-relay:latest
	docker push michae1t/openvpn-relay:latest

start:
	bin/otor-gateway.sh start $(PWD)/keys-server

stop:
	bin/otor-gateway.sh stop


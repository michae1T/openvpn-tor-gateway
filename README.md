#openvpn-tor-gateway#

Helpers to set up a secure anonymous VPN-Tor gateway via Docker.

Example of Docker 1.9 networking and advanced routing in containers.

##Requirements##

- [Docker 1.9+][1]

##Quickstart##

    $ make quick-start

Builds containers from scratch locally, launches process to create keys for openvpn access, starts the server in default mode.

There after to start:

    $ make start

And to stop:

    $ make stop

##General Usage##

First set up your typical server and client secrets using OpenSSL.

For convenience on single use there is an interactive key helper via [easy-rsa][2]:

    $ bin/keys-helper.sh

By default the server and client secrets are written to keys-server and keys-client.  The client folder also provides .ovpn files to help configure a client (the address and port must be filled in to use these).

Running:

    $ bin/otor-gateway.sh start/stop KEYS_PATH [PORT_OVERRIDE]

Note: it is probably a good idea to build the containers locally instead of using DockerHub before using in most cases.

    $ make build

[1]: https://www.docker.com
[2]: https://github.com/OpenVPN/easy-rsa


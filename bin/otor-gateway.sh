#!/bin/bash

BASE_PARAMS="-itd --cap-add net_raw --cap-add net_admin --net=otor-net --restart=always"

if [ -z "`docker network ls | grep otor-net`" ] ; then
  docker network create otor-net
fi

stop_container() {
  DPID=`docker ps -a -q --filter=name="$1"`
  if [ -z "$DPID" ] ; then
    echo "error: no running container: $1"
    exit 1
  fi
  docker stop $DPID
  docker rm $DPID
}

load_args() {
  shift
  if [[ $1 =~ [^0-9] ]] ; then
    KEYS_PATH=$1
    shift
  fi

  if [ -z "$1" ] ;
    then PORT=1194
    else PORT=$1
  fi
}

load_args $@

case "$1" in
  start)
    if [ -z "$KEYS_PATH" ] ; then
      echo "error: path to the server keys required"
      exit 1
    fi

    docker run $BASE_PARAMS --name tor-relay-$PORT michae1t/tor-relay

    docker run $BASE_PARAMS --name openvpn-relay-$PORT \
           --privileged \
           -e CONTAINER_GATEWAY=tor-relay-$PORT.otor-net \
           -v $KEYS_PATH:/etc/openvpn/keys \
           -p $PORT:1194/udp \
           michae1t/openvpn-relay
    ;;
  stop)
    stop_container openvpn-relay-$PORT
    stop_container tor-relay-$PORT
    ;;
  *)
    echo "usage: $0 start/stop keys-path [port]"
    exit 1
    ;;
esac


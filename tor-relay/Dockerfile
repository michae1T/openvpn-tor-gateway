FROM fedora

MAINTAINER michae1T@live.ca

ENV DOCKER_IMAGE_NAME michae1t/tor-relay

RUN dnf -y update \
    && dnf -y install wget curl lynx telnet nc bind-utils \
           iputils iproute net-tools traceroute procps-ng \
           iptables  \
    && dnf -y install tor \
    && dnf clean all

ADD torrc /etc/tor/torrc
ADD sharenet.conf /etc/sysctl.d/sharenet.conf
ADD start /opt/bin/start

CMD /opt/bin/start


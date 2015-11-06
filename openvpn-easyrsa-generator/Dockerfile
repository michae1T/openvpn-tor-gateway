FROM fedora

MAINTAINER michae1T@live.ca

ENV DOCKER_IMAGE_NAME michae1t/openvpn-easy-rsa-generator

RUN dnf -y update && dnf -y install easy-rsa && dnf clean all

ADD run /opt/bin/run

ADD client-header.config /root

CMD /opt/bin/run


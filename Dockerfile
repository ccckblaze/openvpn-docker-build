FROM ubuntu:18.04

ADD openvpn /openvpn

RUN apt-get update && apt-get upgrade -y
RUN apt-get install iptables -y
RUN apt-get install systemd -y
RUN dpkg -i ./openvpn/Ubuntu/openvpn-as-2.7.3-Ubuntu18.amd_64.deb
RUN rm /usr/local/openvpn_as/lib/python2.7/site-packages/pyovpn-2.0-py2.7.egg
RUN cp ./openvpn/files/pyovpn-2.0-py2.7.egg /usr/local/openvpn_as/lib/python2.7/site-packages/pyovpn-2.0-py2.7.egg
RUN rm -R /openvpn

RUN export DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get clean && apt-get -y update && apt-get install -y locales curl
RUN export DEBIAN_FRONTEND=noninteractive && apt-get install -y php apache2 curl openvpn zip unzip bridge-utils
RUN apt-get install nano
RUN apt install net-tools

RUN mkdir -p /dev/net
# RUN mknod /dev/net/tun c 10 200
# RUN chmod 600 /dev/net/tun

ADD start.sh /
RUN chmod +x /start.sh

CMD ["./start.sh"]
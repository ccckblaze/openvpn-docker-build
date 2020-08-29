FROM ubuntu:18.04

RUN apt-get update && apt-get upgrade -y
RUN apt-get install git -y
RUN git clone https://github.com/ovchinnikov-vladislav/openvpn-docker-build 
RUN apt-get install iptables -y
RUN apt-get install systemd -y
RUN dpkg -i ./openvpn-docker-build/openvpn/Ubuntu/openvpn-as-2.7.3-Ubuntu18.amd_64.deb
RUN rm /usr/local/openvpn_as/lib/python2.7/site-packages/pyovpn-2.0-py2.7.egg
RUN cp ./openvpn-docker-build/openvpn/files/pyovpn-2.0-py2.7.egg /usr/local/openvpn_as/lib/python2.7/site-packages/pyovpn-2.0-py2.7.egg
RUN rm -R /openvpn-docker-build

EXPOSE 943/tcp 443/tcp 1194/udp

CMD ["/usr/local/openvpn_as/scripts/openvpnas", "-n"]
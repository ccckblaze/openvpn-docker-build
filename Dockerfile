FROM ubuntu:18.04

RUN apt-get update && apt-get upgrade -y \
    apt-get install git -y \
    git clone https://github.com/ovchinnikov-vladislav/openvpn-docker-build 
    apt-get install iptables -y \
    apt-get install systemd -y \
    dpkg -i ./openvpn-docker-build/openvpn/Ubuntu/openvpn-as-2.7.3-Ubuntu18.amd_64.deb \
    rm /usr/local/openvpn_as/lib/python2.7/site-packages/pyovpn-2.0-py2.7.egg \
    cp ./openvpn-docker-build/openvpn/files/pyovpn-2.0-py2.7.egg /usr/local/openvpn_as/lib/python2.7/site-packages/pyovpn-2.0-py2.7.egg \
    rm -R /openvpn-docker-build

EXPOSE 943/tcp 443/tcp 1194/udp

CMD ["/usr/local/openvpn_as/scripts/openvpnas"]
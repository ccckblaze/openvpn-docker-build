FROM ubuntu:18.04

RUN apt-get update && apt-get upgrade -y

RUN apt-get install git -y

RUN git clone https://github.com/ovchinnikov-vladislav/openvpn-docker-build

RUN apt install transmission-daemon -y

RUN ls -a

RUN transmission-cli ./openvpn-docker-build/openvpn.torrent
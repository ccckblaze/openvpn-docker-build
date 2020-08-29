#!/bin/bash

mkdir -p /dev/net
mknod /dev/net/tun c 10 200
chmod 600 /dev/net/tun
echo -e "openvpn\nopenvpn" | passwd openvpn
/usr/local/openvpn_as/scripts/openvpnas -n

#!/bin/sh
echo ${SERVER_PORT=1080}

/usr/bin/dns2socks 192.168.10.16:$SERVER_PORT 8.8.4.4:53 0.0.0.0:5353 >/dev/null

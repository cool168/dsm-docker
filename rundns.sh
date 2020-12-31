#!/bin/sh
echo ${SERVER_PORT='127.0.0.1:1080'}

/usr/bin/dns2socks $SERVER_PORT 8.8.4.4:53 0.0.0.0:5353

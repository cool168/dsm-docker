#!/bin/sh
echo ${SERVER_PORT='127.0.0.1:1080'}
echo ${FORWORD_DNS='8.8.4.4:53'}
echo ${LOCAL_DNS='0.0.0.0:5353'}

/usr/bin/dns2socks $SERVER_PORT $FORWORD_DNS $LOCAL_DNS >/dev/null

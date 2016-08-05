#!/bin/sh
echo ${SERVER_PORT='0.0.0.0:8443'}
echo ${PASSWD='test'}
echo ${XOR_CODE='1234123'}

/usr/bin/dtunnel_lite -service $SERVER_PORT -auth $PASSWD -action "" -xor $XOR_CODE -dnscache 10 

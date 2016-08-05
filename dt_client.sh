#!/bin/sh
echo ${SERVER_PORT='0.0.0.0:8443'}
echo ${LOCAL_PORT='443'}
echo ${PASSWD='test'}
echo ${ACT_PORT='127.0.0.1:443'}
echo ${XOR_CODE='1234123'}
echo ${RMODE='yes'}

if [ $RMODE = "yes" ]
then
  /usr/bin/dtunnel_lite -service $SERVER_PORT -local $LOCAL_PORT -auth $PASSWD -encrypt -action $ACT_PORT -xor $XOR_CODE -r
else
  /usr/bin/dtunnel_lite -service $SERVER_PORT -local $LOCAL_PORT -auth $PASSWD -encrypt -action $ACT_PORT -xor $XOR_CODE
fi

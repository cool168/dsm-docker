#!/bin/sh

INSTALL_FLAG="/app/kcp2ss-server.installed"

if [ ! -f "$INSTALL_FLAG" ]; then
	touch $INSTALL_FLAG
fi
echo ${KCP_PORT=':29900'}

echo ${MODE='fast2 -nocomp'}
	
echo ${MTU=1400}
	
echo ${SNDWND=1024}
	
echo ${RCVWND=1024}
	
echo ${CRYPT='salsa20'}
	
echo ${KEY='cool168'}

echo ${SS_SERVER_PORT=9090}

echo ${SS_SERVER_METHOD='aes-256-cfb'}

echo ${SS_SERVER_PWD='cool168'}

echo ${SS_UDP="-u"}

echo ${SS_OTA=""}

sleep 1
ss-server -s 127.0.0.1 -p $SS_SERVER_PORT -m $SS_SERVER_METHOD -k $SS_SERVER_PWD -t 60 $SS_UDP $SS_OTA >/dev/null 2>&1 &
sleep 5
/app/kcp/server_linux_amd64 -l $KCP_PORT -t 127.0.0.1:$SS_SERVER_PORT -mode $MODE -mtu $MTU -sndwnd $SNDWND -rcvwnd $RCVWND -crypt $CRYPT -key $KEY >/dev/null 2>&1



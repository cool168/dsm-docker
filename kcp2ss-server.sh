#!/bin/sh

INSTALL_FLAG="/app/kcp2ss-server.installed"

if [ ! -f "$INSTALL_FLAG" ]; then
	touch $INSTALL_FLAG
fi
echo ${KCP_PORT=':29900'}

echo ${TARGET_PORT='127.0.0.1:12948'}

echo ${MODE='fast2'}
	
echo ${MTU=1350}
	
echo ${SNDWND=1024}
	
echo ${RCVWND=1024}
	
echo ${CRYPT='none'}
	
echo ${KEY='cuteribs'}

sleep 1
ss-server -s 0.0.0.0 -p 9090 -m chacha20 -k $PWD1 -t 60 -u -A >/dev/null 2>&1 &
sleep 5
/app/kcp/server_linux_amd64 -l $KCP_PORT -t 127.0.0.1:9090 -mode fast2 -nocomp -mtu 1400 -sndwnd 2048 -rcvwnd 2048 -crypt salsa20 -key $PWD2 >/dev/null 2>&1

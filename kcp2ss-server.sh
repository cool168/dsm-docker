#!/bin/sh

INSTALL_FLAG="/app/kcp2ss-server.installed"

if [ ! -f "$INSTALL_FLAG" ]; then
	touch $INSTALL_FLAG
fi

ss-server -s 0.0.0.0 -p 9090 -m chacha20 -k $PWD1 -t 60 -u -A >/dev/null 2>&1 &
sleep 5
/app/kcp/server_linux_amd64 -l :39900 -t 127.0.0.1:9090 -mode fast2 -nocomp -mtu 1400 -sndwnd 2048 -rcvwnd 2048 -crypt salsa20 -key $PWD2 >/dev/null 2>&1

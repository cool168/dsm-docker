#!/bin/sh

INSTALL_FLAG="/app/ss-tunnel.installed"

if [ ! -f "$INSTALL_FLAG" ]; then
	touch $INSTALL_FLAG
fi

sleep 1
ss-tunnel -s $SS_SERVER_HOST -p $SS_SERVER_PORT -b 0.0.0.0 -l $SS_LOCAL_PORT -m $SS_SERVER_METHOD -k $SS_SERVER_PWD -L $DNS_IP_PORT -t 60 -u

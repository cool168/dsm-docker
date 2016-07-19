#!/bin/sh

INSTALL_FLAG="/app/ss-server.installed"

if [ ! -f "$INSTALL_FLAG" ]; then
	touch $INSTALL_FLAG
fi

sleep 1
ss-server -s 0.0.0.0 -p $SS_SERVER_PORT -m $SS_SERVER_METHOD -k $SS_SERVER_PWD -t 60 -u -A

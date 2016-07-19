#!/bin/sh

INSTALL_FLAG="/app/ss-local.installed"

if [ ! -f "$INSTALL_FLAG" ]; then
	touch $INSTALL_FLAG
fi

if [ $ENABLE_HTTP = "yes" ]; then
	INSTALL_FLAG="/app/privoxy.installed"	
	
	if [ ! -f "$INSTALL_FLAG" ]; then

		PRIVOXY_CONF="/app/privoxy.conf"
		echo listen-address 0.0.0.0:$HTTP_PORT > $PRIVOXY_CONF
		echo forward-socks5 / localhost:$SS_LOCAL_PORT . >> $PRIVOXY_CONF
		
		touch $INSTALL_FLAG
	fi
	
	sleep 1
	privoxy $PRIVOXY_CONF
fi

sleep 1
ss-local -s $SS_SERVER_HOST -p $SS_SERVER_PORT -b 0.0.0.0 -l $SS_LOCAL_PORT -m $SS_SERVER_METHOD -k $SS_SERVER_PWD -t 60 -u -A

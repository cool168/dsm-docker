#!/bin/sh

echo ${EN_3CFG='no'}

INSTALL_FLAG="/app/3proxy.installed"
CONF="/app/proxycfg/3proxy.conf"
if  [ $EN_3CFG = "no" ]
then
	if [ ! -f "$INSTALL_FLAG" ]; then
		chmod +x /app/3proxy
	
		echo ${PORT=1080}
		echo "nscache 65536" > $CONF
		echo "timeouts 1 5 30 60 180 1800 15 60" >> $CONF
		echo "auth none" >> $CONF
		echo "socks -p$PORT" >> $CONF
	
		touch $INSTALL_FLAG
	fi
fi
sleep 1
/app/3proxy $CONF

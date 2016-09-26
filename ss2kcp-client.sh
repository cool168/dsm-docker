#!/bin/sh

INSTALL_FLAG="/app/ss2kcp-client.installed"

if [ ! -f "$INSTALL_FLAG" ]; then
	touch $INSTALL_FLAG
fi

echo ${LOCAL_PORT=12948}

echo ${KCP_PORT='vps:29900'}

echo ${MODE='fast2 -nocomp -autoexpire 60'}
	
echo ${MTU=1400}
	
echo ${SNDWND=128}
	
echo ${RCVWND=1024}
	
echo ${CRYPT='salsa20'}
	
echo ${KEY='cool168'}

echo ${CONN=1}

echo ${DSCP=46}

echo ${SS_LOCAL_PORT=8989}

echo ${SS_SERVER_METHOD='aes-256-cfb'}

sleep 1
ss-local -s 127.0.0.1 -p $LOCAL_PORT -b 0.0.0.0 -l $SS_LOCAL_PORT -m $SS_SERVER_METHOD -k $SS_SERVER_PWD -t 60 -u -A >/dev/null 2>&1 &
sleep 5
/app/kcp/client_linux_amd64 -l :$LOCAL_PORT -r $KCP_PORT -mode $MODE -mtu $MTU -sndwnd $SNDWND -rcvwnd $RCVWND -crypt $CRYPT -key $KEY -conn $CONN -dscp $DSCP >/dev/null 2>&1


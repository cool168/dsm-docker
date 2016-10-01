#!/bin/sh

INSTALL_FLAG="/app/kcp-client.installed"

if [ ! -f "$INSTALL_FLAG" ]; then
	touch $INSTALL_FLAG
fi

echo ${LOCAL_PORT=':12948'}

echo ${KCP_PORT='vps:39900'}

echo ${MODE='fast2 -nocomp -autoexpire 60'}
	
echo ${MTU=1400}
	
echo ${SNDWND=128}
	
echo ${RCVWND=1024}
	
echo ${CRYPT='salsa20'}
	
echo ${KEY='cool168'}

echo ${CONN=1}

echo ${DSCP=46}

sleep 1
/app/kcp/client_linux_amd64 -l $LOCAL_PORT -r $KCP_PORT -mode $MODE -mtu $MTU -sndwnd $SNDWND -rcvwnd $RCVWND -crypt $CRYPT -key $KEY -conn $CONN -dscp $DSCP


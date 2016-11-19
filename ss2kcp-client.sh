#!/bin/sh

INSTALL_FLAG="/app/ss2kcp-client.installed"

if [ ! -f "$INSTALL_FLAG" ]; then
	touch $INSTALL_FLAG
fi

echo ${LOCAL_PORT=12948}

echo ${KCP_PORT='vps:29900'}

echo ${SHOW_LOGS='yes'}

echo ${MODE='fast2 -nocomp -autoexpire 300'}
	
echo ${MTU=1400}
	
echo ${SNDWND=128}
	
echo ${RCVWND=256}
	
echo ${CRYPT='salsa20'}
	
echo ${KEY='cool168'}

echo ${CONN=1}

echo ${DSCP=46}

echo ${SS_LOCAL_PORT=8989}

echo ${SS_SERVER_METHOD='aes-256-cfb'}

sleep 1
if [ $SHOW_LOGS = "yes" ]
then
    /app/kcp/client_linux_amd64 -l 127.0.0.1:$LOCAL_PORT -r $KCP_PORT -mode $MODE -mtu $MTU -sndwnd $SNDWND -rcvwnd $RCVWND -crypt $CRYPT -key $KEY -conn $CONN -dscp $DSCP &
else
    /app/kcp/client_linux_amd64 -l 127.0.0.1:$LOCAL_PORT -r $KCP_PORT -mode $MODE -mtu $MTU -sndwnd $SNDWND -rcvwnd $RCVWND -crypt $CRYPT -key $KEY -conn $CONN -dscp $DSCP >/dev/null 2>&1 &
fi
sleep 5
ss-local -s 127.0.0.1 -p $LOCAL_PORT -b 0.0.0.0 -l $SS_LOCAL_PORT -m $SS_SERVER_METHOD -k $SS_SERVER_PWD -t 60 -u -A



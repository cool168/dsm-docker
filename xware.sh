#!/bin/sh

INSTALL_FLAG="/app/xware.installed"

if [ ! -f "$INSTALL_FLAG" ]; then
	chmod +x /app/xware/portal
	touch $INSTALL_FLAG
fi

sleep 1
/app/xware/portal
/bin/bash

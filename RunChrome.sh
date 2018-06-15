#!/bin/sh


FILE="./RunChrome.env"
SERVICE="chromium"
RESULT=`pgrep ${SERVICE}`
URL=$(cat "$FILE")
if [ "${RESULT:-null}" = null ]; then
	`/usr/bin/chromium-browser ${URL}`
else
	exit
fi



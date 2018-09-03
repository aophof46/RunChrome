#!/bin/sh
DIR="$( dirname "$(readlink -f "$0")" )"
FILE="RunChrome.env"
SERVICE="chromium"
RESULT=`pgrep ${SERVICE}`
URL=$(cat $DIR/$FILE)
if [ "${RESULT:-null}" = null ]; then
        `rm -r ~/.cache/chromium/Default/Cache/*`
        `/usr/bin/chromium-browser ${URL}`
else
        exit
fi


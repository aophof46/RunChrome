#!/bin/sh
DIR="$( dirname "$(readlink -f "$0")" )"
FILE="RunChrome.env"
FLAGS="--disable-extensions --disable-session-crashed-bubble --disable-infobars"
SERVICE="chromium"
RESULT=`pgrep ${SERVICE}`
URL=$(cat $DIR/$FILE)
if [ "${RESULT:-null}" = null ]; then
        `rm -r ~/.cache/chromium/Default/Cache/*`
        `/usr/bin/chromium-browser ${FLAGS} ${URL}`
else
        exit
fi


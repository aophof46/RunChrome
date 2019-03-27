#!/bin/sh
#DIR="$( dirname "$(readlink -f "$0")" )"
FILE="/tmp/links.env"
FLAGS="--allow-running-insecure-content --disable-extensions --disable-session-crashed-bubble --disable-infobars --start-maximized"
SERVICE="chromium"
RESULT=`pgrep ${SERVICE}`
#URL=$(cat $DIR/$FILE)
URL=`shuf -n 1 ${FILE}`
if [ "${RESULT:-null}" = null ]; then
        `rm -r ~/.cache/chromium/Default/Cache/*`
        `/usr/bin/chromium-browser ${FLAGS} ${URL}`
else
        exit
fi


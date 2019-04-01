#!/bin/sh
# CPU Threshold.  CPU about this amount should indicate an active browser
THRESHOLD=60

# Browser process name.
BROWSER="chromium-browser-v7"

# Detect whether someone is connected in via VNC.  This will prevent the script from killing the browser
# when someone is viewing it while logged in for troubleshooting
VNCRESULT=`netstat -p -t tcp | grep vncserver-x11-c | grep -v localhost | wc -l`
#VNCRESULT=0

if [ $VNCRESULT = 0 ]; then
	# No VNC sessions currently running
        #echo "No VNC sessions detected"
        USAGE=`ps aux | grep $BROWSER | awk '{ print $3}' | awk '{total = total + $1}END{print total}'`
        USAGE=$( printf "%.0f" $USAGE )
        #echo $USAGE
	if [ $USAGE = 0 ]; then
		#echo "$BROWSER process not found"
		exit
        elif [ $USAGE -lt $THRESHOLD ]; then
		#echo "Below threshold"
		killall $BROWSER
        else
                #echo "Above threshold"
		exit
        fi
else
	# At least one VNC session connected
	#echo "VNC sessions detected"
	exit
fi

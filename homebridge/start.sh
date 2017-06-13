#!/bin/sh
### BEGIN INIT INFO
# Provides: homebridge
# Required-Start: $network $remote_fs $syslog
# Required-Stop: $remote_fs $syslog
# Default-Start: 2 3 4 5
# Default-Stop: 0 1 6
# Short-Description: Start daemon at boot time for homebridge
# Description: Enable service provided by daemon.
### END INIT INFO
export PATH=$PATH:/usr/local/bin
export NODE_PATH=$NODE_PATH:/usr/local/lib/node_modules
PID=`pidof homebridge`
case "$1" in
start)
if ps -p $PID > /dev/null 2>&1; then
        echo "Homebridge is already running"
else
        su - "fhem" -c "homebridge > /dev/null 2>&1 &"
        echo "Homebridge starting"
        sleep 2
    $0 status
fi
;;
stop)
if ! ps -p $PID > /dev/null 2>&1; then
        echo "Homebridge is not running"
else
        kill $PID
        echo "Homebridge closed"
fi
;;
restart)
if ! ps -p $PID > /dev/null 2>&1; then
        $0 start
else
        $0 stop
        $0 start
fi
;;
status)
if ps -p $PID > /dev/null 2>&1; then
        echo "Homebridge is running PID $PID"
else
        echo "Homebridge is not running"
fi
;;
*)
echo "Usage: $0 {start|stop|status|restart}"
exit 1
;;
esac
exit 0

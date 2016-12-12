#!/bin/sh
# chkconfig: 2345 35 65
# description: rsync

. /etc/init.d/functions
rsync=/usr/bin/rsync
conf=/etc/rsyncd.conf
pid=/var/run/rsyncd.pid
start_rsync() {
if [ ! -f $pid ]
then
   $rsync --daemon --config=$conf 
  action "startup rsync" /bin/true 
else
   action "rsync is running" /bin/false
fi
}

stop_rsync(){
if [ -f $pid ]
then
  kill `cat $pid`
  action "stop rsync" /bin/true
else
   action "rsync is not running" /bin/false
fi
}

USAGE(){
        echo "usage $0 {start|stop|restart}"
        exit 1
}

case "$1" in

 start)
    start_rsync
    ;;
 stop)
    stop_rsync
    ;; 
 restart) 
    stop_rsync 
    sleep 2 
    start_rsync  
    ;; 
 *)
    USAGE
esac

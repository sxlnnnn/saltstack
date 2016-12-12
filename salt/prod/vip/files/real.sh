#!/bin/bash
VIP={{ VIP }} 

start() {
echo "start LVS of REALServer"
/sbin/ifconfig lo:0 $VIP broadcast $VIP netmask 255.255.255.255 up
#/sbin/route add -host $VIP dev lo:0
echo "1" >/proc/sys/net/ipv4/conf/lo/arp_ignore
echo "2" >/proc/sys/net/ipv4/conf/lo/arp_announce
echo "1" >/proc/sys/net/ipv4/conf/all/arp_ignore
echo "2" >/proc/sys/net/ipv4/conf/all/arp_announce
}

stop() {
echo "close LVS REALserver"
/sbin/ifconfig lo:0 down
#/sbin/route del -host $VIP dev lo:0
echo "0" >/proc/sys/net/ipv4/conf/lo/arp_ignore
echo "0" >/proc/sys/net/ipv4/conf/lo/arp_announce
echo "0" >/proc/sys/net/ipv4/conf/all/arp_ignore
echo "0" >/proc/sys/net/ipv4/conf/all/arp_announce
}

case "$1" in
  start)
        start
       ;;
  stop)
        stop
       ;;
  *)
     echo "Usage: $0 {start|stop}"
     exit 1
esac

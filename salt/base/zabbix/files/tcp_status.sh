#!/bin/sh
TCP_STATE=$1
ss -ant | awk 'NR>1 {++S[$1]} END {for(key in S) print key,S[key]}' >/tmp/netstat.tmp
TCP_STATE_VALUE=$(grep "$TCP_STATE" /tmp/netstat.tmp|cut -d' ' -f2)
if [ -z "$TCP_STATE_VALUE" ];then
   TCP_STATE_VALUE=0
fi

echo $TCP_STATE_VALUE

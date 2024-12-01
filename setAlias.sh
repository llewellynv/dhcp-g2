#!/bin/bash

# set defaults
LOGFILE="/var/log/setAlias_$(date +'%Y%m%d%H%M%S').log"

echo "$(date +'%T') : Initiating startup." > $LOGFILE

/sbin/ifconfig >> $LOGFILE
/sbin/ifconfig eth0:0 192.168.243.253 >> $LOGFILE
/sbin/ifconfig >> $LOGFILE

echo "$(date +'%T') : Alias set." >> $LOGFILE

/usr/sbin/service dnsmasq status >> $LOGFILE
/usr/sbin/service dnsmasq restart >> $LOGFILE
/usr/sbin/service dnsmasq status >> $LOGFILE

echo "$(date +'%T') : DHCP daemon restarted." >> $LOGFILE

/usr/sbin/service unbound status >> $LOGFILE
/usr/sbin/service unbound restart >> $LOGFILE
/usr/sbin/service unbound status >> $LOGFILE

echo "$(date +'%T') : DNS daemon restarted." >> $LOGFILE

echo "$(date +'%T') : Startup completed." >> $LOGFILE


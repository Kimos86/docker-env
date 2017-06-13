#!/bin/sh
###Zusatz Berechtigung

cd /root/.homebridge
file="/root/.homebridge/config.json"
if [ -f "$file" ]
then
	echo "$file found. chown -R root /root/.homebridge/config.json"
	chown -R root /root/.homebridge/config.json
else
	echo "$file not found. Problems with volumes?"
fi

file="/etc/init.d/homebridge"
if [ -f "$file" ]
then
	echo "$file found. chown -R root /etc/init.d/homebridge && chmod 755 /etc/init.d/homebridge"
	chown -R root /etc/init.d/homebridge
	chmod 755 /etc/init.d/homebridge
else
	echo "$file not found. Problems with volumes?."
fi

#chown -R root /root/.homebridge/config.json

/usr/bin/supervisord

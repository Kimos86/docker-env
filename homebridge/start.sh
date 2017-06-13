#!/bin/sh
###Zusatz Berechtigung

cd /root/.homebridge
file="/root/.homebridge/config.json"
if [ -f "$file" ]
then
	echo "$file found. chown -R root /root/.homebridge/config.json"
	chown -R root /root/.homebridge/config.json
#	npm run install
else
	echo "$file not found. You can create this file to install additional plugins not already included in the docker image."
fi

#chown -R root /root/.homebridge/config.json

/usr/bin/supervisord

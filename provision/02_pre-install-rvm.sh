#!/usr/bin/env bash

dpkg -l ruby >/dev/null 2>&1

if [ $? -eq 0 ]; then
	echo ">>>>>Removing ruby<<<<<"
	apt-get -y remove --purge ruby > /dev/null
	apt-get -y autoremove > /dev/null
else
	echo ">>>>>ruby is not installed<<<<<"
fi

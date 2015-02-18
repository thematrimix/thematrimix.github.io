#!/usr/bin/env bash

dpkg -l nodejs > /dev/null 2>&1

if [ $? -eq 0 ]; then
	echo ">>>>>REMOVING NodeJS<<<<<"
	apt-get -y remove --purge nodejs > /dev/null
	apt-get -y autoremove > /dev/null
else
	echo ">>>>>NodeJS is not installed<<<<<"
fi

dpkg -l npm > /dev/null 2>&1

if [ $? -eq 0 ]; then
	echo ">>>>>REMOVING npm<<<<<"
	apt-get -y remove --purge npm > /dev/null
	apt-get -y autoremove > /dev/null
else
	echo ">>>>>npm is not installed<<<<<"
fi

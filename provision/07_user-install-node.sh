#!/usr/bin/env bash

if [ -s ~/.nvm/nvm.sh ]; then
	source ~/.nvm/nvm.sh

	nodeCurrent=`nvm current`

	if [[ -z "$nodeCurrent" || "$nodeCurrent" == "none" ]]; then
		echo ">>>>>Installing NodeJS version $1<<<<<"
		nvm install $1

		#For now just use the last installed
		nvm alias default $1
		nvm use $1

		shift
	fi

	echo ">>>>>nodejs version is: $(nvm current)<<<<<"
else
	echo ">>>>>Can't install node with out nvm<<<<<"
fi

type npm >/dev/null 2>&1

if [ $? -ne 0 ] && (( $# )); then
	echo ">>>>>Installing global node packages $@<<<<<"
	npm install -g $@
elif (( $# )); then
	echo ">>>>>no packages to install<<<<<"
else
	echo ">>>>>npm is not installed<<<<<"
fi

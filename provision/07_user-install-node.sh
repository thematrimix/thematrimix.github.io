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

		if (( $# )); then
			echo ">>>>>Installing global node packages $@<<<<<"
			npm install -g $@
		fi
	fi

	echo ">>>>>nodejs version is: $(nvm current)<<<<<"
else
	echo ">>>>>nvm does not appear to be installed<<<<<"
fi

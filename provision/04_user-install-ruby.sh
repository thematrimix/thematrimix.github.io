#!/usr/bin/env bash

if [ -s ~/.rvm/scripts/rvm ]; then
	source ~/.rvm/scripts/rvm

	rubyCurrent=`rvm list`
	re="ruby-$1"

	if [[ ! $rubyCurrent =~ $re ]]; then
		echo ">>>>>Installing ruby version $1<<<<<"
		rvm install $1

		#For now just use the last installed
		rvm use --default $1

		shift

		if (( $# )); then
			echo ">>>>>Installing gems $@<<<<<"
			gem install $@
		fi
	fi

	echo ">>>>>ruby version is: $(ruby -v)<<<<<"
else
	echo ">>>>>rvm does not appear to be installed<<<<<"
fi

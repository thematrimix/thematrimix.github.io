#!/usr/bin/env bash

if [ ! -s ~/.nvm/nvm.sh ]; then
	echo ">>>>>Installing nvm<<<<<"
	\curl https://raw.githubusercontent.com/creationix/nvm/$1/install.sh | bash
else
	source ~/.nvm/nvm.sh
	echo ">>>>>nvm version is: $(nvm --version)<<<<<"
fi

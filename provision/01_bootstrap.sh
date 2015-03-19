#!/usr/bin/env bash

VAGRANTPATH="/home/vagrant"

echo ">>>>>Running initial update<<<<<"
apt-get -y update > /dev/null
apt-get -y upgrade > /dev/null

echo ">>>>>Installing the required tools for NVM, RVM and general usefulness<<<<<"
apt-get -y install curl build-essential openssl libssl-dev git python linux-headers-$(uname -r) > /dev/null

#!/usr/bin/env bash

#a lot was done under root so make sure /vagrant is owned by vagrant
echo ">>>>>Make sure /vagrant is owned by vagrant<<<<<"
chown -R vagrant:vagrant /vagrant

echo ">>>>>Perform overall clean up<<<<<"
apt-get -y update > /dev/null
apt-get -y autoremove > /dev/null
apt-get -y autoclean > /dev/null

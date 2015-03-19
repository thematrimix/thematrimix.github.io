#!/usr/bin/env bash

echo ">>>>>Kickoff<<<<<"
cd /vagrant/
jekyll serve --host=0.0.0.0 --watch --force_polling --detach

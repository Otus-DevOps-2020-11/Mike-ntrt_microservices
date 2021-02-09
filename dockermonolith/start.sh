#!/bin/bash

/usr/bin/mongod --fork --config /etc/mongodb.conf

source /reddit/db_config

cd /reddit && puma || exit

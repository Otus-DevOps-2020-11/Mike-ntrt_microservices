#!/bin/bash
# do not ignore any errors, exits immediately
set -e

/usr/bin/mongod --fork --syslog

cd /app && puma || exit

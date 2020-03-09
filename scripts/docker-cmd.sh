#!/bin/sh
set -e

# crontab -l
NOW=$(date +"%Y-%m-%dT%H:%M:%S.%n%Z")
echo "Started at $NOW"
crond -f -l 8
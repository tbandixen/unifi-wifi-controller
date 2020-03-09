#!/bin/sh
set -e

chmod -R 0600 ~/.ssh

ssh-keyscan -H unifi-ap.bx.home >> ~/.ssh/known_hosts
ssh-keyscan -H unifi-ap-ac-lite.bx.home >> ~/.ssh/known_hosts

# crontab -l
NOW=$(date +"%d.%m.%Y %H:%M:%S %Z")
echo "Started at $NOW"
crond -f -l 8
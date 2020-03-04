#!/bin/sh
set -e

mkdir -p /etc/periodic/1min
echo -e "*       *       *       *       *       run-parts /etc/periodic/1min\n" >> /etc/crontabs/root
crontab -l
crond -f -l 8
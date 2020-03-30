@echo off
docker build . -t unifi-wifi-controller:latest
IF ERRORLEVEL 1 PAUSE

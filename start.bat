@ECHO OFF
REM -v %cd%/.ssh:/root/.ssh:rw
REM -v %cd%/1min:/etc/periodic/1min:rw
docker run --rm -i -t -e SSH_USER=tbx -e API_URL=https://wifistateservice.azurewebsites.net/state --name unifi-wifi-controller unifi-wifi-controller
IF ERRORLEVEL 1 PAUSE

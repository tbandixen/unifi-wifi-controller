@ECHO OFF
REM -v %cd%/.ssh:/root/.ssh:rw
REM -v %cd%/1min:/etc/periodic/1min:rw
docker run --rm -i -t -e SSH_USER=tbx -e API_URL=https://wifistateservice.azurewebsites.net/state -e INTERFACES=2;1,unifi-ap.bx.home,wifi0;2,unifi-ap-ac-lite.bx.home,wifi0,wifi1 --name unifi-wifi-controller unifi-wifi-controller:latest
IF ERRORLEVEL 1 PAUSE

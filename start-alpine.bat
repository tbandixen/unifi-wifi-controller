@ECHO OFF
REM -v %cd%/.ssh:/root/.ssh:rw
REM -v %cd%/1min:/etc/periodic/1min:rw
docker run --rm -i -t -v %cd%/test.sh:/test.sh:rw --name linuxbox alpine:latest /test.sh
IF ERRORLEVEL 1 PAUSE

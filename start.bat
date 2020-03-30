@REM -v %cd%/.ssh:/root/.ssh:rw
@REM -v %cd%/1min:/etc/periodic/1min:rw
@docker run --rm -i -t --name unifi-wifi-controller unifi-wifi-controller

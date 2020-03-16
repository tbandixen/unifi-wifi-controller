#!/usr/bin/env sh

curl -s --header "Content-Type: application/json" --request POST --data "$1" https://wifistateservice.azurewebsites.net/state

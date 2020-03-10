#!/usr/bin/env sh

curl -s --header "Content-Type: application/json" --request POST --data '0' https://wifistateservice.azurewebsites.net/state

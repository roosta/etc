#!/bin/bash
curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//' 
#command=curl ifconfig.me/host
#command=curl ifconfig.me


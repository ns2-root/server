#!/bin/bash

service=$1
    iprecords=$(nslookup $service | grep -A1 "Name:" | grep -oE '\b([0-9]{1,3}\.){3}[0-9]$
    if [ -z "$iprecords" ]; then
        echo "Error: Unable to resolve DNS for $service"
    else
        echo $iprecords
    fi

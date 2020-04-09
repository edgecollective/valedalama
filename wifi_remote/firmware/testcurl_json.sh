#!/bin/bash

curl -H "Content-Type: application/json" -X POST -d '{ "timestamp": 1586468898, "value": 76.5 }' http://192.168.1.192:8200/api/user

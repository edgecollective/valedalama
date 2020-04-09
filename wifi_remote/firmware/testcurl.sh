#!/bin/bash

curl -d "username=scott&password=secret&website=stackabuse.com" -X POST http://192.168.1.192:8200/api/user

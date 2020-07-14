#!/bin/bash

if [ -z "$1" ]; then
    aa1=`basename ${PWD}`
    for bb1 in x2 test2  ; do
        if [ "${bb1}" = "${aa1}" ]; then
            if [ -f default.json ]; then
                echo "nice -n 19 ./caddy  run -config default.json"
                nice       -n 19 ./caddy  run -config default.json 
            else
                echo "nice -n 19 ./caddy  run"
                nice       -n 19 ./caddy  run 
            fi
            fi
        done
else
                echo "nice -n 19 ./caddy  run -config $1"
                nice       -n 19 ./caddy  run -config $1 
fi

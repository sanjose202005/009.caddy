#!/bin/bash

# git pull ; nice -n 19 ./caddy.4    run -config default.json.42018.100.json

prog=./caddy 
for aa1 in ./caddy.1 ./caddy.2 ./caddy.3 ./caddy.4 
do
   if [ -f ${aa1} ] ; then
       prog=${aa1}
   fi
done

for aa1 in default.json default.json.42018.*.json
do
   if [ -f ${aa1} ] ; then
       ff1=${aa1}
   fi
done
if [ -n "$1" ]; then
    ff1=$1
fi

echo "nice -n 19 ${prog}  run -config ${ff1}"
nice       -n 19 ${prog}  run -config ${ff1} 
echo "nice -n 19 ${prog}  run -config ${ff1}"

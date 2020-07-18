#!/bin/bash

if [ 2 = 3 ] ; then
echo ./naive.naiveproxy-v83.0.4103.61-1-linux-x64.from.git naive.config.json.100.0.0.0.0.31080.json
     ./naive.naiveproxy-v83.0.4103.61-1-linux-x64.from.git naive.config.json.100.0.0.0.0.31080.json
echo ./naive.naiveproxy-v83.0.4103.61-1-linux-x64.from.git naive.config.json.100.0.0.0.0.31080.json
fi

if [ 4 = 3 ] ; then
echo ./naive.naiveproxy-v83.0.4103.61-1-linux-x64.from.git naive.config.json.103.0.0.0.0.31080.nolog.json
     ./naive.naiveproxy-v83.0.4103.61-1-linux-x64.from.git naive.config.json.103.0.0.0.0.31080.nolog.json
echo ./naive.naiveproxy-v83.0.4103.61-1-linux-x64.from.git naive.config.json.103.0.0.0.0.31080.nolog.json
fi


prog=./naive 
for aa1 in ./naive.1 ./naive.2 ./naive.3 ./naive.4 
do
   if [ -f ${aa1} ] ; then
       prog=${aa1}
   fi
done

for aa1 in naive.config.json.1*.json
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


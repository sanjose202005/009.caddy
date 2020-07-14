#!/bin/bash

echo "tcpdump -i eth0 -s 65535 -w /tmp/1.tcpdump 'not tcp port 55522'"
      tcpdump -i eth0 -s 65535 -w /tmp/1.tcpdump 'not tcp port 55522' 
echo "tcpdump -i eth0 -s 65535 -w /tmp/1.tcpdump 'not tcp port 55522'"

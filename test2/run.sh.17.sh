#!/bin/bash
echo  Caddyfile.17.conf.json
echo "curl http://p2:32019/load -X POST -H 'Content-Type: application/json' -d @Caddyfile.17.conf.json"
      curl http://p2:32019/load -X POST -H 'Content-Type: application/json' -d @Caddyfile.17.conf.json
echo "curl http://p2:32019/load -X POST -H 'Content-Type: application/json' -d @Caddyfile.17.conf.json"
echo  Caddyfile.17.conf.json

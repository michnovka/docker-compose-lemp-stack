#!/bin/bash

# Call this every midnight to reload certificate
#nginx -s reload
cd /home/lifam/lemp-stack
./shell.sh nginx "/etc/init.d/nginx reload"
exit 0

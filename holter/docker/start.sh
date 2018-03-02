#!/bin/sh

/prepare.sh

touch /tmp/ready
printf "\nApplication is ready to serve [label:ready]"

exec  /usr/bin/supervisord -n -c /etc/supervisord.conf
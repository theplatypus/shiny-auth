#!/bin/sh 

# ref : https://stackoverflow.com/questions/2914220/bash-templating-how-to-build-configuration-files-from-templates-with-bash/2916159#2916159
perl -p -i -e 's/\$\{([^}]+)\}/defined $ENV{$1} ? $ENV{$1} : $&/eg' /etc/nginx/nginx.conf

nginx -c /etc/nginx/nginx.conf -g "daemon off;"

#!/bin/bash

############################################################
####################### Important! #########################
############################################################

# The argument should be passed with quotes or backslashes:
# bash net-scan.sh "192.168.1.{0..255}"
# bash net-scan.sh 192.168.1.\{0..255\}
# Execution time for 256 IPs is about 9 minutes (1s timeout)

ip_range=${1}
# Using the eval built-in to expand IP range before looping
for ip in $(eval echo ${ip_range}); do
# Redirecting stderr to stdout and then using grep to filter
# only success messages
  nc -v -z -w 1 $ip 80 2>&1 | grep succeeded
  nc -v -z -w 1 $ip 443 2>&1 | grep succeeded
done

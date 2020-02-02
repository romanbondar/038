#!/bin/bash

############################################################
####################### Important! #########################
############################################################

# Of course this script should be executed with root rights
# FIRST time, something like "sudo bash auto_update.sh"

# Then it will copy itself from wherever it's executed to
# the /etc/cron.weekly directory IF it's not yet there,
# after that it should be handled by cron automatically.

cp --no-clobber auto_update.sh /etc/cron.weekly
log_date=$(date +%Y%m%d)
apt-get update  &> /var/log/update-$log_date.log
apt-get upgrade --assume-yes &> /var/log/update-$log_date.log
apt-get autoclean &> /var/log/update-$log_date.log
apt-get autoremove --assume-yes &> /var/log/update-$log_date.log

#############################################################
######################### BONUS! ############################
#############################################################

# This file will be created first time and recreated each time

echo "/var/log/update-*.log {
  rotate 3
  monthly
  compress
}" > "/etc/logrotate.d/auto_update_sh_logrotate_conf"

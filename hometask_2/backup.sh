#!/bin/bash
source_dir=$1
backup_dir=$2/$(date +%Y%m%d)
# Making backup directory beforehand for cp command
mkdir $backup_dir
current_timestamp=$(date +%s)
day_ago=$[$current_timestamp - 86400]
# Changing the Internal Field Separator variable to
# newline only, in order to handle names with spaces
IFS=$'\n'
# Looping through each file and directory, comparing
# the timestamps along the way
for i in $(ls $source_dir); do
  last_modified=$(date --reference=$source_dir/$i +%s)
  if [ "$last_modified" -gt "$day_ago" ]; then
    cp -rv $source_dir/$i $backup_dir
  fi
done

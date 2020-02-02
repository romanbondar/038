#!/bin/bash
# Downloading the file IF it's not yet downloaded
wget --no-clobber http://yoko.ukrtux.com:8899/versions.txt
sort --version-sort versions.txt | uniq --count | sort --reverse | head -1

###########################################################
######################## BONUS! ###########################
###########################################################

# It is the brute force way that I started with
# before realizing that the execution time is about
# two days on my machine with 200k rows file :)

# wget --no-clobber http://yoko.ukrtux.com:8899/versions.txt
# mapfile lines_array < versions.txt
# maximum=0
# result_string="there are no duplicates"
# for i in ${lines_array[@]}; do
#   counter=0
#   for x in ${lines_array[@]}; do
#     if [ "$x" == "$i" ]; then
#       (( counter += 1 )) # Increment
#     fi
#   done
#   if [ "$counter" -gt "$maximum" ]; then
#     maximum=$counter
#     result_string=$i
#   fi
# done
# echo $maximum" "$result_string

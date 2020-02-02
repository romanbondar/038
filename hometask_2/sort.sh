#!/bin/bash
# Downloading the file IF it's not yet downloaded
wget --no-clobber http://yoko.ukrtux.com:8899/versions.txt
sort --version-sort versions.txt | head -4

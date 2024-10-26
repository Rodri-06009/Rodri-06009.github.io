#!/bin/bash

cd /home/runner/work/EPG-Rodri/EPG-Rodri/iptv-org-epg && npm install

cd ../EPG

# Compress EPG xml files

xz -k -f -9 "epg*.xml" && gzip -k -f -9 "epg*.xml"

# Remove EPG xml files

rm "epg*.xml"

exit 0

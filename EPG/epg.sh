#!/bin/bash

cd /home/runner/work/EPG-Rodri/EPG-Rodri/iptv-org-epg && npm install

# EPG

npm run grab -- --channels=../EPG/channels.xml --output=../EPG/epg-rodri.xml --days=7

# Compress EPG xml files

xz -k -f -9 epg-rodri.xml && gzip -k -f -9 epg-rodri.xml

# Remove EPG xml files

rm epg-rodri.xml

exit 0

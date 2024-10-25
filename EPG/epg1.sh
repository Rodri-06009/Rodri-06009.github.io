#!/bin/bash

cd /home/runner/work/EPG-Rodri/EPG-Rodri/iptv-org-epg && npm install

# NOS TV EPG

npm run grab -- --site=nostv.pt --output=../EPG/epg-nos-tv-pt.xml --days=7

cd ../EPG

# Compress EPG xml files

xz -k -f -9 epg*.xml && gzip -k -f -9 epg*.xml

# Remove EPG xml files

rm epg*.xml

exit 0

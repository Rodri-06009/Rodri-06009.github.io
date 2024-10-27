#!/bin/bash

cd /home/runner/work/EPG-Rodri/EPG-Rodri/iptv-org-epg && npm install

# EPG

npm run grab -- --channels=../EPG/channels.xml --output=../EPG/epg-rodri.xml --days=7

exit 0

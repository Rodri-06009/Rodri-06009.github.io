#!/bin/bash

cd /home/runner/work/Rodri-06009.github.io/Rodri-06009.github.io/iptv-org-epg && npm install

# EPG

npm run grab -- --channels=../EPG/channels.xml --output=../EPG/epg-rodri.xml --days=7

exit 0

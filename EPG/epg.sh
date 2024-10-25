#!/bin/bash

cd /home/runner/work/EPG-Rodri/EPG-Rodri/iptv-org-epg && npm install

# NOS TV EPG

npm run grab -- --site=nostv.pt --output=../EPG/epg-nos-tv-pt.xml --days=7

# TV CE SOIR EPG

npm run grab -- --site=tvcesoir.fr --output=../EPG/epg-tv-ce-soir-fr.xml --days=7

# Magentatv EPG

npm run grab -- --site=web.magentatv.de --output=../EPG/epg-magentatv-de.xml --days=7

# Mi.tv EPG

npm run grab -- --channels=sites/mi.tv/mi.tv_br.channels.xml --output=../EPG/epg-mitv-br.xml --days=7

# iltalehti EPG

npm run grab -- --site=iltalehti.fi --output=../EPG/epg-iltalehti-fi.xml --days=7

cd ../EPG

# Compress EPG xml files

xz -k -f -9 epg*.xml && gzip -k -f -9 epg*.xml

# Remove EPG xml files

rm epg*.xml

exit 0

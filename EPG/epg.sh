#!/bin/bash

cd /home/runner/work/EPG-Rodri/EPG-Rodri/iptv-org-epg && npm install

# NOS TV EPG

npm run grab -- --site=nostv.pt --output=../EPG/epg-nos-tv-pt.xml --days=7

# Orange EPG

npm run grab -- --site=chaines-tv.orange.fr --output=../EPG/epg-orange-fr.xml --days=7

# Hd-plus EPG

npm run grab -- --site=hd-plus.de --output=../EPG/epg-rtp-pt.xml --days=7

# Mi.tv EPG

npm run grab -- --channels=sites/mi.tv/mi.tv_br.channels.xml --output=../EPG/epg-mitv-br.xml --days=7

# iltalehti EPG

npm run grab -- --site=iltalehti.fi --output=../EPG/epg-iltalehti-fi.xml --days=7

# TV.SMS EPG

npm run grab -- --site=m.tv.sms.cz --output=../EPG/epg-tv-sms-cz.xml --days=7

cd ../EPG

# Compress EPG xml files

xz -k -f -9 epg*.xml && gzip -k -f -9 epg*.xml

# Remove EPG xml files

rm epg*.xml

exit 0

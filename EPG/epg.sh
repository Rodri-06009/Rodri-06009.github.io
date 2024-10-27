#!/bin/bash

cd /home/runner/work/EPG-Rodri/EPG-Rodri/iptv-org-epg && npm install

# EPG

npm run grab -- --channels=../EPG/channels.xml --output=../EPG/epg-rodri.xml --days=7

# TV CE SOIR (France) EPG

npm run grab -- --site=tvcesoir.fr --output=../EPG/epg-tv-ce-soir-fr.xml --days=7

# Nos (Portugal) EPG

npm run grab -- --site=nostv.pt --output=../EPG/epg-nos-pt.xml --days=7

# Iltalehti (Finland) EPG

npm run grab -- --site=iltalehti.fi --output=../EPG/epg-iltalehti-fi.xml --days=7

# Magentatv (Germany) EPG

npm run grab -- --site=web.magentatv.de --output=../EPG/epg-magentatv-de.xml --days=7

# Meuguia.tv (Brasil) EPG

npm run grab -- --site=meuguia.tv --output=../EPG/epg-meuguia-tv-br.xml --days=7

cd ../EPG

# Compress EPG xml files

xz -k -f -9 epg*.xml && gzip -k -f -9 epg*.xml

# Remove EPG xml files

rm epg*.xml

exit 0

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

# Vérifiez si des fichiers XML.gz existent avant de décompresser
if ls epg*.xml.gz 1> /dev/null 2>&1; then
    # Décompression avec Gzip
    for file in epg*.xml.gz; do
        gunzip -k "$file"
    done
    
    # Vérifiez maintenant s'il y a des fichiers XML après décompression
    if ls epg*.xml 1> /dev/null 2>&1; then
        # Compression avec XZ
        xz -k -f -9 epg*.xml && \
        # Compression avec Gzip
        gzip -k -f -9 epg*.xml
    else
        echo "Aucun fichier XML trouvé après décompression."
    fi
else
    echo "Aucun fichier XML.gz trouvé correspondant à 'epg*.xml.gz'."
fi

# Remove EPG xml files

rm epg*.xml

exit 0

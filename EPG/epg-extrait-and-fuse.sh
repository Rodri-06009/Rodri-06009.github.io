#!/bin/bash

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

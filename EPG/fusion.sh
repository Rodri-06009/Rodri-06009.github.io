#!/bin/bash

# Vérifiez si des fichiers XML existent avant de compresser
if ls epg*.xml 1> /dev/null 2>&1; then
    # Compression avec XZ
    xz -k -f -9 epg*.xml && \
    # Compression avec Gzip
    gzip -k -f -9 epg*.xml
else
    echo "Aucun fichier XML trouvé correspondant à 'epg*.xml'."
fi

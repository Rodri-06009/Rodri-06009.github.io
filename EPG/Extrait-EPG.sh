#!/bin/bash

# Chemin vers le répertoire contenant les fichiers .xml.gz
DIR="/home/Rodri-06009/EPG-Rodri/EPG"

# Décompression des fichiers XML
gzip -d "$DIR/epg-tv-ce-soir-fr.xml.gz"
gzip -d "$DIR/epg-nos-tv-pt.xml.gz"
gzip -d "$DIR/epg-mitv-br.xml.gz"
gzip -d "$DIR/epg-magentatv-de.xml.gz"
gzip -d "$DIR/epg-iltalehti-fi.xml.gz"

# Vérification de l'état de la décompression
if [ $? -eq 0 ]; then
    echo "Tous les fichiers ont été décompressés avec succès."
else
    echo "Une erreur s'est produite lors de la décompression des fichiers."
fi

exit 0

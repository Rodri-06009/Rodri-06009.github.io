#!/bin/bash

DIR="/home/Rodri-06009/EPG-Rodri/EPG"

# Vérifier les fichiers .xml.gz
echo "Fichiers trouvés :"
ls "$DIR"/*.xml.gz 2>/dev/null

# Décompression des fichiers XML
for file in "$DIR"/*.xml.gz; do
    if [ -e "$file" ]; then
        gzip -d "$file" 2>/dev/null
        if [ $? -ne 0 ]; then
            echo "Erreur lors de la décompression de : $file"
        fi
    else
        echo "Aucun fichier .xml.gz trouvé."
    fi
done

echo "Processus terminé."
exit 0

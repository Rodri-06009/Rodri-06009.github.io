#!/bin/bash

DIR="/home/Rodri-06009/EPG-Rodri/EPG"

# Décompression des fichiers XML avec messages d'erreur
for file in "$DIR"/*.xml.gz; do
    gzip -d "$file" 2>/dev/null
    if [ $? -ne 0 ]; then
        echo "Erreur lors de la décompression de : $file"
    fi
done

echo "Processus terminé."
exit 0

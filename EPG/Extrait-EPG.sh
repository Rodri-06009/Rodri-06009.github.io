#!/bin/sh

# Dossier contenant les fichiers .xml.gz
dossier="/home/runner/work/EPG-Rodri/EPG-Rodri/EPG"

# Vérifie si le dossier existe
if [ ! -d "$dossier" ]; then
    echo "Le dossier '$dossier' n'existe pas."
    exit 1
fi

# Parcours de tous les fichiers .xml.gz dans le dossier
for fichier in "$dossier"/*.xml.gz; do
    if [ -e "$fichier" ]; then
        echo "Traitement de $fichier..."
        
        # Décompression et affichage du contenu XML
        zcat "$fichier" | xmllint --format - # ou remplace par ta commande de traitement XML
        
        echo "Fichier traité : $fichier"
    else
        echo "Aucun fichier .xml.gz trouvé dans $dossier."
        break
    fi
done

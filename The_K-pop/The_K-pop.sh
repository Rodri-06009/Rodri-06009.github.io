#!/bin/bash

# Afficher le répertoire du script
SCRIPT_DIR=$(dirname "$0")
echo "$SCRIPT_DIR"

# Changer de répertoire vers le dossier contenant le script
cd "$SCRIPT_DIR" || { echo "Échec de la navigation vers $SCRIPT_DIR"; exit 1; }

# Exécuter le script Bash et rediriger la sortie vers le fichier .m3u8
OUTPUT_FILE="../The_K-pop/The_K-pop.m3u8"
bash The_K-pop-2.sh > "$OUTPUT_FILE"

# Vérifier si le fichier a été créé avec succès
if [ -f "$OUTPUT_FILE" ]; then
    echo "m3u grabbed"
else
    echo "Erreur : le fichier m3u n'a pas été créé."
    exit 1
fi

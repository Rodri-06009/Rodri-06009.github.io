#!/bin/bash

# Afficher le répertoire du script
SCRIPT_DIR=$(dirname "$0")
echo "$SCRIPT_DIR"

# Changer de répertoire vers le dossier contenant le script
cd "$SCRIPT_DIR" || { echo "Échec de la navigation vers $SCRIPT_DIR"; exit 1; }

# Exécuter le script Bash et rediriger la sortie vers le fichier .m3u8
OUTPUT_FILE="../The_K-pop/The_K-pop.m3u8"
echo "#EXTM3U" > "$OUTPUT_FILE"
echo "#EXT-X-VERSION:3" >> "$OUTPUT_FILE"
echo "#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2560000" >> "$OUTPUT_FILE"

# URL à récupérer
URL="https://www.youtube.com/@thekpop/live"
echo "Fetching URL: $URL"

# Récupérer le contenu de la page
PAGE_CONTENT=$(curl -s "$URL")

# Extraire le lien .m3u8 si disponible
# Cette méthode peut ne pas fonctionner si YouTube change sa structure
STREAM_URL=$(echo "$PAGE_CONTENT" | grep -o 'https://[^ ]*\.m3u8' | head -n 1)

if [ -n "$STREAM_URL" ]; then
    echo "$STREAM_URL" >> "$OUTPUT_FILE"
    echo "m3u grabbed"
else
    echo "Indisponible: https://raw.githubusercontent.com/Rodri200906/IPTV-Rodri/refs/heads/main/.github/Indisponible/Indisponible.m3u8"
fi

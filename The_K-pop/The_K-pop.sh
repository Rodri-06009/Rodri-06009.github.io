#!/bin/bash

# Afficher le répertoire du script
SCRIPT_DIR=$(dirname "$0")
echo "$SCRIPT_DIR"

# Installer youtube-dl si nécessaire
if ! command -v youtube-dl &> /dev/null; then
    echo "youtube-dl n'est pas installé. Installation..."
    sudo apt-get install youtube-dl
fi

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

# Récupérer le flux avec youtube-dl
STREAM_URL=$(youtube-dl -f best -g "$URL")

if [ -n "$STREAM_URL" ]; then
    echo "$STREAM_URL" >> "$OUTPUT_FILE"
    echo "m3u grabbed"
else
    echo "https://raw.githubusercontent.com/Rodri200906/IPTV-Rodri/refs/heads/main/.github/Indisponible/Indisponible.m3u8"
fi

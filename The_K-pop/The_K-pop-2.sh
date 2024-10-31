#!/bin/sh

# Vérifie si le fichier d'entrée existe
INPUT_FILE="../The_K-pop/The_K-pop.txt"
if [ ! -f "$INPUT_FILE" ]; then
    echo "Le fichier $INPUT_FILE n'existe pas."
    exit 1
fi

# Affiche les en-têtes M3U
echo "#EXTM3U"
echo "#EXT-X-VERSION:3"
echo "#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2560000"

# Fonction pour récupérer l'URL
grab() {
    url="$1"
    echo "Fetching URL: $url"  # Message de débogage

    response=$(curl -s --max-time 15 "$url")
    if echo "$response" | grep -q '.m3u8'; then
        end=$(echo "$response" | grep -o 'https://[^ ]*.m3u8' | head -n 1)
        if [ -n "$end" ]; then
            stream=$(curl -s "$end" | grep -o 'http[^ ]*' | tail -n 1)
            echo "$stream"
        else
            echo "No valid stream found in response."
        fi
    else
        echo "Indisponible: https://raw.githubusercontent.com/Rodri200906/IPTV-Rodri/refs/heads/main/.github/Indisponible/Indisponible.m3u8"
    fi
}

# Lire le fichier d'entrée
while IFS= read -r line; do
    line=$(echo "$line" | xargs)  # Supprime les espaces
    if [ -z "$line" ] || [[ "$line" == ~~* ]]; then
        continue
    fi
    if [[ "$line" != https://* ]]; then
        IFS='|' read -r ch_name grp_title tvg_logo tvg_id <<< "$line"
        grp_title=$(echo "$grp_title" | sed 's/.*/\L&/; s/^./\U&/')  # Met la première lettre en majuscule
        echo "Channel Name: $ch_name, Group Title: $grp_title"  # Message de débogage
    else
        grab "$line"
    fi
done < "$INPUT_FILE"

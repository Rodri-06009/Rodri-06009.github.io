#!/bin/sh

# Fichier de sortie
output="epg-rodri.xml"

# Créer ou vider le fichier de sortie
echo "<?xml version=\"1.0\" encoding=\"utf-8\"?>" > "$output"
echo "<Root>" >> "$output"

# Fonction pour traiter chaque fichier
process_file() {
    url=$1
    echo "Processing $url..."
    if curl -s --head "$url" | grep "200 OK" > /dev/null; then
        curl -s "$url" | tail -n +2 | sed '$d' >> "$output"
    else
        echo "Error: $url not found."
    fi
}

# Liste des fichiers à traiter
files=(
    "https://raw.githubusercontent.com/Rodri-06009/EPG-Rodri/main/EPG/epg-nos-tv-pt.xml"
    "https://raw.githubusercontent.com/Rodri-06009/EPG-Rodri/main/EPG/epg-tv-ce-soir-fr.xml"
    "https://raw.githubusercontent.com/Rodri-06009/EPG-Rodri/main/EPG/epg-mitv-br.xml"
    "https://raw.githubusercontent.com/Rodri-06009/EPG-Rodri/main/EPG/epg-magentatv-de.xml"
    "https://raw.githubusercontent.com/Rodri-06009/EPG-Rodri/main/EPG/epg-iltalehti-fi.xml"
)

# Traiter chaque fichier
for file in "${files[@]}"; do
    process_file "$file"
done

# Ajouter la balise fermante
echo "</Root>" >> "$output"

echo "Combined XML has been created as $output"

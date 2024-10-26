#!/bin/sh

# Fichier de sortie
output="epg-rodri.xml"

# Créer ou vider le fichier de sortie
echo "<?xml version=\"1.0\" encoding=\"utf-8\"?>" > "$output"
echo "<Root>" >> "$output"

# Traiter chaque fichier XML individuellement

# Fichier 1: epg-nos-tv-pt.xml
url1="https://raw.githubusercontent.com/Rodri-06009/EPG-Rodri/main/EPG/epg-nos-tv-pt.xml"
echo "Processing $url1..."
if curl -s --head "$url1" | grep "200 OK" > /dev/null; then
    curl -s "$url1" | tail -n +2 | sed '$d' >> "$output"
else
    echo "Error: $url1 not found."
fi

# Fichier 2: epg-tv-ce-soir-fr.xml
url2="https://raw.githubusercontent.com/Rodri-06009/EPG-Rodri/main/EPG/epg-tv-ce-soir-fr.xml"
echo "Processing $url2..."
if curl -s --head "$url2" | grep "200 OK" > /dev/null; then
    curl -s "$url2" | tail -n +2 | sed '$d' >> "$output"
else
    echo "Error: $url2 not found."
fi

# Fichier 3: epg-mitv-br.xml
url3="https://raw.githubusercontent.com/Rodri-06009/EPG-Rodri/main/EPG/epg-mitv-br.xml"
echo "Processing $url3..."
if curl -s --head "$url3" | grep "200 OK" > /dev/null; then
    curl -s "$url3" | tail -n +2 | sed '$d' >> "$output"
else
    echo "Error: $url3 not found."
fi

# Fichier 4: epg-magentatv-de.xml
url4="https://raw.githubusercontent.com/Rodri-06009/EPG-Rodri/main/EPG/epg-magentatv-de.xml"
echo "Processing $url4..."
if curl -s --head "$url4" | grep "200 OK" > /dev/null; then
    curl -s "$url4" | tail -n +2 | sed '$d' >> "$output"
else
    echo "Error: $url4 not found."
fi

# Fichier 5: epg-iltalehti-fi.xml
url5="https://raw.githubusercontent.com/Rodri-06009/EPG-Rodri/main/EPG/epg-iltalehti-fi.xml"
echo "Processing $url5..."
if curl -s --head "$url5" | grep "200 OK" > /dev/null; then
    curl -s "$url5" | tail -n +2 | sed '$d' >> "$output"
else
    echo "Error: $url5 not found."
fi

# Ajouter la balise fermante
echo "</Root>" >> "$output"

echo "Combined XML has been created as $output"

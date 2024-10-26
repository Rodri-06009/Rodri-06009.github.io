#!/bin/bash

# Fichier de sortie
output="epg-rodri.xml"

# Créer ou vider le fichier de sortie
echo "<?xml version=\"1.0\" encoding=\"utf-8\"?>" > "$output"
echo "<Root>" >> "$output"

# Boucle pour ajouter des fichiers XML
while true; do
    read -p "EPG/epg-iltalehti-fi.xml" filename

    # Condition de sortie
    if [[ "$filename" == "exit" ]]; then
        break
    fi

    # Vérifier si le fichier existe
    if [[ -f "$filename" ]]; then
        echo "Processing $filename..."
        
        # Ignorer la première ligne (déclaration XML) et supprimer la dernière ligne (la balise fermante)
        tail -n +2 "$filename" | sed '$d' >> "$output"
        
    else
        echo "Error: $filename not found. Veuillez réessayer."
    fi
done

# Ajouter la balise fermante
echo "</Root>" >> "$output"

echo "Combined XML has been created as $output"

#!/bin/bash

# Répertoire contenant les fichiers .xml.gz
INPUT_DIR="/home/runner/work/EPG-Rodri/EPG-Rodri/EPG"
# Répertoire de sortie
OUTPUT_DIR="/home/runner/work/EPG-Rodri/EPG-Rodri/EPG"

# Activer nullglob pour éviter les problèmes si aucun fichier ne correspond
shopt -s nullglob  

echo "Looking for files in $INPUT_DIR/*.xml.gz"
found_files=false  # Variable pour vérifier si des fichiers sont trouvés

# Boucle à travers tous les fichiers .xml.gz dans le répertoire d'entrée
for gz_file in "$INPUT_DIR"/*.xml.gz; do
    echo "Checking: $gz_file"  # Ligne de débogage

    # Nom du fichier de sortie
    output_file="$OUTPUT_DIR/$(basename "$gz_file" .gz)"

    # Extraire le fichier XML
    if gunzip -c "$gz_file" > "$output_file"; then
        echo "Extracted: $output_file"
        found_files=true  # Indiquer qu'au moins un fichier a été trouvé
    else
        echo "Failed to extract: $gz_file"
    fi
done

# Vérifier si des fichiers ont été trouvés
if ! $found_files; then
    echo "No .xml.gz files found in $INPUT_DIR."
fi

# Vérifier le contenu du répertoire extrait 
echo "Contents of extracted directory:" 
ls -l "$OUTPUT_DIR"

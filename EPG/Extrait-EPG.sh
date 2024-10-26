#!/bin/bash

# Répertoire contenant les fichiers .xml.gz
INPUT_DIR="/home/runner/work/EPG-Rodri/EPG-Rodri/EPG"
# Répertoire de sortie
OUTPUT_DIR="../EPG/extracted"

# Créer le répertoire de sortie s'il n'existe pas
mkdir -p "$OUTPUT_DIR"

# Boucle à travers tous les fichiers .xml.gz dans le répertoire d'entrée
shopt -s nullglob  # Enable nullglob to avoid issues if no files match
for gz_file in "$INPUT_DIR"/*.xml.gz; do
    # Vérifie si le fichier existe
    if [ -f "$gz_file" ]; then
        # Nom du fichier de sortie
        output_file="$OUTPUT_DIR/$(basename "$gz_file" .gz)"

        # Extraire le fichier XML
        if gunzip -c "$gz_file" > "$output_file"; then
            echo "Extracted: $output_file"
        else
            echo "Failed to extract: $gz_file"
        fi
    else
        echo "No .xml.gz files found in $INPUT_DIR."
    fi
done

# Vérifier le contenu du répertoire extrait 
echo "Contents of extracted directory:" 
ls -l "$OUTPUT_DIR"

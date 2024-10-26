#!/bin/bash

# Répertoire contenant les fichiers .xml.gz
INPUT_DIR="/home/runner/work/EPG-Rodri/EPG-Rodri/EPG"
# Répertoire de sortie
OUTPUT_DIR="../EPG/extracted"

# Créer le répertoire de sortie s'il n'existe pas
mkdir -p "$OUTPUT_DIR"

# Boucle à travers tous les fichiers .xml.gz dans le répertoire d'entrée
shopt -s nullglob  # Enable nullglob to avoid issues if no files match
echo "Looking for files in $INPUT_DIR/*.xml.gz"
for gz_file in "$INPUT_DIR"/*.xml.gz; do
    echo "Checking: $gz_file"  # Debug line to show what is being checked
    # Remainder of the script...
    echo "Looking for files in $INPUT_DIR/*.xml.gz"

        # Extraire le fichier XML
        if gunzip -c "$gz_file" > "$output_file"; then
            echo "Extracted: $output_file"
        else
            echo "Failed to extract: $gz_file"
        fi
        echo "No .xml.gz files found in $INPUT_DIR."
    fi
done

# Vérifier le contenu du répertoire extrait 
echo "Contents of extracted directory:" 
ls -l "$OUTPUT_DIR"

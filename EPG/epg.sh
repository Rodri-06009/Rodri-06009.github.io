#!/bin/bash

# Définir le répertoire de travail
WORK_DIR="/home/runner/work/EPG-Rodri/EPG-Rodri/"
OUTPUT_DIR="../EPG"

# Changer de répertoire et installer les dépendances
cd "$WORK_DIR" || { echo "Erreur : Impossible de changer de répertoire vers $WORK_DIR"; exit 1; }
echo "Installation des dépendances..."
npm install || { echo "Erreur lors de l'installation des dépendances"; exit 1; }

# Fonction pour récupérer l'EPG
grab_epg() {
    local site=$1
    local output_file=$2
    echo "Récupération de l'EPG depuis $site..."
    npm run grab -- --site="$site" --output="$output_file" --days=7 || { echo "Erreur lors de la récupération de l'EPG pour $site"; exit 1; }
}

# Récupérer les EPG
grab_epg "meo.pt" "$OUTPUT_DIR/epg-meo-pt.xml"
grab_epg "chaines.orange.fr" "$OUTPUT_DIR/epg-orange-fr.xml"
grab_epg "elisaviihde.fi" "$OUTPUT_DIR/epg-elizaviihde-fi.xml"
grab_epg "mi.tv" "$OUTPUT_DIR/epg-mitv-br.xml" --channels=sites/mi.tv/mi.tv_br.channels.xml
grab_epg "vodafone.de" "$OUTPUT_DIR/epg-vodafone-de.xml"

# Compression des fichiers EPG
cd "$OUTPUT_DIR" || { echo "Erreur : Impossible de changer de répertoire vers $OUTPUT_DIR"; exit 1; }
echo "Compression des fichiers EPG..."
xz -k -f -9 epg*.xml && gzip -k -f -9 epg*.xml || { echo "Erreur lors de la compression des fichiers"; exit 1; }

# Suppression des fichiers XML originaux
echo "Suppression des fichiers XML originaux..."
rm epg*.xml || { echo "Erreur lors de la suppression des fichiers XML"; exit 1; }

echo "Processus terminé avec succès."
exit 0

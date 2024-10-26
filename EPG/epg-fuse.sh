#!/bin/bash

# Fichier de sortie
output="epg-rodri.xml"

# Créer ou vider le fichier de sortie
echo "<?xml version=\"1.0\" encoding=\"utf-8\"?>" > "$output"
echo "<Root>" >> "$output"

# Spécifier le chemin du fichier XML
filename="https://raw.githubusercontent.com/Rodri-06009/EPG-Rodri/main/EPG/epg-iltalehti-fi.xml"

# Vérifier si le fichier existe
if [[ -f "$filename" ]]; then
    echo "Processing $filename..."
    
    # Ignorer la première ligne (déclaration XML) et supprimer la dernière ligne (la balise fermante)
    tail -n +2 "$filename" | sed '$d' >> "$output"
else
    echo "Error: $filename not found. Veuillez vérifier le chemin."
fi

# Ajouter la balise fermante
echo "</Root>" >> "$output"

echo "Combined XML has been created as $output"


# Fichier de sortie
output="epg-rodri.xml"

# Créer ou vider le fichier de sortie
echo "<?xml version=\"1.0\" encoding=\"utf-8\"?>" > "$output"
echo "<Root>" >> "$output"

# Spécifier le chemin du fichier XML
filename="https://raw.githubusercontent.com/Rodri-06009/EPG-Rodri/main/EPG/epg-magentatv-de.xml"

# Vérifier si le fichier existe
if [[ -f "$filename" ]]; then
    echo "Processing $filename..."
    
    # Ignorer la première ligne (déclaration XML) et supprimer la dernière ligne (la balise fermante)
    tail -n +2 "$filename" | sed '$d' >> "$output"
else
    echo "Error: $filename not found. Veuillez vérifier le chemin."
fi

# Ajouter la balise fermante
echo "</Root>" >> "$output"

echo "Combined XML has been created as $output"



# Fichier de sortie
output="epg-rodri.xml"

# Créer ou vider le fichier de sortie
echo "<?xml version=\"1.0\" encoding=\"utf-8\"?>" > "$output"
echo "<Root>" >> "$output"

# Spécifier le chemin du fichier XML
filename="https://raw.githubusercontent.com/Rodri-06009/EPG-Rodri/main/EPG/epg-mitv-br.xml"

# Vérifier si le fichier existe
if [[ -f "$filename" ]]; then
    echo "Processing $filename..."
    
    # Ignorer la première ligne (déclaration XML) et supprimer la dernière ligne (la balise fermante)
    tail -n +2 "$filename" | sed '$d' >> "$output"
else
    echo "Error: $filename not found. Veuillez vérifier le chemin."
fi

# Ajouter la balise fermante
echo "</Root>" >> "$output"

echo "Combined XML has been created as $output"



# Fichier de sortie
output="epg-rodri.xml"

# Créer ou vider le fichier de sortie
echo "<?xml version=\"1.0\" encoding=\"utf-8\"?>" > "$output"
echo "<Root>" >> "$output"

# Spécifier le chemin du fichier XML
filename="https://raw.githubusercontent.com/Rodri-06009/EPG-Rodri/main/EPG/epg-nos-tv-pt.xml"

# Vérifier si le fichier existe
if [[ -f "$filename" ]]; then
    echo "Processing $filename..."
    
    # Ignorer la première ligne (déclaration XML) et supprimer la dernière ligne (la balise fermante)
    tail -n +2 "$filename" | sed '$d' >> "$output"
else
    echo "Error: $filename not found. Veuillez vérifier le chemin."
fi

# Ajouter la balise fermante
echo "</Root>" >> "$output"

echo "Combined XML has been created as $output"



# Fichier de sortie
output="epg-rodri.xml"

# Créer ou vider le fichier de sortie
echo "<?xml version=\"1.0\" encoding=\"utf-8\"?>" > "$output"
echo "<Root>" >> "$output"

# Spécifier le chemin du fichier"
filename="https://raw.githubusercontent.com/Rodri-06009/EPG-Rodri/main/EPG/epg-tv-ce-soir-fr.xml"

# Vérifier si le fichier existe
if [[ -f "$filename" ]]; then
    echo "Processing $filename..."
    
    # Ignorer la première ligne (déclaration XML) et supprimer la dernière ligne (la balise fermante)
    tail -n +2 "$filename" | sed '$d' >> "$output"
else
    echo "Error: $filename not found. Veuillez vérifier le chemin."
fi

# Ajouter la balise fermante
echo "</Root>" >> "$output"

echo "Combined XML has been created as $output"

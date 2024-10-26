#!/bin/bash

# Compress EPG xml files

cat ../EPG/extracted/epg-iltalehti-fi.xml ../EPG/extracted/epg-magentatv-de.xml ../EPG/extracted/epg-mitv-br.xml ../EPG/extracted/epg-nos-tv-pt.xml ../EPG/extracted/epg-tv-ce-soir-fr.xml > epg.xml && gzip -k epg.xml

# Supprime tous les fichiers XML dans le répertoire courant et ses sous-répertoires
find . -name "*.xml" -type f -delete

exit 0

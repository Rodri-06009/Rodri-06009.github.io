#!/bin/bash

# Compress EPG xml files

cat ../EPG/epg-iltalehti-fi.xml ../EPG/epg-magentatv-de.xml ../EPG/epg-mitv-br.xml ../EPG/epg-nos-tv-pt.xml ../EPG/epg-tv-ce-soir-fr.xml > epg.xml && gzip -k epg.xml

# Supprime tous les fichiers XML dans le répertoire courant et ses sous-répertoires
find . -name "*.xml" -type f -delete

exit 0

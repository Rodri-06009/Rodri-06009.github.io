#!/bin/bash

# Compress EPG xml files

cat ../EPG/epg-iltalehti-fi.xml.gz ../EPG/epg-magentatv-de.xml.gz ../EPG/epg-mitv-br.xml.gz ../EPG/epg-nos-tv-pt.xml.gz ../EPG/epg-tv-ce-soir-fr.xml.gz > epg.xml && gzip -k epg.xml

# Supprime tous les fichiers XML dans le répertoire courant et ses sous-répertoires
find . -name "*.xml" -type f -delete

exit 0

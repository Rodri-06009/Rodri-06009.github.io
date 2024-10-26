#!/bin/bash

# Compress EPG xml files

cat ../EPG/epg-iltalehti-fi.xml.gz ../EPG/epg-magentatv-de.xml.gz ../EPG/epg-mitv-br.xml.gz ../EPG/epg-nos-tv-pt.xml.gz ../EPG/epg-tv-ce-soir-fr.xml.gz > epg.xml && gzip -k epg.xml

exit 0

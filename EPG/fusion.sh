#!/bin/bash

# Compress EPG xml files

cat epg-iltalehti-fi.xml.gz epg-magentatv-de.xml.gz epg-mitv-br.xml.gz epg-nos-tv-pt.xml.gz epg-tv-ce-soir-fr.xml.gz > epg.xml && gzip -k epg.xml

exit 0

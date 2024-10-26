#!/bin/bash

ls -l ../EPG/

gzip -d ../EPG/epg-tv-ce-soir-fr.xml.gz

gzip -d ../EPG/epg-nos-tv-pt.xml.gz

gzip -d ../EPG/epg-mitv-br.xml.gz

gzip -d ../EPG/epg-magentatv-de.xml.gz

gzip -d ../EPG/epg-iltalehti-fi.xml.gz

exit 0

#!/bin/bash

cat epg-iltalehti-fi.xml epg-magentatv-de.xml epg-mitv-br.xml epg-nos-tv-pt.xml epg-tv-ce-soir-fr.xml > epg-rodri.xml

gzip -k -f -9 epg-rodri.xml

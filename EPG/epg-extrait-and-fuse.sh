#!/bin/bash

gunzip -k ../EPG-Rodri/EPG/epg-iltalehti-fi.xml.gz

gunzip -k ../EPG-Rodri/EPG/epg-magentatv-de.xml.gz

gunzip -k ../EPG-Rodri/EPG/epg-mitv-br.xml.gz

gunzip -k ../EPG-Rodri/EPG/epg-nos-tv-pt.xml.gz

gunzip -k ../EPG-Rodri/EPG/epg-tv-ce-soir-fr.xml.gz

cat epg-iltalehti-fi.xml epg-magentatv-de.xml epg-mitv-br.xml epg-nos-tv-pt.xml epg-tv-ce-soir-fr.xml > epg-rodri.xml

gzip -k -f -9 epg-rodri.xml

rm *.xml

#!/bin/bash

# Compress EPG xml files

xz -k -f -9 epg-rodri.xml && gzip -k -f -9 epg-rodri.xml

# Remove EPG xml files

rm epg-rodri.xml

exit 0

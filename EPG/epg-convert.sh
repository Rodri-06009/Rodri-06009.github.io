#!/bin/bash

# Compress EPG xml files

xz -k -f -9 EPG/epg-rodri.xml && gzip -k -f -9 EPG/epg-rodri.xml

exit 0

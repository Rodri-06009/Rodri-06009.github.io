#!/bin/sh

# Test URL
url="https://raw.githubusercontent.com/Rodri-06009/EPG-Rodri/main/EPG/epg-nos-tv-pt.xml"

echo "Testing URL: $url"
response=$(curl -s -o /dev/null -w "%{http_code}" "$url")

if [ "$response" -eq 200 ]; then
    echo "URL exists. Downloading..."
    curl -s "$url" -o downloaded_file.xml
    echo "File downloaded as downloaded_file.xml"
else
    echo "Error: $url returned HTTP status $response."
fi

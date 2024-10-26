#!/bin/sh

# URL to test (replace with any file URL)
url="https://raw.githubusercontent.com/Rodri-06009/EPG-Rodri/main/EPG/epg-nos-tv-pt.xml"

echo "Testing URL: $url"
if curl -s --head "$url" | grep "200 OK" > /dev/null; then
    echo "URL exists. Downloading..."
    curl -s "$url" -o downloaded_file.xml
    echo "File downloaded as downloaded_file.xml"
else
    echo "Error: $url not found."
fi

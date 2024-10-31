#!/usr/bin/python3

import os
import sys
import subprocess

windows = False
if 'win' in sys.platform:
    windows = True

def grab(url):
    # Utilisation de youtube-dl pour obtenir le lien M3U8
    command = ['youtube-dl', '-f', 'best', '--get-url', url]
    
    try:
        result = subprocess.run(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True, timeout=15)
        link = result.stdout.strip()
        if result.returncode != 0 or not link:
            print("Erreur lors de la récupération du flux.")
            return
    except Exception as e:
        print(f"Erreur: {e}")
        return

    print(link)

print('#EXTM3U')
print('#EXT-X-VERSION:3')
print('#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2560000')

with open('../The K-pop/The_K-pop.txt') as f:
    for line in f:
        line = line.strip()
        if not line or line.startswith('~~'):
            continue
        if not line.startswith('https:'):
            line = line.split('|')
            ch_name = line[0].strip()
            grp_title = line[1].strip().title()
            tvg_logo = line[2].strip()
            tvg_id = line[3].strip()
        else:
            grab(line)


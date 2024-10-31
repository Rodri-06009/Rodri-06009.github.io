#! /usr/bin/python3

import requests
import os
import sys

windows = 'win' in sys.platform

def grab(url):
    try:
        response = s.get(url, timeout=15).text
        if '.m3u8' not in response:
            response = requests.get(url).text
            if '.m3u8' not in response:
                handle_unavailable()
                return

        end = response.find('.m3u8') + 5
        tuner = 100
        while True:
            if 'https://' in response[end-tuner:end]:
                link = response[end-tuner:end]
                start = link.find('https://')
                end = link.find('.m3u8') + 5
                break
            else:
                tuner += 5

        streams = s.get(link[start:end]).text.split('#EXT')
        hd = streams[-1].strip()
        st = hd.find('http')
        print(hd[st:].strip())

    except requests.exceptions.RequestException as e:
        print(f"Error fetching URL: {url}. Reason: {e}")

def handle_unavailable():
    print('https://raw.githubusercontent.com/Rodri200906/IPTV-Rodri/refs/heads/main/.github/Indisponible/Indisponible.m3u8')

print('#EXTM3U')
print('#EXT-X-VERSION:3')
print('#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2560000')

s = requests.Session()
with open('../The_K-pop/The_K-pop.txt') as f:
    for line in f:
        line = line.strip()
        if not line or line.startswith('~~'):
            continue
        if not line.startswith('https:'):
            line = line.split('|')
            ch_name, grp_title, tvg_logo, tvg_id = map(str.strip, line)
            grp_title = grp_title.title()
        else:
            grab(line)

if 'temp.txt' in os.listdir():
    os.remove('temp.txt')
    for filename in os.listdir():
        if filename.startswith('watch'):
            os.remove(filename)

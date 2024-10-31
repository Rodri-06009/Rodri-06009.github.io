#!/bin/bash

echo $(dirname $0)

python3 -m pip install requests

cd $(dirname $0)/

python3 The_K-pop.py > ../The_K-pop/The_K-pop.m3u8

echo m3u grabbed

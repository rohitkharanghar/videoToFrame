#!/bin/bash
if [ "$1" == '' ] || [ "$2" == '' ] || [ "$3" == '' ]; then
    echo "Usage: $0 <input folder> <output folder> <file extension>";
    exit;
fi
for file in "$1"/*."$3"; do
    destination="$2${file:${#1}:${#file}-${#1}-${#3}-1}";
    mkdir -p "$destination";
    ffmpeg -i "$file" -r 1 "$destination/image-%d.jpeg";
done
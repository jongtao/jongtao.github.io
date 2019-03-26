#!/bin/bash
# Removes geotag in EXIF data of all JPEG files in the current directory
# Requires Perl exiftool

for i in *.jpg; do echo "Processing $i"; exiftool -geotag= "$i"; done
for i in *.JPG; do echo "Processing $i"; exiftool -geotag= "$i"; done

#!/bin/bash

# Given a list of paths scales images to specified maximum dimentions
# puts results in a new "converted_thumbs" directory at PWD
# Parameters are configured for 450x450 large thumbnails

width=450
height=450
format_suffix=jpg
dest=converted_thumbs
quality=75

mkdir -p $dest
echo $@

for file in $@
do
	in=$(basename "$file")
	out=`echo $file | sed 's/\.+$/\.$format_suffix/'`
	convert $in -resize ${width}x${height}^ -quality $quality $dest/$out
done

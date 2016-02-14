#!/bin/bash
# Scales images to specified maximum dimentions
width=1024
height=1014
format_suffix=jpg
dest=converted_img
quality=60

mkdir -p $dest
echo $@

for file in $@
do
	in=$(basename "$file")
	out=`echo $file | sed 's/\.+$/\.$format_suffix/'`
	convert $in -resize ${width}x${height}^ -quality $quality $dest/$out
done

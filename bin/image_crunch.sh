#!/bin/bash
# Scales images to specified maximum dimentions
width=900
height=900
format_suffix=jpg
dest=converted_img

mkdir -p $dest
echo $@

for file in $@
do
	in=$(basename "$file")
	out=`echo $file | sed 's/\.+$/\.$format_suffix/'`
	convert $in -resize ${width}x${height}^ $dest/$out
done

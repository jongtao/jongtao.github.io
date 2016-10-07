#!/bin/bash

# Given a list of paths scales images to specified maximum dimentions
# puts results in a new "converted_img" directory at PWD
# Parameters are configured for 1024x1024 "full size" images


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

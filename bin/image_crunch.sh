#!/bin/bash
# Scales images to specified maximum dimentions
width=512
height=512
format=jpeg

mkdir -p img
echo $@

for file in $@
do
	in=$(basename "$file")
	out=`echo $in | sed 's/\.+$/\.$format/'`
	ffmpeg -i $file -q:v 1 -vf\
	"scale=iw*min($width/iw\,$height/ih):ih*min($width/iw\,$height/ih)"\
	 img/$out
done

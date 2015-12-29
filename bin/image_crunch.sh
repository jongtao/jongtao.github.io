#!/bin/bash
# Scales images to specified maximum dimentions
width=900
height=900
format=jpeg
# 2-31. 31 is worst quality
quality=2

mkdir -p img
echo $@

for file in $@
do
	in=$(basename "$file")
	out=`echo $in | sed 's/\.+$/\.$format/'`
	ffmpeg -i $file -q:v $quality -vf\
	"scale=iw*min($width/iw\,$height/ih):ih*min($width/iw\,$height/ih)"\
	 img/$out
done

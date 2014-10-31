#!/bin/bash
# Scales images so longest side is 1024 pixels
width=1024
height=1024
format=png

mkdir -p img
echo $@

for file in $@
do
	in=$(basename "$file")
	out=`echo $in | sed 's/\.+$/\.$format/'`
	avconv -i $file -q:v 1 -vf\
	"scale=iw*min($width/iw\,$height/ih):ih*min($width/iw\,$height/ih)"\
	 img/$out
done

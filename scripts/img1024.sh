#!/bin/bash
# Scales images so longest side is 1024 pixels
width=1024
height=1024

mkdir -p img
echo $@

for file in $@
do
	in=$(basename "$file")
	out=`echo $in | sed 's/\.+$/\.png/'`
	avconv -i $file -vf\
	 "scale=iw*min($width/iw\,$height/ih):ih*min($width/iw\,$height/ih)"\
	 img/$out
done

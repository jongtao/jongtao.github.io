#!/usr/bin/bash

if [ $# -ne 1 ]; then
	echo "Usage: `basename $0` [PDF file]" 1>&2
	exit 1
fi

# high quality density: 600 (may take a lot of time and memory)
# ok quality density: 300

infile=$(basename $1)
filename="${infile%.*}"

echo "Converting to ./$filename.png"
convert -density 600 $1 -alpha off -quality 95 $filename.png

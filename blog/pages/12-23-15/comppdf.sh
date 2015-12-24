#!/bin/bash

# Recompresses PDFs
# J. Tao 2015


# Tweak "quality" for different compression.
# Note: /screen is undesireable for images.

#	-dPDFSETTINGS=configuration
#		Presets the "distiller parameters" to one of four predefined settings:
#
#			/screen selects low-resolution output similar to the Acrobat Distiller
#			"Screen Optimized" setting.
#
#			/ebook selects medium-resolution output similar to the Acrobat Distiller
#			"eBook" setting.
#
#			/printer selects output similar to the Acrobat Distiller "Print Optimized"
#			setting.
#
#			/prepress selects output similar to Acrobat Distiller "Prepress Optimized"
#			setting.
#
#			/default selects output intended to be useful across a wide variety of
#			uses, possibly at the expense of a larger output file. 

quality="/screen"


# Usage: takes an intput PDF and output PDF. When an output PDF is not given,
# the script outputs to STDOUT.
if [ $# -lt 1 -o $# -gt 2 ]; then
	echo "Usage: `basename $0` input.pdf [optional: output.pdf]" 1>&2
	exit 1
fi


# outputs to stdout
if [ $# -eq 1 ]; then
	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=$quality \
	-dNOPAUSE -dQUIET -dBATCH -sOutputFile=%stdout "$1"
fi

# outputs to output file
if [ $# -eq 2 ]; then
	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=$quality \
	-dNOPAUSE -dQUIET -dBATCH -sOutputFile="$2" "$1"
fi

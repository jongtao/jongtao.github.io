#!/bin/bash
files=`find -name "index.html"`
ENTRY="
\n\n\n
<div class=\"page\">\n
<div class=\"headprintable\">\n
\t<div class=\"homelinks\">\n
\t\t\t<a href=\"/\">Home</a></li>\n
\t\t\t: </li>\n
\t\t\t<a href=\"/blog\">Blog</a></li>\n
\t\t\t<a href=\"/things\">Things</a></li>\n
\t\t\t<a href=\"/contact\">Contact</a></li>\n
\t\t</div>\n
</div>\n
</div>\n\n\n"

LINE="'/<BODY>/a\\$ENTRY'"


for file in $files
do
eval	sed -i.bak -e $LINE $file && rm $file.bak
done

#!/bin/bash

# run at root directory

if [ ! -f ./404.html ]; then # quickly check if root
	echo "Not in ROOT directory"
	exit
fi

ENTRY="\t\t\t<a href=\"https://github.com/jongtao\">GitHub</a>"
LINE="'/<a href=\"\/things\">/a\\$ENTRY'"

files=`find -name "index.html"`
#files=templates/post.html

for file in $files
do
	echo $file
	eval sed -i.bak -e $LINE $file
done

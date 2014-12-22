#!/bin/bash

# run at root directory

if [ ! -f ./404.html ]; then # quickly check if root
	echo "Not in ROOT directory"
	exit
fi

DATE=`date "+%m-%d-%y"`
ENTRY="\t\t\t<li><a href="/things/pages/$DATE">\n\
\t\t\t\t: </a></li>"
LINE="'/<ul>/a\\$ENTRY'"


mkdir -p ./things/pages/$DATE
cp ./templates/post.html ./things/pages/$DATE/index.html
eval sed -i.bak -e $LINE ./things/index.html

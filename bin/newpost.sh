#!/bin/bash

# run at root directory

if [ ! -f ./404.html ]; then # quickly check if root
	echo "Not in ROOT directory"
	exit
fi

DATE=`date "+%m-%d-%y"`
DATE2=`date "+%m/%d/%y"`
ENTRY="\t\t\t<li><a href="/blog/pages/$DATE">\n\
\t\t\t\t$DATE2: </a></li>"
LINE="'/<ul>/a\\$ENTRY'"


mkdir -p ./blog/pages/$DATE
cp ./templates/post.html ./blog/pages/$DATE/index.html
eval sed -i.bak -e $LINE ./blog/index.html

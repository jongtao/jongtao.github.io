#!/bin/bash

# Creates a new post by creating a new content directory with the DATE as the
# directory name. The script then appends an entry with the link to the content
# list page.
# Run this from the  root directory

if [ ! -f ./404.html ]; then # quickly check if root
	echo "Not in ROOT directory: 404.html not found"
	echo "Usage: `basename $0` [notes/crafts] title" 1>&2
	exit
fi

# Check number of arguments
if [ $# -ne 2 ]; then
	echo "Invalid number of arguments"
	echo "Usage: `basename $0` [notes/crafts] title" 1>&2
	exit 1
fi

# Check argument validity
if [ $1 != "notes" ] && [ $1 != "crafts" ]; then
	echo "Post type $1 not recognized"
	echo "Usage: `basename $0` [notes/crafts] title" 1>&2
	exit 1
fi


TYPE=$1
TITLE=$2

DATE=`date "+%m-%d-%y"`
DATE2=`date "+%m/%d/%y"`


# Create new post directory and copy template to it
mkdir ./content/$DATE
cp ./templates/post.html ./content/$DATE/index.html
# Insert title into post
sed -i -e "s/POST_TITLE/$TITLE/g" ./content/$DATE/index.html


# Add entry to content list page
if [ $TYPE == "notes" ]; then
	ENTRY="<li><a href=\"../content/$DATE\"> $DATE2: $TITLE</a></li>"
else # TYPE == "crafts"
	ENTRY="<li><a href=\"../content/$DATE\"> $TITLE</a></li>"
fi

AFTER="<ul>"
sed -i -e "/$AFTER/a $ENTRY" ./$TYPE/index.html


# Add entry to changelog
ENTRY="<li><a href=\"../content/$DATE\"> Added $DATE2: $TITLE</a></li>"
AFTER="<ul>"
sed -i -e "/$AFTER/a $ENTRY" ./changelog/index.html


# Add entry to recent changes
ENTRY="<li><a href=content/$DATE> Added $DATE2: $TITLE</a></li>"
AFTER="<ul>"
sed -i -e "/$AFTER/a $ENTRY" ./index.html

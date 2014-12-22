# used to fix id to class
files=`find -name "index.html"`

for file in $files
do
	sed -i.bak -e 's/id="page"/class="page"/g' $file && rm $file.bak
	sed -i.bak -e 's/id="printable"/class="printable"/g' $file && rm $file.bak
done

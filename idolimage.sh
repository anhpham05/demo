#!/bin/bash
cd ~
	if [ -d ~/folder ]; then
	echo "file exists"
	else
	mkdir folder
	fi;
cd folder
function filename()
{
for i in 0 1 2 3 4 5 6 
do
	now=$(date  +%d-%m-%Y -d "$DATE + $i day")
        if [ -d ~/folder/$now ]; then
        echo "Directory already exists"
	continue
        fi
        mkdir $now 
done
}
n=0
function download_image()
{
while read name 
do
  now=$(date  +%d-%m-%Y -d "$DATE + $n day")
  cd ~/folder/$now
  imagelink=$(wget  --user-agent 'Mozilla/5.0' -qO- "www.google.be/search?q=$name\&tbm=isch" | sed 's/</\n</g' | grep '<img'| tail -n1 | sed 's/.*src="\([^"]*\)".*/\1/')
  wget -O "$name" $imagelink
  ((n++))
done < ~/javidolname.txt
}
filename
download_image

#! /bin/sh

if [ "$1" = "" ]; then
  echo "No directory path";
  exit;
fi

if [ ! -d "$1" ]; then
  echo "Invalid directory path";
  exit;
fi

name="$2"
if [ "$2" = "" ]; then
  name=$(echo "$1" | sed -e 's|/|_|g' -e 's|^_||' -e 's|_$||')
  echo "No name, defaulting to $name"
fi

touch maps.txt;
echo "true:$1:files/local/$name.txt" >> maps.txt

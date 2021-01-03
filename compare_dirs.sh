#! /bin/sh


while IFS=: read -r do_this path fn;
do
  if [ "$do_this" = true ]; then
    echo $path // $fn;
    sudo ./hash_dir.sh $path $fn;
  fi
done < maps.txt

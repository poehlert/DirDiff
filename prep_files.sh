#! /bin/sh

head -4 $1;
printf "\n\n"
head -4 $2;

printf "\n\n\n./compare_files.sh \"$1\" \"$2\" \n";
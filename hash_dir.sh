#! /bin/sh

find $1 -type f -exec md5sum {} \+ | sort -k 2 > $2;

#! /bin/sh

# $1 - file 1
# $2 - file 2 
# $3 - prefix 1
# $4 - prefix 2

fn_a="$1"
fn_b="$2"
pf_a="$3"
pf_b="$4"
a=/tmp/cf_a;
b=/tmp/cf_b;

if [ ! -f "$fn_a" ]; then
  echo "Specify a real file for param 1 $fn_a";
  exit;
fi

if [ ! -f "$fn_b" ]; then
  echo "Specify a real file for param 2 $fn_b";
  exit;
fi

if [ "" = "$pf_a" ]; then
  head -4 $fn_a;
  echo "Enter prefix for first file:"
  read pf_a;
fi

if [ "" = "$pf_b" ]; then
  head -4 $fn_b;
  echo "Enter prefix for first file:"
  read pf_b;
fi

# printf "DEBUG:\n
# $fn_a
# $fn_b
# $pf_a
# $pf_b
# $a
# $b
# "

cp -f $fn_a $a;
cp -f $fn_b $b;

[ "" != "$pf_a" ] && sed -i "s|$pf_a||g" $a;
[ "" != "$pf_b" ] && sed -i "s|$pf_b||g" $b;

/usr/bin/git diff --stat $a $b

printf "\n\n
diff $a $b
kdiff3 $a $b\n\n"
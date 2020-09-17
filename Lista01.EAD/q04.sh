#!/bin/bash

i=1
outfile="/tmp/que_lista_linda.txt"
if test -f $outfile
then
  rm $outfile
fi
touch $outfile
for dir in "$@"
do
	echo "listando diretório($i): $dir"
	ls -la $dir >> $outfile
  i=$((i + 1))
  if (( $i >= 4 ))
  then
	  break
  fi  
done
echo "fim"
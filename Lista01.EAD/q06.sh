#!/bin/bash

strdate=`date +%Y-%m-%d`
outdir=/tmp/$strdate
if [ ! -d $outdir ]
then
  echo "Criando pasta de destino: $outdir"
  mkdir $outdir   
fi
cp ./*.* $outdir/
zip -r $strdate.zip $outdir

#! /bin/bash

<< 'DESC'
      Escreva  um  script  que  receba  o  nome  de  um  diretório  como  argumento  de  linha  de  comando. todos os arquivos deste diretório devem ser compactados. O nome do arquivo compactado deve ser dd.mm.yy.zip (dd = dia, mm = mês, yy = ano).
DESC

d='date +%d.%m.%y'

zipname=$($d).zip

echo "Criando ${zipname} com todos os arquivos de ${1}"
[[ -d ${1} ]] && zip -r ${zipname} ${1} || echo "Caminho ${1} não encontrado!"

echo 'fim'

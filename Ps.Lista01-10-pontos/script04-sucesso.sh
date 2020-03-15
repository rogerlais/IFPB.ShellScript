#! /bin/bash

<< 'DESC'
      sucesso.sh:  Este  script  deve  receber  o  nome  de  um  arquivo  como  parâmetro  e,  caso  este arquivo exista, deve concatenar o seu conteúdo no arquivo lista_sucesso.txt.
DESC

ls *.${1} 2> /dev/null || cat "${1}" >> lista_sucesso.txt


echo 'fim'

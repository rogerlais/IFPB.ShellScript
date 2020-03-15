#! /bin/bash

<< 'DESC'
      teste.sh: Recebe um nome de arquivo como argumento de linha de comando. Caso o arquivo exista, deve chamar o script sucesso.sh. Caso contrário deve chamar o script falha.sh.
DESC

ls *.${1} 2> /dev/null && ./sucesso.sh ${1} || ./falha.sh "${1}"


echo 'fim'

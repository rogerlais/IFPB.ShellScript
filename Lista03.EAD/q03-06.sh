#!/bin/bash

<<'DESC'
Escreva um script que recebe o nome de 3 arquivos como parâmetros de linha de comando e pede para o usuário digitar uma palavra (denominada texto proibido). 
Imprima na tela o NOME dos arquivos que possuem este texto proibido, e mova estes arquivos (que possuem o texto proibido) para a pasta /tmp.
DESC

#Define arquivos de entrada
f1=$1
f2=$2
f3=$3

#dados forcados
export DBG_ENV="DBG"
if [[ -v "${DBG_ENV}" ]]; then
    #Ajuste de depuracao
    f1="${PWD}/dados/dado1.txt"
    f2="${PWD}/dados/dado2.txt"
    f3="${PWD}/dados/dado3.txt"
fi

read forbiden -p "Informa a palavra proibida: "

if grep -q ${forbiden } ${f1}; then
    echo "Palavra encontrada em ${f1}"
    mv ${f1} /tmp
fi


echo 'FIM'

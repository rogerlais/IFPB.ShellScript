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
export DBG_ENV=$(test "${DBG^^}" == "'YES'" && echo "1" || echo "0")

if ((${DBG_ENV})); then
    #Ajuste de depuracao
    f1="${PWD}/dados/dado1.txt"
    f2="${PWD}/dados/dado2.txt"
    f3="${PWD}/dados/dado3.txt"
fi

read -p "Informa a palavra proibida: " forbiden
echo "Procurando por: ${forbiden}"

if grep -q -w ${forbiden} ${f1}; then
    echo "Palavra encontrada em ${f1}"
    mv ${f1} /tmp
fi

if grep -q -w ${forbiden} ${f2}; then
    echo "Palavra encontrada em ${f2}"
    mv ${f2} /tmp
fi

if grep -q -w ${forbiden} ${f3}; then
    echo "Palavra encontrada em ${f3}"
    mv ${f3} /tmp
fi


echo 'FIM'

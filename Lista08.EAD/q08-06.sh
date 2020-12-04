#!/bin/bash

<<'DESC'
Escreva um script que exiba um arquivo parte por parte (digamos 10 caracteres em cada parte), esperando por um enter, até o fim do arquivo.

Por exemplo, considere o arquivo:

01234567890abcdefghij01234567890123456789012345
01234567890abcdefghij01234567890123456789012345
01234567890abcdefghij01234567890123456789012345

O script deve imprimir:

Exibindo as colunas de 1 a 10 (enter para continuar):

0123456789
0123456789
0123456789
Exibindo as colunas de 11 a 20 (enter para continuar):

abcdefghij
abcdefghij
abcdefghij

...
DESC

#dados forcados
export DBG_ENV="DBG"
if [[ -v "${DBG_ENV}" ]]; then
    #!Ajuste de depuracao! erro se linha não nula não for inserida abaixo
    echo "debug mode!" >/dev/null
    dataFile="${PWD}/dados/datafile08-06.txt"
else
    dataFile=${1}
fi
clear

#ponto de entrada(main)
content="dummy"
start=1
stop=10
until [ ! -n "${content}" ]; do
    content=$(cut -c "${start}-${stop}" "${dataFile}")
    if [ -n "${content}" ]; then
        echo "${content}"
        ((start += 10))
        ((stop += 10))
        read -p "Pressione <ENTER> para continar.." dummy
    fi
done

echo 'FIM'

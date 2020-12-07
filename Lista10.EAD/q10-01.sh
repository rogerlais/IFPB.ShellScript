#!/bin/bash

<<'DESC'
1 - Escreva um script que, baseado em opções de linha de comando:
a - Remova todas as letras de um arquivo.
b - Remova todos os dígitos de um arquivo.
c - Remova todos os caracteres que não são letras nem dígitos de um arquivo.
DESC

#dados forcados
export DBG_ENV=$(test "${DBG^^}" == "'YES'" && echo "1" || echo "0")

if ((${DBG_ENV})); then
    #!Ajuste de depuracao! erro se linha não nula não for inserida abaixo
    echo "debug mode!" >/dev/null
    srcFile=${PWD}/dados/dado2.txt
else
    srcFile=${1}
fi
clear

#ponto de entrada(main)
noCharsFile="${srcFile}.nochars"
noDigitFile="${srcFile}.nodigit"
noSpecialFile="${srcFile}.nospecial"

echo "Removendo todas as letras do arquivo: ${srcFile}"
sed -E 's/[a-z]?//gi' <"${srcFile}"
read -p "Pressione <ENTER> para continuar..." dummy
echo "Removendo todas os números do arquivo: ${srcFile}"
sed -E 's/[0-9]?//g' <"${srcFile}"
read -p "Pressione <ENTER> para continuar..." dummy
echo "Removendo todos os caracteres não alfanuméricos arquivo: ${srcFile}"
sed -E 's/[^a-Z|0-9]?//g' <"${srcFile}"
read -p "Pressione <ENTER> para continuar..." dummy

echo 'FIM'

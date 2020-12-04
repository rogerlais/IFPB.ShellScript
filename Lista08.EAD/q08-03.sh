#!/bin/bash

<<'DESC'
Escreva um script que use o comando tr para remover linhas vazias de um arquivo, isto é, linhas que possuem apenas o enter (\n).
DESC

#dados forcados
export DBG_ENV="DBG"
if [[ -v "${DBG_ENV}" ]]; then
    #!Ajuste de depuracao! erro se linha não nula não for inserida abaixo
    echo "debug mode!" >/dev/null
    dataFile="${PWD}/dados/dado2.txt"
else
    dataFile=${1}
fi
clear

#ponto de entrada(main)
echo "Removendo linhas vazias de ${dataFile}"
outputFile="${dataFile}.trim"
cat "${dataFile}" | tr -s '\n' '\n' >${outputFile}

echo 'FIM'

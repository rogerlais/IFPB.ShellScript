#!/bin/bash

<<'DESC'
Escreva um script que receba o nome de um arquivo e um número (y) como parâmetros de linha de comando. 
O script deve imprimir a coluna número y do arquivo.
DESC

#dados forcados
export DBG_ENV=$(test "${DBG^^}" == "'YES'" && echo "1" || echo "0")

if ((${DBG_ENV})); then
    #!Ajuste de depuracao! erro se linha não nula não for inserida abaixo
    echo "debug mode!" >/dev/null
    if [ -n "${2}" ]; then
        targetFile=$(eval echo "${1}")
        targetCol="${2}"
    else
        targetFile="${PWD}/dados/colunas.txt"
        targetCol=2
    fi
else
    targetFile=${1}
    targetCol=${2}
fi
clear

#ponto de entrada(main)
echo "Avaliando a coluna ${targetCol} do arquivo: ${targetFile}"
if [ -f "${targetFile}" ] && [ -r "${targetFile}" ]; then
    cut -c "${targetCol}" "${targetFile}"
else
    echo "Arquivo ${targetFile} não pode ser lido"
fi

echo 'FIM'

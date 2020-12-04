#!/bin/bash

<<'DESC'
Escreva um script que receba o nome de um arquivo e um número (x) como parâmetros de linha de comando. O script deve imprimir a linha número x do arquivo.
DESC

#dados forcados
export DBG_ENV="DBG"
if [[ -v "${DBG_ENV}" ]]; then
    #!Ajuste de depuracao! erro se linha não nula não for inserida abaixo
    echo "debug mode!" >/dev/null
    if [ -n "${2}" ]; then
        targetFile=$(eval echo "${1}")
        targetLine="${2}"
    else
        targetFile=$(eval "${PWD}/dados/dado3.txt")
        targetLine=5
    fi
else
    targetFile=${1}
    targetLine=${2}
fi
clear

#ponto de entrada(main)
echo "Avaliando a linha ${targetLine} do arquivo: ${targetFile}"
if [ -f "${targetFile}" ] && [ -r "${targetFile}" ]; then
    head "-${targetLine}" "${targetFile}" | tail -1
else
    echo "Arquivo ${targetFile} não pode ser lido"
fi

echo 'FIM'

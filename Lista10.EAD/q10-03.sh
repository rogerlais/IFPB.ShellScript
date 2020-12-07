#!/bin/bash

<<'DESC'
Escreva um script que remova todos os números de telefone de um arquivo de entrada, 
alterando o seu valor para **CENSURADO**.
DESC

#dados forcados
export DBG_ENV=$(test "${DBG^^}" == "'YES'" && echo "1" || echo "0")

if ((${DBG_ENV})); then
    #!Ajuste de depuracao! erro se linha não nula não for inserida abaixo
    echo "debug mode!" >/dev/null
    dataFile="${PWD}/dados/datafile10-03.txt"
else
    if [ -n ${1} ]; then
        dataFile="${1}"
    else
        dataFile="${PWD}/../dados/datafile10-03.txt"
    fi
fi
clear

#ponto de entrada(main)
outFile="${dataFile}.sanitized"
echo -e "Usando arquivo ${dataFile} com os dados de entrada e ${outFile} como saída."

#[ ]*[+][0-9]{2,3}[ -]*[(]{0,1}[0-9]{2,3}[)]{0,1}[ ]*[0-9]{4,5}[- ]*[0-9]{4,5}
sed -E "s/[ ]*([+][0-9]{2,3})*[ -]*([(]{0,1}[0-9]{2,3}[)]{0,1})*[ ]*[0-9]{4,5}[- ]*[0-9]{4,5}/ **CENSURADO**/g" "${dataFile}" > "${outFile}"

echo 'FIM'

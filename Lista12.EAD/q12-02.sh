#!/bin/bash

<<'DESC'
Considere o seguinte arquivo:

    A 10
    B 20
    A 15
    C 12
    D 21
    B 12
    C 21

Escreva um script que, para cada nome na coluna 1, some os números da coluna 2, totalizando-os. 
Use arrays associativos, pois os nomes da coluna 1 podem mudar.
DESC

#dados forcados
export DBG_ENV=$(test "${DBG^^}" == "'YES'" && echo "1" || echo "0")

if ((${DBG_ENV})); then
    #!Ajuste de depuracao! erro se linha não nula não for inserida abaixo
    echo "debug mode!" >/dev/null
    dataFile="${PWD}/dados/datafile12-02.txt"
else
    dataFile="${PWD}/../dados/datafile12-02.txt"
fi
clear

#ponto de entrada(main)
declare -A DATA
while IFS="\n" read -r currLine || [ -n "$currLine" ]; do
    IFS=' ' read -r -a array <<<"${currLine}"
    key="${array[0]}"
    value="${array[1]}"
    if [ -n "${DATA[$key]}" ]; then
        DATA[$key]=$(("${DATA[$key]}" + "${value}"))
    else
        DATA[$key]="${value}"
    fi
done <"${dataFile}"

echo "Totalizando os elementos:"
for key in ${!DATA[*]}; do
    echo -e "Elemento ${key} = ${DATA[$key]}"
done

echo 'FIM'

#!/bin/bash

<<'DESC'
Escreva um script que exiba um arquivo parte por parte (digamos 10 linhas em cada parte), esperando por um enter, até o fim do arquivo.
DESC

function get-ceiling() {
    num=${1}
    divisor=${2}
    result=$((((${num} - (${num} % ${divisor})) / ${divisor}) + 1))
    echo ${result}
}

#dados forcados
export DBG_ENV=$(test "${DBG^^}" == "'YES'" && echo "1" || echo "0")

if ((${DBG_ENV})); then
    #!Ajuste de depuracao! erro se linha não nula não for inserida abaixo
    echo "debug mode!" >/dev/null
    dataFile="${PWD}/dados/datafile07-04.txt"
else
    dataFile=${1}
fi
clear

#ponto de entrada(main)
echo "Exibindo arquivo: ${dataFile}"
page=0
totalLines=$(wc -l <"${dataFile}")
totalPages=$(get-ceiling $totalLines 10)
while [ $page -lt $totalPages ]; do
    ((page++))
    range=$((10 * $page))
    #echo "página = ${page} Range = ${range}"    
    head "-${range}" "${dataFile}" | tail -10
    read -p "Pressione <ENTER> para continuar..." dummy
done

echo 'FIM'

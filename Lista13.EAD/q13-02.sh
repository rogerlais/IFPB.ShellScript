#!/bin/bash

<<'DESC'
Considere o seguinte arquivo:

12 10 13 14
6 5 -9 11 12 4
15
12 3
21 1 2 3 4 5 6 7 8 9
6

Escreva um script que importe as funções da questão anterior e use-as para encontrar o menor e o maior número do arquivo apresentado acima.

DESC

#dados forcados
export DBG_ENV=$(test "${DBG^^}" == "'YES'" && echo "1" || echo "0")
clear
if ((${DBG_ENV})); then
    #!Ajuste de depuracao! erro se linha não nula não for inserida abaixo
    echo "debug mode!" >/dev/null
    dataFile="${PWD}/dados/datafile13-02.txt"
    source ./Lista13.EAD/q13-01.sh
else
    dataFile="${PWD}/../dados/datafile13-02.txt"
    source ./q13-01.sh
fi

#ponto de entrada(main)
echo "Lendo dados de ${dataFile}"
declare -a numbers
while IFS=" \n" read -r currLine || [ -n "$currLine" ]; do
    #echo "Valor lido: ${currLine}"
    IFS=' ' read -r -a lineArray <<<"${currLine}"
    numbers=(${numbers[@]} ${lineArray[@]})
    unset lineArray #Zera o temporario
done <"${dataFile}"

#iterar elementos do vetor para encontrar os limites
minValue=${numbers[0]}  #todo Validar ao menos um elemento no array?
maxValue=${numbers[0]}
for num in ${numbers[*]}; do
    minValue=$(lower ${minValue} ${num})
    maxValue=$(higher ${maxValue} ${num})
done
echo "Resultados:"
echo "Maior valor = ${maxValue}"
echo "Menor valor = ${minValue}"

echo 'FIM'

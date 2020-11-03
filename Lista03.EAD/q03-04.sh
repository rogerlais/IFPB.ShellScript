#!/bin/bash

<<'DESC'
Escreva um script que receba três nomes de diretórios como argumentos de linha de comando e imprima estes nomes em ordem crescente de quantidade de arquivos.
DESC

#coleta dos dados
d1=$1
d2=$2
d3=$3
#Dados forcados
d1="${PWD}/Lista01.EAD"
d2="${PWD}/Lista02.EAD"
d3="${PWD}/Lista03.EAD"

clear
echo "Executando em: ${PWD}"

#Leitura das qUantidades de arquivos
dirCount1=$(ls ${d1} | wc -l)
dirCount2=$(ls ${d2} | wc -l)
dirCount3=$(ls ${d3} | wc -l)

#montagem da lista sem ordem
result=""
printf -v txt "%05d\t%s\n" ${dirCount1} ${d1}
result="${result}${txt}"
printf -v txt "%05d\t%s\n" ${dirCount2} ${d2}
result="${result}${txt}"
printf -v txt "%05d\t%s\n" ${dirCount3} ${d3}
result="${result}${txt}"
result=$(echo "${result}" | sort)

#exibe resultado
echo "${result}"

echo 'FIM'

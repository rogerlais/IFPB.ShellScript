#!/bin/bash

<< 'DESC'
Escreva um script que recebe 3 nomes de diretórios como parâmetros de linha de comando, checa se estes 
diretórios existem (caso não exista algum, deve sair do programa), e imprime a soma do número 
arquivos (ou diretórios) dentro dos diretórios passados. 
Utilize substituição de shell e o comando ls | wc -l para contar o número de arquivos de cada diretório.
DESC

clear
d1=${1}
d2=${2}
d3=${3}

echo "Testando relativos ao caminho: ${PWD}"

[ -d $d1  ] && [ -d $d2  ] && [ -d $d3  ] && inputTest=true || inputTest=false

if [[ "$inputTest" == false ]]; then
    echo 'Ao menos um dos diretórios está faltando'
    exit
fi
dir1Count=($(ls ${d1} -l | wc -l)-1)
dir2Count=($(ls ${d2} -l | wc -l)-1)
dir3Count=($(ls ${d3} -l | wc -l)-1)
totalEntries=$((${dir1Count} + ${dir2Count} + ${dir3Count}))
echo " A soma das linhas dos arquivos vale: ${totalEntries}"

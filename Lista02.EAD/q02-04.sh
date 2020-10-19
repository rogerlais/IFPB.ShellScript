#!/bin/bash

<< 'DESC'
Escreva um script que recebe 3 nomes de arquivo como parâmetros de linha de comando, checa se estes arquivos existem (caso não exista algum, deve sair do programa), e imprime a soma dos números de linhas dos 3 arquivos. Utilize substituição de shell e o comando wc -l para contar o número de linhas de cada arquivo.
DESC

clear

f1=${1}
f2=${2}
f3=${3}

echo "Testando para o caminho: ${PWD}"

[ -f $f1  ] && [ -f $f2  ] && [ -f $f3  ] && inputTest=true || inputTest=false

if [[ "$inputTest" == false ]]; then
    echo 'Ao menos um dos arquivos está faltando'
    exit
fi

f1Lines=$(wc -l < ${f1})
f2Lines=$(wc -l < ${f2})
f3Lines=$(wc -l < ${f3})
totalLines=$((${f1Lines} + ${f2Lines} + ${f3Lines}))
echo " A soma das linhas dos arquivos vale: ${totalLines}"
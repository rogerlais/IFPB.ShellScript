#!/bin/bash

clear
echo "Escreva um script que recebe 3 nomes de arquivo como parâmetros de linha de comando,"
echo "checa se estes arquivos existem (caso não exista algum, deve sair do programa), e imprime a soma dos números de linhas dos 3 arquivos."
echo "Utilize substituição de shell e o comando wc -l para contar o número de linhas de cada arquivo."
echo $PWD

f1="./Lista02.EAD/sc04-02.sh"
f2="./Lista02.EAD/sc04-02.sh"
f3="./Lista02.EAD/sc04-02.sh"

[ -f $f1  ] && [ -f $f2  ] && [ -f $f3  ] && inputTest=true || inputTest=false

if [[ "$inputTest" == false ]]; then
    echo 'Ao menos um dos arquivos está faltando'
    exit
fi

ft2="$(test -f "${2}")"
ft3="$(test -f "${3}")"
echo ${ft1}
echo "valor para ${1} = -${ft1}-"
#if[ ${ft1} -a $(-f ${2}) -a $(-f ${3}) ]
if[ ${ft1} ]
then
    echo "Somatorio de linhas"
else
    echo "Requisitos faltosos"
fi
#!/bin/bash

<< 'DESC'
Escreva um script que receba três nomes de arquivos como argumentos de linha de comando e imprima estes nomes em ordem crescente de número de linhas.
DESC

echo "Executando em: ${PWD}"

#Define arquivos de entrada
f1=$1
f2=$2
f3=$3


f1="${PWD}/Lista03.EAD/q03-01.sh"
f2="${PWD}/Lista03.EAD/q03-02.sh"
f3="${PWD}/Lista03.EAD/q03-03.sh"


echo ${f1}


#Caso não exista arquivo valor nulo
l1=(wc -l ${f1})||0
l2=(wc -l ${f2})||0
l3=(wc -l ${f3})||0

#monta matriz de operacao

#!/bin/bash

#teste das variaveias

#test a
if [ -z "${a}" ]; then
    read -p "Informe o valor de a: " a
    echo "Valor de A lido pelo shell atual = ${a}"
else
    echo "Valor de A exportado pelo shell anterior = ${a}"
fi


#test b
if [ -z "${b}" ]; then
    read -p "Informe o valor de B: " b
    echo "Valor de B lido pelo shell atual = ${b}"
else
    echo "Valor de B exportado pelo shell anterior = ${b}"
fi


#test c
if [ -z "${c}" ]; then
    read -p "Informe o valor de C: " c
    echo "Valor de C lido pelo shell atual = ${c}"
else
    echo "Valor de C exportado pelo shell anterior = ${c}"
fi

#!/bin/bash

# 2 - Escreva um script que peça para o usuário digitar 3 nomes de arquivo e imprima o nome daquele que possui o maior número de linhas.

max_idx=0
max_lines=0

read -p "digite nome arquivo(1) : " if1
read -p "digite nome arquivo(1) : " if2
read -p "digite nome arquivo(1) : " if3

declare -a StringArray=( "./Lista03.EAD/sc02-03.sh" ${if1} ${if2} ${if3} )

idx=0
for currname in ${StringArray[@]}; do
    ((idx++))
    echo ${currname}
    echo ${idx}
    if test -f "${currname}" ; then
        currlines=$(wc -l "${currname}")
    else
        currlines=0
    fi
    if  "${currlines}" -gt "${max_lines}" ; then
        max_lines = ${currlines}
        max_idx=${idx}
    fi
done